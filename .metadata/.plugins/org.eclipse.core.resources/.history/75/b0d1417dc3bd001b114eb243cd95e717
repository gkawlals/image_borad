package poly.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// main events controller for kakao map
@Controller
public class MainController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@RequestMapping(value="index")
	public String Index() {
		log.info(this.getClass());
		
		return "/index";
	}
	
	@RequestMapping(value="map/circle")
	public String circle() {
		log.info(this.getClass().getName() + " circle.jsp start !");
		return "map/circle";
	}
			
}
