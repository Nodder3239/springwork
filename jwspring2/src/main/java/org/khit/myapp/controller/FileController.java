package org.khit.myapp.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class FileController {
	
	@GetMapping("/file/upload")
	public String uploadForm() {
		return "/file/uploadform";
	}
	
	@PostMapping("/file/upload")
	public String upload(MultipartFile filename,
			Model model) throws IllegalStateException, IOException {
		//�������� ��������
		String originFilename = filename.getOriginalFilename();
		long filesize = filename.getSize();
		String fileType = filename.getContentType();
		log.info(originFilename);
		log.info(filesize + "B");
		log.info(fileType);
		
		//������ ����	
		String savedFilename = "";
		if (!filename.isEmpty()) {
			String filepath = "C:\\springworks\\jwspring2\\src\\main\\webapp\\upload";
			//String originFilename = filename.getOriginalFilename();
			//�ߺ� �̸� ������ ���� ID ��ü ����
			UUID uuid = UUID.randomUUID();
			savedFilename = uuid.toString() + "_" + originFilename;
			
			File file = new File(filepath + "\\" + savedFilename);
			filename.transferTo(file);	//���� ������ ����
		}
		model.addAttribute("filename", savedFilename);
		
		return "/file/uploadform";
				
	}
}