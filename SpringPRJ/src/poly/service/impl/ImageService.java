package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ImageDTO;
import poly.dto.UserDTO;
import poly.persistance.mapper.IImageMapper;
import poly.persistance.mapper.IUserMapper;
import poly.service.IImageService;


@Service("ImageService")
public class ImageService implements IImageService {
	
	//private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="ImageMapper")
	private IImageMapper imageMapper;
	
	@Resource(name="UserMapper")
	private IUserMapper userMapper;


	@Override
	public int getInsertImage(ImageDTO pDTO) {

	//	log.info(this.getClass().getName() + " service end");
		
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
	public List<UserDTO> userList(UserDTO pDTO) {
		// TODO Auto-generated method stub
		return userMapper.userList();
	}


	@Override
	public void deleteImage(String fileName) {
		// TODO Auto-generated method stub
		
	}


}
