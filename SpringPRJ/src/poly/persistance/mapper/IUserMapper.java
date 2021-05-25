package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ImageDTO;
import poly.dto.UserDTO;

@Mapper("UserMapper")
public interface IUserMapper {

	//로그인을위해 아이디와 비밀번호 일치하는지 확인하기
	UserDTO getUserLoginCheck(UserDTO pDTO) throws Exception;

	UserDTO getUserExists(UserDTO pDTO);

	int InsertUserInfo(UserDTO pDTO);

	List<ImageDTO> UserList();

	List<ImageDTO> getMyImageList();

	List<UserDTO> userList();

}
