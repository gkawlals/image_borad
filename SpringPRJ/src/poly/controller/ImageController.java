package poly.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.ImageDTO;
import poly.service.IImageService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.FileUtil;

@Controller
public class ImageController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FILE_UPLOAD_SAVE_PATH = "/Users/hamjimin/Desktop/Spring_Settings/Spring_imgboard/SpringPRJ/WebContent/resourceImg/Image/";
		
	@Resource(name = "ImageService")
	private IImageService imageService;
	
	@RequestMapping(value="image/imagetest")
	public String imagetest() {
		return "image/imagetest";
	}
	
	@RequestMapping(value="image/imageList")
	public String imageList() {
		return "image/imageList";
	}

	@RequestMapping(value="/image/imageUpload")
	public String imageUpload( HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam(value="fileUpload")MultipartFile mf) throws IOException{
		log.info(this.getClass().getName() + " . imageUpload start !");
		
		String org_file_name = mf.getOriginalFilename();
		// test를 위한 파라미터로 불러오기
	//	String filename = CmmUtil.nvl(request.getParameter("saveFileName"));
		log.info(org_file_name);
		String ext = org_file_name.substring(org_file_name.lastIndexOf(".") + 1, org_file_name.length()).toLowerCase();
		// 저장되는 파일이 이미지 파일만 저장되게끔 설정해주기
		if(ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
			
			String save_file_name = DateUtil.getDateTime("24hhmmss") + "." + ext;
			
			String save_folder_name = DateUtil.getDateTime("24hhmmss");
			
			String save_file_path = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);
			
			String fullFileInfo = save_file_path + "/" + save_file_name;
			
			String one_title = CmmUtil.nvl(request.getParameter("one_title"));
			
			log.info("ext : " + ext);
			log.info("saveFilename : " + CmmUtil.nvl(save_file_name));
			log.info("save_file_path : " + CmmUtil.nvl(save_file_path));
			log.info("fullFileInfo : " + CmmUtil.nvl(fullFileInfo));
			log.info("save_folder_name : " + CmmUtil.nvl(save_folder_name));
			log.info("one title : " + CmmUtil.nvl(one_title));
			
			mf.transferTo(new File(fullFileInfo));
			log.info(" mf.transfer Success ");
			ImageDTO pDTO = new ImageDTO();
			
			pDTO.setOne_title(one_title);
			pDTO.setSave_file_name(save_file_name);
			pDTO.setSave_file_path(save_file_path);
			pDTO.setOrg_file_name(org_file_name);
			pDTO.setExt(ext);
			pDTO.setReg_id("admin");
			pDTO.setSave_folder_name(save_folder_name);
			
			int res = imageService.getInsertImage(pDTO);
			
			if (res < 1) {
				// 실패
				log.info(this.getClass().getName() + " insert Failed!");
			} else {
				// 성공
				log.info(this.getClass().getName() + " insert success!");
			}


			
		}else 
		
		
		log.info(this.getClass().getName() + " . imageUpload end !");
		return "/image/imageUpload";
	}
	
	@RequestMapping(value="image/scrolltest")
	public String Scroll() {
		return "image/scrolltest";
	}
	
	@RequestMapping(value="image/imageListTest", method=RequestMethod.GET)
	public String BoardList(ModelMap model) {
		
		List<ImageDTO> rList = imageService.imageListTest();
		
		if(rList == null ) {
			rList = new ArrayList<>();
		}
		
		log.info(" ImageList 불러오기");
		model.addAttribute("rList", rList);
		
		for(ImageDTO e : rList) {
			
			log.info("ImageList " + e.getImage_no() + "번 불러오기");
		}
		
		rList = null;
		
		return "image/imageListTest";
	}
	
	@RequestMapping(value="image/seachList")
	public @ResponseBody List<ImageDTO> searchList(HttpServletRequest request){
		
		log.info("searchList 시작");
		//jsp에서 값을 받아오는 구문
		String post_title = CmmUtil.nvl(request.getParameter("Image_no"));
		log.info(post_title);
		ImageDTO pDTO = new ImageDTO();
		pDTO.setImage_no(post_title);
		
		List<ImageDTO> rList = imageService.searchList(pDTO);

		log.info("SearchList 불러오기 : " + rList.size());

		log.info("searchList 끝");
		
		return rList;
	}
}
