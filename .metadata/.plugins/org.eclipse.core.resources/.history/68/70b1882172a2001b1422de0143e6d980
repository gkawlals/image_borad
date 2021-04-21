package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import poly.dto.ImageDTO;
import poly.persistance.mapper.IImageMapper;
import poly.service.IImageService;


@Service("ImageService")
public class ImageService implements IImageService {
	
	@Resource(name="ImageMapper")
	private IImageMapper imageMapper;

	@Override
	public List<ImageDTO> getImageList() {
		// TODO Auto-generated method stub
		return imageMapper.getImageList();
	}
	
	

}
