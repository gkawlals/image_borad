package poly.service;

import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;

public interface IUserService {

	
	
	int getUserLoginCheck(UserDTO pDTO) throws Exception;

	int InsertUserInfo(UserDTO pDTO) throws InvalidKeyException, UnsupportedEncodingException, NoSuchAlgorithmException,
			NoSuchPaddingException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException;

	List<UserDTO> getUserList();

	List<ImageDTO> getMyImageList();

	void uploadImg(UserDTO vo);

	UserDTO userListAll(UserDTO uDTO);

}
