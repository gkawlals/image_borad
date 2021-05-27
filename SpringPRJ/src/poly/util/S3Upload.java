package poly.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Optional;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest; 


@Component 
public class S3Upload { 
	
	private final AmazonS3Client amazonS3Client = new AmazonS3Client(); 
	
	private Logger log = Logger.getLogger(this.getClass());
	
	@Value("${cloud.aws.s3.circle-bucket-test}") 
	
	private String bucket; 
	
	public String upload(MultipartFile multipartFile, String dirName) throws IOException { 
		
		File uploadFile = convert(multipartFile) .orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File로 전환이 실패했습니다.")); 
		
		return upload(uploadFile, dirName); 
		
		} 
	private String upload(File uploadFile, String dirName) { 
		
		String fileName = dirName + "/" + uploadFile.getName(); 
		
		String uploadImageUrl = putS3(uploadFile, fileName); 
		
		removeNewFile(uploadFile); return uploadImageUrl; 
		
		} 
	private String putS3(File uploadFile, String fileName) { 
		
		amazonS3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead)); 
		
		return amazonS3Client.getUrl(bucket, fileName).toString(); 
		
		} 
	private void removeNewFile(File targetFile) { 
		
		if (targetFile.delete()) { 
			
			log.info("파일이 삭제되었습니다."); 
			
			} else { 
				
				log.info("파일이 삭제되지 못했습니다."); 
				
				} 
		} 
	private Optional<File> convert(MultipartFile file) throws IOException { 
		
		File convertFile = new File(file.getOriginalFilename()); 
		
		if(convertFile.createNewFile()) { 
			
			try (FileOutputStream fos = new FileOutputStream(convertFile)) { fos.write(file.getBytes()); 
			
			} 
			
			return Optional.of(convertFile); } return Optional.empty(); 
			
			} 
	}
