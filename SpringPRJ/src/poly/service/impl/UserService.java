
package poly.service.impl;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.ImageDTO;
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
		 
		 String Exists = CmmUtil.nvl("중복확인 문구 " + rDTO.getExists_yn() );
		 
		 if(rDTO == null ) {
			 rDTO = new UserDTO();
		 }
		 
		 log.info(Exists);
		 
		if(CmmUtil.nvl(rDTO.getExists_yn()).equals("Y")) {
			log.info(" 중복된 아이디 입니다." + CmmUtil.nvl(rDTO.getExists_yn()));
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
		 
		return res;
		
		
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
	 
	@Override
	public UserDTO getFindID(UserDTO pDTO) throws Exception {
		// TODO Auto-generated method stub
		return userMapper.getFindID(pDTO);
	}

	@Override
	public List<UserDTO> getUserList() {
		// TODO Auto-generated method stub
		return userMapper.getUserList();
	}

	@Override
	public List<ImageDTO> getMyImageList() {
		// TODO Auto-generated method stub
		return userMapper.getMyImageList();
	}

	@Override
	public void uploadImg(UserDTO vo) {
		// TODO Auto-generated method stub
	}

	@Override
	public UserDTO userListAll(UserDTO uDTO) {
		// TODO Auto-generated method stub
		return userMapper.userListAll(uDTO);
	}

}
