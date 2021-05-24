
package poly.service.impl;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.UserDTO;
import poly.persistance.mapper.IUserMapper;
import poly.service.IUserService;
import poly.util.CmmUtil;

@Service("UserService")
public class UserService implements IUserService{
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="UserMapper")
	private IUserMapper userMapper;
	
	@Override
	 public int InsertUserInfo(UserDTO pDTO) throws InvalidKeyException, 
		UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException,
		InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		 
		 log.info(this.getClass().getName() + " .InsertUserInfo Start!");
		 
		 // 회원가입 성공 : 1, 중복으로 인한 취소 : 2, 기타에러 발생 : 0
		 int res = 0; 
		 
		 if(pDTO == null ) {
			 pDTO = new UserDTO();
		 }
		 
		 UserDTO rDTO = userMapper.getUserExists(pDTO);
		 log.info(this.getClass().getName() + " .mapper end");
		 
		 
		 if(rDTO == null ) {
			 rDTO = new UserDTO();
		 }
		 
		if(CmmUtil.nvl(rDTO.getExists_yn()).equals("N")) {
			log.info(" 중복된 아이디 입니다.");
			res = 2;
		}else { 
			int success = userMapper.InsertUserInfo(pDTO);
			
			if(success > 0) {
				log.info("회원가입 완료");
				res = 1;
			}else {
				log.info(" 알수없는 에러");
				res = 0;
			}
		}

		 log.info(this.getClass().getName() + " .InsertUserInfo End !");
		return res ; 
		
		
	 }
	 
	 public int getUserLoginCheck(UserDTO pDTO) throws Exception{
		 
		 
		 // 로그인 성공 1, 실패 0
		 int res = 0;
		 
		 UserDTO rDTO = userMapper.getUserLoginCheck(pDTO);
		 
		 if(rDTO == null) {
			 rDTO = new UserDTO();
		 }
		 
		 if(CmmUtil.nvl(rDTO.getUser_id()).length() > 0) {
			 res = 1;
		 }
		 
		 return res;
	 }

}
