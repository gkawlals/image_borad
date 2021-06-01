package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IImageMapper;
import poly.persistance.mapper.IUserMapper;
import poly.service.IImageService;


@Service("ImageService")
public class ImageService implements IImageService {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ImageMapper")
	private IImageMapper imageMapper;
	
	@Resource(name="UserMapper")
	private IUserMapper userMapper;


	@Override
	public int getInsertImage(ImageDTO pDTO) {

		
		return imageMapper.getInsertImage(pDTO);
	}


	@Override
	public List<ImageDTO> searchList(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.getsearchList();
	}


	@Override
	public List<ImageDTO> imageListTest() {
		// TODO Auto-generated method stub
		return imageMapper.imageListTest();
	}


	@Override
	public List<UserDTO> userListAll(UserDTO pDTO) {
		// TODO Auto-generated method stub
		return userMapper.userListAll();
	}

	@Override
	public int delImage() {
		// TODO Auto-generated method stub
		return imageMapper.delImage();
	}


	@Override
	public int updateImage() {
		// TODO Auto-generated method stub
		return imageMapper.updateImage();
	}


	@Override
	public List<ImageDTO> loadUserImg(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.loadUserImg(pDTO);
	}


	@Override
	public List<ImageDTO> getMyBoard(ImageDTO pDTO) {
		
		return imageMapper.getMyBoard(pDTO);
	}


	@Override
	public ImageDTO imageDetail(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.imageDetail(pDTO);
	}


}
