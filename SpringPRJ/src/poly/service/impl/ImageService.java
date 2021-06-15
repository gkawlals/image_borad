package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.ImageDTO;
import poly.persistance.mapper.IImageMapper;
import poly.persistance.mapper.IUserMapper;
import poly.persistance.mongo.IMongoTestMapper;
import poly.service.IImageService;


@Service("ImageService")
public class ImageService implements IImageService {
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="MongoTestMapper")
	private IMongoTestMapper mongoTestMapper;
	
	@Override
	public int insertMongo(String location, String user_id) throws Exception {
		// TODO Auto-generated method stub
		return mongoTestMapper.insertMongo(location, "locationCol" ,user_id );
	}
	
	
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


	public int delImage(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.delImage(pDTO);
	}


	@Override
	public int updateImage(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.updateImage(pDTO);
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


	@Override
	public int getCircleImage(ImageDTO pDTO) {
		// TODO Auto-generated method stub
		return imageMapper.getCircleImage(pDTO);
	}


}
