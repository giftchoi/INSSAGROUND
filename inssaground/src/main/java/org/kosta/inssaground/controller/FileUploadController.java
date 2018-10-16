package org.kosta.inssaground.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileUploadController {	
	private String uploadPath;
	@ResponseBody
	@RequestMapping("fileupload.do")	
	public String PathName(MultipartFile picture,HttpServletRequest request) {
		System.out.println("11*****");
		uploadPath=request.getSession().getServletContext().getRealPath("/resources/image/");
		//uploadPath = System.getProperty("user.home")+"\\git\\INSSAGROUND\\inssaground\\src\\main\\webapp\\resources\\image";
		System.out.println(picture);
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false) {
			uploadDir.mkdirs();
		}		
		String fileName = picture.getOriginalFilename();
		if(!fileName.equals("")) {
			File file = new File(uploadPath+fileName);
			try {
				file.createNewFile();
			} catch (IOException e) {				
				e.printStackTrace();
			}
			file.mkdirs();
			System.out.println("업로드 완료:"+fileName);
		}
		/*if (fileName != null && !fileName.equals("")) {
            if (file.exists()) {
            	// 파일명 앞에 업로드 시간 초단위로 붙여 파일명 중복을 방지
                fileName = System.currentTimeMillis() + "_" + fileName;
                
                file = (MultipartFile) new File(path + fileName);
            }
        }*/

		return fileName;
	}
}





























