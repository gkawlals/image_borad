package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.ImageDTO;


@Mapper("ImageMapper")
public interface IImageMapper {
	
	int getInsertImage(ImageDTO pDTO); // 이미지 저장

	List<ImageDTO> getsearchList(); // ajax 이미지 리스트 불러오기 

	List<ImageDTO> imageListTest(); // 이미지 리스트 페이지 불러오기

	int delImage(); // 이미지 삭제하기

	List<ImageDTO> getMyBoard(ImageDTO pDTO);// user_id를 기준으로 개인 List 불러오기

	int updateImage(); // 이미지 업데이트하기

	List<ImageDTO> loadUserImg(ImageDTO pDTO); // 

	ImageDTO imageDetail(ImageDTO pDTO);// 이미지 선택하면 창띄우기

}
