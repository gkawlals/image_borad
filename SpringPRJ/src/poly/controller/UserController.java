package poly.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.service.IImageService;
import poly.service.IUserService;
import poly.util.CmmUtil;
import poly.util.EncryptUtil;

@Controller
public class UserController {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserService")
	private IUserService userService;
	
	@Resource(name="ImageService")
	private IImageService imageService;
	
	@RequestMapping(value="user/loginPage")
	public String loginPage() {
		log.info(this.getClass().getName() + " .user/loginPage start");
		return "user/loginPage";
	}
	
	@RequestMapping(value="user/SignUp")
	public String userIn() {
		log.info(this.getClass().getName() + " .user/userIn start !");
		return"user/SignUp";
	}
	
	@RequestMapping(value="user/LoginForm")
	public String loginForm() {
		log.info(this.getClass().getName() + " .user/loginForm start!");
		
		return "user/LoginForm";
	}
	
	@RequestMapping(value="user/FindPass")
	public String FindPass() {
		
		log.info(this.getClass().getName() + " .user/FindPass start !");
		
		return "user/FindPass";
	}
	
	@RequestMapping(value="user/getUserList")
	public String getUserList(ModelMap model) {
		
		List<UserDTO> uList = userService.getUserList();
		
		if(uList == null ) {
			log.info("List for UserList load Failed !");
			uList = new ArrayList<>();
		}
		for( UserDTO e : uList) {
			
			log.info("UserList : " + e.getUser_no());
			
		}
		
		log.info(" UserList 불러오기");
		
		model.addAttribute("uList", uList);
		
		return "image/imageListTest";
	}
	
	@RequestMapping(value="user/MyPage")
	public String getMyImageList(ModelMap model,HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		// session으로 user_id 받아오기 
		String SS_USER_ID = CmmUtil.nvl((String) session.getAttribute("SS_USER_ID"));
		
		log.info("session get user_id : " + SS_USER_ID );
		
		// ID를 기준으로 List를 불러와야하니 user_id를 지정해준다.
		ImageDTO pDTO = new ImageDTO();

		pDTO.setReg_id(SS_USER_ID);
		
		List<ImageDTO> rList = imageService.getMyBoard(pDTO);
		
		for(ImageDTO e : rList) {
			
			log.info("image_no : "+ e.getImage_no());
		}
		
		log.info(" MyImageList 불러오기");
		
		model.addAttribute("SS_USER_ID", SS_USER_ID);
		model.addAttribute("rList", rList);
		
		return "user/MyPage";
	}
	
	@RequestMapping(value="user/getUserLoginCheck")
	public String getUserLoginCheck (HttpSession session, HttpServletRequest request, HttpServletResponse 
			response, ModelMap model) throws Exception {
		
		log.info(this.getClass().getName() + " .getUserLoginCheck start !");
		
		int res = 0; 
		
		UserDTO pDTO = null;
		
		try {
			
			String user_id = CmmUtil.nvl(request.getParameter("user_id"));
			String user_pwd = CmmUtil.nvl(EncryptUtil.encHashSHA256(request.getParameter("user_pwd")));
			
			log.info("user_id : " + user_id);
			log.info("user_pwd : " + user_pwd);
			
			pDTO = new UserDTO(); 
			pDTO.setUser_id(user_id);
			pDTO.setUser_pwd(user_pwd);
			
			res = userService.getUserLoginCheck(pDTO);
			
			if(res == 1) {
				
				log.info(" 로그인에 성공했습니다.");
				
				session.setAttribute("SS_USER_ID", user_id);
				
				List<UserDTO> uList = userService.getUserList();
				
				List<ImageDTO> rList = imageService.imageListTest();
				
				if( rList == null) {
					rList = new ArrayList<>();
				}
				
				if( uList == null)
				{
					uList = new ArrayList<>();
				}
				
				model.addAttribute("rList",rList);
				model.addAttribute("uList",uList);
				
				for( ImageDTO e : rList) {
					log.info("imageList : " + e.getImage_no());
				}
				
				for( UserDTO e : uList) {
					log.info("userList : " + e.getUser_no());
				}
				
				return"image/imageListTest";
			}
			
		}catch(Exception e) {
			
			res = 2;
			log.info("로그인의 실패했습니다.");
			log.info(e.toString());
			e.printStackTrace();
			return "user/loginPage";
		
		}finally {
			
			log.info(this.getClass().getName() + " .getUserLoginCheck end !");
			model.addAttribute("res",String.valueOf(res));
			
			pDTO = null;
			
		}
		
		return "user/loginPage";
	}
	
	@RequestMapping(value="user/InsertUserInfo",method=RequestMethod.POST)
	public String InsertUserInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		
		log.info(this.getClass().getName() + " .InsertUserInfo Start ! ");
		
		String msg = "";
		
		UserDTO pDTO = null;
		
		try {
			
			String user_id = CmmUtil.nvl(request.getParameter("user_id"));
			String user_pwd = CmmUtil.nvl(request.getParameter("user_pwd"));
			String user_name = CmmUtil.nvl(request.getParameter("user_name"));
			String user_mail = CmmUtil.nvl(request.getParameter("user_mail"));
			
			log.info("user_id : " + user_id);
			log.info("user_pwd : " + user_pwd);
			log.info("user_name : " + user_name);
			log.info("user_mail : " + user_mail);
			
			pDTO = new UserDTO();
			
			pDTO.setUser_id(user_id);
			pDTO.setUser_pwd(EncryptUtil.encHashSHA256(user_pwd));
			pDTO.setUser_name(user_name);
			pDTO.setUser_mail(user_mail);
		
			int res = userService.InsertUserInfo(pDTO);
			
			if(res == 1) {
				msg = "회원가입되었습니다. ";
				
			}else if(res == 2) {
				msg = "이미 가입된 회원입니다.";
			}else {
				msg = "오류로 인한 회원가입에 실패했습니다.";
			}
			
		}catch(Exception e) {
			//저장이 실패하면 사용자에게 보여주는 메세지 
			msg = "실패했습니다." + e.toString();
		}finally {
			log.info(this.getClass().getName() + ".InsertUserInfo End !");
			
			//회원가입 여부 결과 메시지 보여주기 
			model.addAttribute("msg",msg);
			
			//회원가입 여부 결과 메시지 전달하기 
			model.addAttribute("pDTO",pDTO);
		}
		
		return "user/loginPage";
	}
	
	// 유저 아이디 찾기
	@RequestMapping(value="user/getFindID")
	public String getFindID (HttpServletRequest request, HttpServletResponse response,
				ModelMap model, HttpSession session) throws Exception{
		log.info(this.getClass().getName() + "Find ID Start");
		
		String user_name = CmmUtil.nvl(request.getParameter("user_name"));
		String user_mail = CmmUtil.nvl(request.getParameter("user_mail"));
		
		log.info(" user_name : " + user_name);
		log.info(" user_mail : " + user_mail);
		
		UserDTO pDTO = new UserDTO();
		
		pDTO.setUser_name(user_name);
		pDTO.setUser_mail(user_mail);
		
		UserDTO rDTO = userService.getFindID(pDTO);
		
		if(rDTO == null) {
			log.info("아이디 찾기 실패");
			rDTO = new UserDTO();
		}
		
		session.setAttribute("SS_USER_ID", rDTO.getUser_id());
		
		log.info("load for DTO to user_id : " + rDTO.getUser_id());
		
		log.info(this.getClass().getName() + "Find ID End");
		
		return "user/FindPass";
	}
	
}
