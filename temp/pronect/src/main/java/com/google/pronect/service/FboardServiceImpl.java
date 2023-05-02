package com.google.pronect.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.FboardDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Fboard;
@Service
public class FboardServiceImpl implements FboardService {
	@Autowired
	private FboardDao fboardDao;
	String backupPath = "D:\\YeosongYoon\\WebProgramming\\Source\\10_2ndTeamProject\\pronect\\src\\main\\webapp\\fboardFile\\";
	
	@Override
	public List<Fboard> fboardList(Fboard fboard, String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(fboardDao.totCntFboard(fboard), pageNum);
		fboard.setStartRow(paging.getStartRow());
		fboard.setEndRow(paging.getEndRow());
		return fboardDao.fboardList(fboard);
	}

	@Override
	public int totCntFboard(Fboard fboard) {
		// TODO Auto-generated method stub
		return fboardDao.totCntFboard(fboard);
	}

	@Override
	public int writeFboard(Fboard fboard, MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("fboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String ffile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		ffile = mFile.getOriginalFilename();
		if(ffile!=null && !ffile.equals("")) { // 첨부함
			if(new File(uploadPath + ffile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				ffile = System.currentTimeMillis() + "_" + ffile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + ffile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + ffile);
				System.out.println("백업파일 : " + backupPath + ffile);
				boolean result = fileCopy(uploadPath + ffile, backupPath + ffile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			ffile="";
		}// if
		fboard.setFfile(ffile);
		fboard.setFip(request.getRemoteAddr());
		return fboardDao.writeFboard(fboard);
	}
	private boolean fileCopy(String serverFile, String backupFile) {
		boolean isCopy = false;
		InputStream is = null; 
		OutputStream os = null;
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
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(os!=null) os.close();
				if(is!=null) is.close();
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

	@Override
	public Fboard contentFboard(int fid) {
		// TODO Auto-generated method stub
		fboardDao.hitUpFboard(fid);
		return fboardDao.contentFboard(fid);
	}

	@Override
	public Fboard fboardModifyReplyView(int fid) {
		// TODO Auto-generated method stub
		return fboardDao.contentFboard(fid);
	}

	@Override
	public int modifyFboard(Fboard fboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("fboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String ffile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		ffile = mFile.getOriginalFilename();
		if(ffile!=null && !ffile.equals("")) { // 첨부함
			if(new File(uploadPath + ffile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				ffile = System.currentTimeMillis() + "_" + ffile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + ffile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + ffile);
				System.out.println("백업파일 : " + backupPath + ffile);
				boolean result = fileCopy(uploadPath + ffile, backupPath + ffile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			ffile="";
		}// if
		fboard.setFfile(ffile);
		return fboardDao.modifyFboard(fboard);
	}

	@Override
	public int deleteFboard(int fid) {
		// TODO Auto-generated method stub
		return fboardDao.deleteFboard(fid);
	}

	@Override
	public int replyFboard(Fboard fboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("fboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String ffile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		ffile = mFile.getOriginalFilename();
		if(ffile!=null && !ffile.equals("")) { // 첨부함
			if(new File(uploadPath + ffile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				ffile = System.currentTimeMillis() + "_" + ffile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + ffile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + ffile);
				System.out.println("백업파일 : " + backupPath + ffile);
				boolean result = fileCopy(uploadPath + ffile, backupPath + ffile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			ffile="";
		}// if
		fboard.setFfile(ffile);
		fboard.setFip(mRequest.getRemoteAddr());
		fboardDao.replyFboardPreStep(fboard);
		return fboardDao.replyFboard(fboard);
	}

}
