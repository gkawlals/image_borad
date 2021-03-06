package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.service.IImageService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.FileUtil;

@Controller
public class ImageController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FILE_UPLOAD_SAVE_PATH = "/data/image/"; // localhost : Users/hamjimin/Desktop/data/image
	
	// image service import? um....
	@Resource(name = "ImageService")
	private IImageService imageService;
	
	@Resource(name = "UserService")
	private IUserService userService;
	
	// insert image page open
	@RequestMapping(value="image/imagetest")
	public String imagetest(HttpSession session) {
		
		
		return "image/imagetest";
	}

	// insert image part1
	@RequestMapping(value="/image/imageUpload")
	public String imageUpload( HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model, @RequestParam(value="fileUpload")MultipartFile mf) throws IOException{
		log.info(this.getClass().getName() + " . imageUpload start !");
		
		// image file을 MultiPart을 사용하여 File로 받아온다.  
		String org_file_name = mf.getOriginalFilename();
		
		// test를 위한 파라미터로 불러오
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
			int res = imageService.getInsertImage(pDTO);
			
			
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
		
		log.info(this.getClass().getName() + " . imageUpload end !");
		
		return "/image/imageListTest";
	}
	
	@RequestMapping(value="image/scrolltest")
	public String Scroll() {
		return "image/scrolltest";
	}
	
	// Image board List loading 
	@RequestMapping(value="image/imageListTest", method=RequestMethod.GET)
	public String BoardList(ModelMap model, HttpSession session) {
		log.info(this.getClass().getName() + " Main page Start ! ");
		
		List<ImageDTO> rList = imageService.imageListTest();
		
		List<UserDTO> uList = userService.getUserList();
		
		if(rList == null ) {
			log.info("List for ImageList load Failed !");
			rList = new ArrayList<>();
		}
		
		
		if(uList == null ) {
			log.info("List for UserList load Failed !");
			uList = new ArrayList<>();
		}

		log.info(" ImageList 불러오기");
		
		model.addAttribute("rList", rList);
		
		model.addAttribute("uList", uList);
		
		for( ImageDTO e : rList) {
			log.info("Board no : " + e.getImage_no());
		}
		
		for( UserDTO e : uList) {
			log.info("User no : " + e.getUser_no());
		}

		uList = null;
		
		rList = null;
		
		return "image/imageListTest";
	}
	
	// image board lit in Ajax 
	@RequestMapping(value="image/seachList")
	public @ResponseBody List<ImageDTO> searchList(HttpServletRequest request){
		// ajax와 통신하는 구문
		log.info("searchList 시작");
		//jsp에서 값을 받아온다.
		String post_title = CmmUtil.nvl(request.getParameter("Image_no"));
		
		log.info(post_title);
		
		ImageDTO pDTO = new ImageDTO();
		
		pDTO.setImage_no(post_title);
		
		List<ImageDTO> rList = imageService.searchList(pDTO);

		log.info("SearchList 불러오기 : " + rList.size());

		log.info("searchList 끝");
		
		return rList;
	}
	
	// 모달 페이지로 선택한 이미지 불러오는지 실험하기 
		@RequestMapping(value="image/Detail")
		public String imageDetaile2(HttpServletRequest request, ModelMap model, HttpSession session) {
			// 불러올 정보 = 이미지 번호, 이미지 경로, 이미지 제목
			String image_no = request.getParameter("image_no");
			
			log.info("image_no : "+image_no);
			
			ImageDTO pimgDTO = new ImageDTO();
			
			pimgDTO.setImage_no(image_no);
			
			ImageDTO rimgDTO = imageService.imageDetail(pimgDTO);
			
			model.addAttribute("pimgDTO",rimgDTO);
			
			if(rimgDTO == null) {
				rimgDTO = new ImageDTO();
			}
			
			log.info("image_no : "+ rimgDTO.getImage_no());
			log.info("image_title : "+ rimgDTO.getOne_title());
			log.info("image_file_path : "+ rimgDTO.getSave_file_path());
			
			return"image/image_List";
		}
	
	// 이미지 선택하여 정보확인하기
		@RequestMapping(value="image/imageDetail", method=RequestMethod.GET)
		public String imageDetail ( HttpServletRequest request, ModelMap model, HttpSession session) {
			
			String image_no = request.getParameter("image_no");
			
			String SS_USER_ID = (String)session.getAttribute("SS_USER_ID");
			
			log.info(" user_id : " + SS_USER_ID);
			log.info("image_no : " + image_no);
			
			UserDTO uDTO = new UserDTO();
			ImageDTO pDTO = new ImageDTO();
			
			uDTO.setUser_id(SS_USER_ID);
			pDTO.setImage_no(image_no);
			
			// 유저의 프로필 사진을 들고오기 
			UserDTO urDTO = userService.userListAll(uDTO);
			// 유저가 적은 게시판 상세정보 들고오기
			ImageDTO rDTO = imageService.imageDetail(pDTO);
			
			// jsp에서 import 하여 사용할 변수 이름을 설정해 ADD해준다.
			model.addAttribute("urDTO",urDTO);
			
			model.addAttribute("rDTO",rDTO);
			
			if( rDTO == null) {
				rDTO = new ImageDTO();
			}
			
			// 사용자가 선택한 게시물을 불러오는지 체크하기
			log.info(" ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ   " );
			log.info(" get image_no : " +  rDTO.getImage_no() );
			log.info(" get save_folder_name : " +  rDTO.getSave_folder_name() );
			log.info(" get save_file_name : " +  rDTO.getSave_file_name() );
			log.info(" get Reg_id : " +  rDTO.getReg_id() );
			log.info(" get Chg_dt : " +  rDTO.getChg_dt() );
			log.info(" get ont_title  : " +  rDTO.getOne_title() );
			log.info(" ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ   " );
			// 선택한 사용자의 프로필사진경로를 잘 들고오는지 확인하기
			log.info("get user_id : " + urDTO.getUser_id());
			log.info(" get user_folder_name : " + urDTO.getUser_folder_name());
			log.info(" get User_profile_name : " + urDTO.getUser_profile_name());
			
			return "image/imageDetail";
		}
	
	// 이미지 선택 후 삭제하기
	@RequestMapping(value="image/delImage")
	public String delImage(HttpServletRequest request, ModelMap model) {
		log.info("Image Delete Start !");
		
		String image_no = request.getParameter("image_no");
		
		log.info(image_no);
		
		ImageDTO pDTO = new ImageDTO (); 
		
		pDTO.setImage_no(image_no);
		
		log.info("DTO image_no : " + pDTO.getImage_no());
		
		int res = imageService.delImage(pDTO);

		
		if(res < 1) {
			log.info("이지미 삭제 실패");
		}else { 
			log.info("이미지 삭제 성공");
			return "../user/MyPage";
		}
		
		log.info("Image Delete End !");
		
		return "../user/MyPage";
	}
	
	// 이미지 선택 후 수정하기 
	@RequestMapping(value="image/updateImage")
	public String updateImage(HttpServletRequest request, ModelMap model) {
		
		log.info(" image update start ! ");
		
		String image_no = request.getParameter("image_no");
		String one_title = request.getParameter("one_title");
		
		log.info("load for JSP  image_no : " + image_no);
		log.info("load for JSP  one_title : " + one_title);
		
		ImageDTO pDTO = new ImageDTO(); 
		
		pDTO.setImage_no(image_no);
		pDTO.setOne_title(one_title);
		
		log.info("load for ImageDTO  image_no : " + image_no);
		log.info("load for ImageDTO  one_title : " + one_title);
		
		int res = imageService.updateImage(pDTO);
		
		if(res < 1) {
			log.info("이지미 수정 실패");
			
		}else { 
			log.info("이미지 수정 성공");
			return "../user/MyPage";
		}
		
		
		log.info(" image update end ! ");
		
		return "../user/MyPage";
	}
	
	// MyBoard loading for Ajax 
	@RequestMapping(value="image/loadUserImg")
	public  @ResponseBody List<ImageDTO> loadUserImg (HttpServletRequest request, ModelMap model) {
		
		// ajax와 통신하는 구문
		log.info("searchList 시작");
		//jsp에서 값을 받아온다.
		String image_no = CmmUtil.nvl(request.getParameter("Image_no"));
				
		log.info(image_no);
				
		ImageDTO pDTO = new ImageDTO();
				
		pDTO.setImage_no(image_no);
				
		List<ImageDTO> rList = imageService.loadUserImg(pDTO);
		
		log.info("SearchList 불러오기 : " + rList.size());
		
		log.info("searchList 끝");
	
		
		return rList;
	}
	
	// circle image upload 
	@RequestMapping(value="/image/circleUpload")
	public String circleUpload (HttpServletRequest request, HttpServletResponse response, HttpSession session,
			ModelMap model, @RequestParam(value="circleUpload")MultipartFile mf) throws Exception {
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
					String location = CmmUtil.nvl(request.getParameter("location"));
					String fullFileInfo = save_file_path + "/" + save_file_name;
					String one_title = CmmUtil.nvl(request.getParameter("cir_title"));
					
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
					
					res = imageService.insertMongo(location, ss_user_id);
					
				}else { 
					return "/image/imageListTest";
				}
				
				model.addAttribute("rList", rList);
				
				model.addAttribute("uList", uList);
		
		log.info(this.getClass().getName() + " . circleInsert end !");
		
		return "/image/imageListTest";
	}
	
}
