package com.tj.ck.dto;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class FileUpVO {
	private String attachPath; //이미지가 저장될 경로
	private String filename; //파일이름
	private MultipartFile upload;
}