package poly.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import poly.dto.ImageDTO;
import poly.service.IImageService;
import poly.util.CmmUtil;
import poly.util.DateUtil;
import poly.util.FileUtil;

@Controller
public class ImageController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	final private String FILE_UPLOAD_SAVE_PATH = "/Users/hamjimin/imgUpload/Upload/";

	
	@Resource(name = "ImageService")
	private IImageService imageService;
	
	@RequestMapping(value="image/imagetest")
	public String imagetest() {
		return "image/imagetest";
	}

	@RequestMapping(value="/image/imageUpload")
	public String imageUpload( HttpServletRequest request, HttpServletResponse response, 
			ModelMap model, @RequestParam(value="fileUpload")MultipartFile mf) throws IOException{
		log.info(this.getClass().getName() + " . imageUpload start !");
		
		String orcfilename = mf.getOriginalFilename();
		// test를 위한 파라미터로 불러오기
	//	String filename = CmmUtil.nvl(request.getParameter("saveFileName"));
		log.info(orcfilename);
		String ext = orcfilename.substring(orcfilename.lastIndexOf(".") + 1, orcfilename.length()).toLowerCase();
		// 저장되는 파일이 이미지 파일만 저장되게끔 설정해주기
		if(ext.equals("jpeg") || ext.equals("jpg") || ext.equals("gif") || ext.equals("png")) {
			
			String saveFileName = DateUtil.getDateTime("24hhmmss") + "." + ext;
			
			String saveFilePath = FileUtil.mkdirForDate(FILE_UPLOAD_SAVE_PATH);
			
			String fullFileInfo = saveFilePath + "/" + saveFileName;
			
			
			log.info("ext : " + ext);
			log.info("saveFilename : " + CmmUtil.nvl(saveFileName));
			log.info("saveFilePath : " + CmmUtil.nvl(saveFilePath));
			log.info("fullFileInfo : " + CmmUtil.nvl(fullFileInfo));
			
			mf.transferTo(new File(fullFileInfo));
			
			ImageDTO pDTO = new ImageDTO();
			
			pDTO.setImage_name(saveFileName);
			pDTO.setImage_url(saveFilePath);
			pDTO.setOrgfilename(orcfilename);
			pDTO.setExt(ext);
			
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
}
