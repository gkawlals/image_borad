package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.service.IImageService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.FileUtil;

// main events controller for kakao map
@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FILE_UPLOAD_SAVE_PATH = "/data/image/";
	
	// image service import? um....
	@Resource(name = "ImageService")
	private IImageService imageService;
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		
		return "/index";
	}
	
	@RequestMapping(value="map/circle", method=RequestMethod.GET)
	public String circle() {
		log.info(this.getClass().getName() + " circle.jsp start !");
		return "map/circle";
	}
	
	@RequestMapping(value="map/maptest", method=RequestMethod.GET)
	public String position() {
		log.info(this.getClass().getName() + " test start !");
		return "map/maptest";
	}
	
	@RequestMapping(value="map/circleUpload")
	public String circleUpload (HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model, @RequestParam(value="fileUpload")MultipartFile mf) throws IOException {
		log.info(this.getClass().getName() + " . circleInsert start !");
		
		// image file을 MultiPart을 사용하여 File로 받아온다.  
				String org_file_name = mf.getOriginalFilename();
				
				// test를 위한 파라미터로 불러오기
				log.info(org_file_name);
				
				List<UserDTO> uList = userService.getUserList();
				
				List<ImageDTO> rList = imageService.imageListTest();
				
				// image file에 속성을 받아오는 작업
				String ext = org_file_name.substring(org_file_name.lastIndexOf(".") + 1, org_file_name.length()).toLowerCase();
				
				// 저장되는 파일이 이미지 파일만 저장되게끔 설정해주기
				if(ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
					
					// image file을 받아오면 inseert되는 file에대한 정보 저장를 변수에 저장
					String ss_user_id = CmmUtil.nvl((String)session.getAttribute("SS_USER_ID"));
					String save_file_name = DateUtil.getDateTime("HH:mm:ss") + "." + ext;
					String save_folder_name = DateUtil.getDateTime("yyyy.MM.dd");
					// 폴더 생성
					String save_file_path = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);
					
					String fullFileInfo = save_file_path + "/" + save_file_name;
					String one_title = CmmUtil.nvl(request.getParameter("one_title"));
					
					// 잘 받아오는지 확인하기
					log.info(" ext : " + ext);
					log.info(" saveFilename : " + CmmUtil.nvl(save_file_name));
					log.info(" save_file_path : " + CmmUtil.nvl(save_file_path));
					log.info(" fullFileInfo : " + CmmUtil.nvl(fullFileInfo));
					log.info(" save_folder_name : " + CmmUtil.nvl(save_folder_name));
					log.info(" one title : " + CmmUtil.nvl(one_title));
					log.info(" session Id : " + CmmUtil.nvl(ss_user_id));
					
					// file의 정보를 multipart file 넣어준다.
					mf.transferTo(new File(fullFileInfo));
					log.info(" mf.transfer Success ");
					
					// DTO를 불러와 data set해주기
					ImageDTO pDTO = new ImageDTO();
					
					pDTO.setOne_title(one_title);
					pDTO.setSave_file_name(save_file_name.trim());
					pDTO.setSave_file_path(save_file_path.trim());
					pDTO.setOrg_file_name(org_file_name.trim());
					pDTO.setExt(ext);
					pDTO.setReg_id(ss_user_id);
					pDTO.setSave_folder_name(save_folder_name.trim());
					
					// data set 완료하면 service ~ mapper.xml까지 진행
					int res = imageService.getCircleImage(pDTO);
					
					if (res < 1) {
						// insert가 실패 할때
						log.info(this.getClass().getName() + " insert Failed!");
						
						return "/image/imagetest";
						
					} else {
						// insert가 성공 할때 
						log.info(this.getClass().getName() + " insert success!");
					}
					
				}else { 
					return "/image/imageListTest";
				}
				
				model.addAttribute("rList", rList);
				
				model.addAttribute("uList", uList);
		
		log.info(this.getClass().getName() + " . circleInsert end !");
		return null;
	}
			
}
