package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ImageDTO;


@Mapper("ImageMapper")
public interface IImageMapper {
	

	int getInsertImage(ImageDTO pDTO);


	List<ImageDTO> getsearchList();


	List<ImageDTO> imageListTest();

}
