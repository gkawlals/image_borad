package poly.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.List;

import com.amazonaws.ClientConfiguration;
import com.amazonaws.Protocol;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;

public class S3Util {
	
	private String accessKey = "";
	private String secretKey = "";
	
	private AmazonS3 conn;
	
	public  S3Util() {
		AWSCredentials credentials = new BasicAWSCredentials(accessKey, secretKey);
		
		ClientConfiguration clientConfig = new ClientConfiguration();
		clientConfig.setProtocol(Protocol.HTTP);
		this.conn = new AmazonS3Client(credentials, clientConfig);
		conn.setEndpoint("s3.ap-northeast-2.amazonaws.com");
	}
	
	// 버킷 리스트 들고오기 
	public List<Bucket> getBucketList(){
		return conn.listBuckets();
	}
	// 버킷을 생성하기
	public Bucket createBucket(String circle) {
		return conn.createBucket(circle);
		
	}
	// 폴더 생성 ( 폴더는 파일명 뒤에 "/"를 붙여야 한다.) 
	public void createFolder(String circle, String folderName) {
		conn.putObject(circle, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}
	
	// 파일 업로드
		public void fileUpload(String circle, String fileName, byte[] fileData) throws FileNotFoundException {

			String filePath = (fileName).replace(File.separatorChar, '/'); // 파일 구별자를 `/`로 설정(\->/) 이게 기존에 / 였어도 넘어오면서 \로 바뀌는 거같다.
			ObjectMetadata metaData = new ObjectMetadata();

			metaData.setContentLength(fileData.length);   //메타데이터 설정 -->원래는 128kB까지 업로드 가능했으나 파일크기만큼 버퍼를 설정시켰다.
		    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); //파일 넣음

			conn.putObject(circle, filePath, byteArrayInputStream, metaData);

		}

		// 파일 삭제
		public void fileDelete(String circle, String fileName) {
			String imgName = (fileName).replace(File.separatorChar, '/');
			conn.deleteObject(circle, imgName);
			System.out.println("삭제성공");
		}

		// 파일 URL
		public String getFileURL(String circle, String fileName) {
			System.out.println("넘어오는 파일명 : "+fileName);
			String imgName = (fileName).replace(File.separatorChar, '/');
			return conn.generatePresignedUrl(new GeneratePresignedUrlRequest(circle, imgName)).toString();
		}
	

}
