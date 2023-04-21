package com.lec.ck.service;
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

import com.lec.ck.dao.BDao;
import com.lec.ck.util.Paging;
import com.lec.ck.vo.B;
import com.lec.ck.vo.FileUpVO;
@Service
public class BServiceImpl implements BService {
	@Autowired
	private BDao bDao;
	private String backupPath = "D:\\webPro\\source\\10_2ndTeamProject\\ch02_ckEditor\\src\\main\\webapp\\fileUp\\"; 
	@Override
	public List<B> listBboard(B b, String pageNum, Model model) {
		Paging paging = new Paging(bDao.cntBboard(b), pageNum);
		b.setStartRow(paging.getStartRow());
		b.setEndRow(paging.getEndRow());
		model.addAttribute("paging", paging);
		return bDao.listBboard(b);
	}

	@Override
	public int writeBboard(MultipartHttpServletRequest mRequest, B b, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String bfile = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			bfile = mFile.getOriginalFilename();
			if(bfile!=null && !bfile.equals("")) {
				if(new File(uploadPath + bfile).exists()) {
					bfile = System.currentTimeMillis() + "_" + bfile;
				} // 중복된 파일은 파일명 변경
				try {
					mFile.transferTo(new File(uploadPath + bfile));
					System.out.println("서버파일 : " + uploadPath + bfile);
					System.out.println("백업파일 : " + backupPath + bfile);
					int result = filecopy(uploadPath + bfile, backupPath + bfile);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
			}
		}// while
		b.setBfile(bfile);
		int result = 0;
		try {
			result = bDao.writeBboard(b);
			model.addAttribute("successMsg", "글쓰기가 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글쓰기에 실패했습니다");
		}
		return result;
	}

	@Override
	public B detailBboard(int bno) {
		return bDao.detailBboard(bno);
	}

	@Override
	public int updateBboard(MultipartHttpServletRequest mRequest, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String bfile = "";
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("파라미터 이름  : "+param);
			MultipartFile mFile = mRequest.getFile(param);
			bfile = mFile.getOriginalFilename();
			System.out.println("파일이름 : "+bfile);
			if(bfile!=null && !bfile.equals("")) {
				if(new File(uploadPath + bfile).exists()) {
					bfile = System.currentTimeMillis() + "_" + bfile;
				}
				try {
					mFile.transferTo(new File(uploadPath + bfile));
					System.out.println("서버파일 : " + uploadPath + bfile);
					System.out.println("백업파일 : " + backupPath + bfile);
					int result = filecopy(uploadPath + bfile, backupPath + bfile);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}//if
		// B b를 매개변수로 안 들어오면 한땀한땀 getParameter해줘야 하는 불편함을 보여줌(write처럼 하지)
		int bno = Integer.parseInt(mRequest.getParameter("bno"));
		String btitle = mRequest.getParameter("btitle");
		String bcontent = mRequest.getParameter("bcontent");
		B b = new B(bno, btitle, bcontent, bfile);
		int result = 0;
		try {
			result = bDao.updateBboard(b);
			model.addAttribute("successMsg", "글 수정이 완료되었습니다");
		}catch (Exception e) {
			model.addAttribute("failMsg", "글 수정에 실패했습니다");
		}
		return result;
	}

	@Override
	public int deleteBboard(int bno, Model model) {
		int result = 0;
		try {
			result = bDao.deleteBboard(bno);
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
