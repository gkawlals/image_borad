package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ImageDTO;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	//로그인을위해 아이디와 비밀번호 일치하는지 확인하기
	UserDTO getUserLoginCheck(UserDTO pDTO) throws Exception;

	UserDTO getUserExists(UserDTO pDTO); // 중복확인

	int InsertUserInfo(UserDTO pDTO); //회원가입 


	List<ImageDTO> getMyImageList(); // 유저 개인의 ImageList 불러오기

	List<UserDTO> getUserList(); // Image Board에서 사용되는 userList

	UserDTO userListAll(UserDTO uDTO);
	
	UserDTO getFindID(UserDTO pDTO) throws Exception;

	UserDTO IDCheck(String user_id);

}
