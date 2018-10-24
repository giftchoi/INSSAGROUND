package org.kosta.inssaground.model.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	@Resource
	private GroundService groundService;
	public String fileUpload(MultipartFile picture) throws IllegalStateException, IOException {		
		//String filename="";
		//String uploadPath = System.getProperty("user.home")+"\\git\\INSSAGROUND\\inssaground\\src\\main\\webapp\\resources\\uploadImage\\";
		String uploadPath = "C:\\java-kosta\\framework-workspace2\\resources\\uploadImage\\";
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		MultipartFile file=picture;//파일 
		System.out.println(file+"<==");
		String nName = null;
		if(file!=null&&file.isEmpty()==false){
			nName = groundService.randomName(file.getOriginalFilename());
			System.out.println("파일명:"+nName);			
			File uploadFile=new File(uploadPath+nName);
				file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
				System.out.println(uploadPath+nName+" 파일업로드");
		}
		
		
		return nName;
	}
}
