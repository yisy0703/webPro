package com.tj.ck.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.ck.dao.BDao;
import com.tj.ck.dto.B;
import com.tj.ck.dto.FileUpVO;
@Service
public class BServiceImpl implements BService {
	@Autowired
	private BDao bDao;
	private String backupPath = "D:\\webPro\\source\\10_2ndTeamProject\\ch05_ckeditor\\src\\main\\webapp\\fileUp\\"; 
	@Override
	public List<B> list(B b, String pageNum, Model model) {
		Paging paging = new Paging(bDao.cnt(b), pageNum);
		b.setStartRow(paging.getStartRow());
		b.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return bDao.list(b);
	}
	@Override
	public int write(MultipartHttpServletRequest mRequest, B b, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			if(filename!=null && !filename.equals("")) {
				if(new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(uploadPath + filename));
					System.out.println("서버파일 : " + uploadPath + filename);
					System.out.println("서버파일 : " + backupPath + filename);
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		b.setBfile(filename);
		int result = 0;
		try {
			result = bDao.write(b);
			model.addAttribute("successMsg", "글쓰기가 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글쓰기에 실패했습니다");
		}
		return result;
	}

	@Override
	public B detail(int bno) {
		return bDao.detail(bno);
	}

	@Override
	public int update(MultipartHttpServletRequest mRequest, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String filename = "";
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("파라미터 이름  : "+param);
			MultipartFile mFile = mRequest.getFile(param);
			filename = mFile.getOriginalFilename();
			System.out.println("파일이름 : "+filename);
			if(filename!=null && !filename.equals("")) {
				if(new File(uploadPath + filename).exists()) {
					filename = System.currentTimeMillis() + "_" + filename;
				}
				try {
					mFile.transferTo(new File(uploadPath + filename));
					System.out.println("서버파일 : " + uploadPath + filename);
					System.out.println("서버파일 : " + backupPath + filename);
					int result = filecopy(uploadPath + filename, backupPath + filename);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		int bno = Integer.parseInt(mRequest.getParameter("bno"));
		String btitle = mRequest.getParameter("btitle");
		String bcontent = mRequest.getParameter("bcontent");
		B b = new B(bno, btitle, bcontent, filename);
		int result = 0;
		try {
			result = bDao.update(b);
			model.addAttribute("successMsg", "글 수정이 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글 수정에 실패했습니다");
		}
		return result;
	}

	@Override
	public int delete(int bno, Model model) {
		int result = 0;
		try {
			result = bDao.delete(bno);
			model.addAttribute("successMsg", "글 삭제를 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글 삭제에 실패했습니다");
		}
		return result;
	}

	@Override
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request) {
		String rootPath = request.getRealPath("/");
		String attachPath = "fileUp/";
		String uploadPath = request.getRealPath("fileUp/");
		System.out.println("서버로 여기로 보낸다 : "+rootPath + attachPath);
		MultipartFile upload = fileUpVO.getUpload();
		String filename = "";
		
		if(upload != null){
	    	filename = System.currentTimeMillis() + upload.getOriginalFilename();
	    	fileUpVO.setFilename(filename);
	     	try{
	     		File file = new File(rootPath + attachPath + filename);
	     		upload.transferTo(file);
	     	}catch(IOException e){
	     		e.printStackTrace();
	     	}  
	     	
	     	fileUpVO.setAttachPath(attachPath);
	     	fileUpVO.setFilename(filename);
	     }
		 
		int result = filecopy(rootPath + attachPath + filename, backupPath+filename);
		if(result==1) {
			System.out.println(filename+" 파일 백업 성공");
		}
		return fileUpVO;
	}
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (FileNotFoundException e) {
			System.out.println("복사 예외0 : "+e.getMessage());
		} catch (IOException e) {
			System.out.println("복사 예외1 : "+e.getMessage());
		} finally {
			try {
				if(os!=null) {
					os.close();
				}
				if(is!=null) {
					is.close();
				}
			}catch (Exception e) {
			}
		}
		return isCopy;
	}
}
