package com.lec.ch13.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
@Service
public class FileUpService {
	public boolean fileUp(MultipartHttpServletRequest mRequest, ModelAndView mav) {
		boolean isUpload = false;
		// mRequest에 들어온 파일을 서버에 저장 -> 소스폴더로 복사
		String uploadPath = mRequest.getRealPath("upload/");
		String backupPath = "D:/webPro/source/09_Spring/ch13_fileupload/src/main/webapp/upload/";
		String[] fileNames = new String[3];
		int i = 0;
		Iterator<String> params = mRequest.getFileNames(); // file1, file2, file3
		while(params.hasNext()) {
			String param = params.next();
			System.out.println(i+"번째 파라미터 이름은 " + param);
			MultipartFile mFile = mRequest.getFile(param); // 파라미터의 파일 객체
			String originalFileName = mFile.getOriginalFilename(); // 업로드한 파일이름
			fileNames[i] = originalFileName;
			System.out.println(originalFileName==null ? "널이야":
				originalFileName.equals("")? "빈스트링이야":"첨부한파일은"+originalFileName);
			// 첨부를 안 하면 빈스트링
			if(fileNames[i]!=null && !fileNames[i].equals("")) {
				// 첨부함
				if(new File(uploadPath + fileNames[i]).exists()) {
					// 첨부파일과 같은 이름의 파일이 서버에 존해하는 경우 16021353454100.jpg
					fileNames[i] = System.currentTimeMillis() + fileNames[i];
				}// if (파일이름 변경)
				try {
					mFile.transferTo(new File(uploadPath+fileNames[i])); // 서버 저장
					System.out.println("서버에 저장된 파일 : " + uploadPath+fileNames[i]);
					System.out.println("복사될 파일 : " + backupPath + fileNames[i]);
					isUpload = filecopy(uploadPath+fileNames[i], 
							backupPath + fileNames[i]);  // 파일 복사(소스폴더로)
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}else {
				// 첨부 안 함
				System.out.println(i+"번째 첨부 안 함 : " + 
							(fileNames[i].equals("")? "빈스트링":"빈스트링아님"));
			}// if
			i++;
		} //while
		return isUpload;
	}

	private boolean filecopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			File file = new File(serverFile);
			is = new FileInputStream(file);
			os = new FileOutputStream(backupFile);
			byte[] buff = new byte[(int) file.length()];
			while(true) {
				int nReadByte = is.read(buff);
				if(nReadByte == -1) break;
				os.write(buff, 0, nReadByte);
			}
			isCopy = true;
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

}














