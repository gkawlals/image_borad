package poly.service;

import java.util.List;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;

public interface IImageService {
	

	int getInsertImage(ImageDTO pDTO);

	List<ImageDTO> searchList(ImageDTO pDTO);

	List<ImageDTO> imageListTest();
	
	List<ImageDTO> getMyBoard(ImageDTO pDTO);

	int delImage(ImageDTO pDTO);

	int updateImage(ImageDTO pDTO);

	List<ImageDTO> loadUserImg(ImageDTO pDTO);

	ImageDTO imageDetail(ImageDTO pDTO);

	int getCircleImage(ImageDTO pDTO);

}
