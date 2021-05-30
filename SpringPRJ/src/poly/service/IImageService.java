package poly.service;

import java.util.List;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;

public interface IImageService {
	

	int getInsertImage(ImageDTO pDTO);

	List<ImageDTO> searchList(ImageDTO pDTO);

	List<ImageDTO> imageListTest();
	
	List<UserDTO> userListAll(UserDTO pDTO);

	List<ImageDTO> getMyBoard();

	int delImage();

	int updateImage();

}
