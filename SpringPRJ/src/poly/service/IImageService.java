package poly.service;

import java.util.List;

import poly.dto.ImageDTO;

public interface IImageService {
	

	int getInsertImage(ImageDTO pDTO);


	List<ImageDTO> searchList(ImageDTO pDTO);


	List<ImageDTO> imageListTest();

}
