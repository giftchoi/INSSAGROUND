package org.kosta.inssaground.model.service;

import java.io.File;
import java.io.IOException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {
	public String fileUpload(MultipartFile picture) throws IllegalStateException, IOException {
		String filename="";
		String uploadPath = System.getProperty("user.home")+"\\git\\INSSAGROUND\\inssaground\\src\\main\\webapp\\resources\\uploadImage\\";
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
		MultipartFile file=picture;//파일 
		System.out.println(file+"<==");
		if(file!=null&&file.isEmpty()==false){
			System.out.println("파일명:"+file.getOriginalFilename());
			File uploadFile=new File(uploadPath+file.getOriginalFilename());
				file.transferTo(uploadFile);//실제 디렉토리로 파일을 저장한다 
				System.out.println(uploadPath+file.getOriginalFilename()+" 파일업로드");
				filename=file.getOriginalFilename();
		}
		return filename;
	}
}
