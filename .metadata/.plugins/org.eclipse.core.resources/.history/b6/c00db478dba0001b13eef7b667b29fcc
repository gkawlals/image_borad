package poly.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import poly.dto.ImageDTO;
import poly.service.IImageService;

@Controller
public class ImageController {
	
	private Logger log = Logger.getLogger(this.getClass());

	
	@Resource(name = "ImageService")
	private IImageService imageService;

	@RequestMapping(value="image/imageList", method=RequestMethod.GET)
	public String ImageList(ModelMap model) {
		

		List<ImageDTO> rList = imageService.getImageList();
		// DTO의 모든것들을 불러옴 
		if (rList == null) {
			rList = new ArrayList<>();
		}
		
		model.addAttribute("rList", rList);
		

		log.info("ImageList 불러오기");

		for (ImageDTO e : rList) {

			log.info("BoardList 1번 : " + e.getImage_no());

		}
			
		rList = null;
		
		return "image/imageList";
		
	}
}
