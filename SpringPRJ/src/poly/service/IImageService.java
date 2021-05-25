package poly.service;

import java.util.List;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;

public interface IImageService {
	

	int getInsertImage(ImageDTO pDTO);


	List<ImageDTO> searchList(ImageDTO pDTO);


	List<ImageDTO> imageListTest();


	List<UserDTO> userList(UserDTO pDTO);


	void deleteImage(String fileName);



}
