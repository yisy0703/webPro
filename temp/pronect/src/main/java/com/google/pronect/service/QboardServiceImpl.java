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

import com.google.pronect.dao.QboardDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.Qboard;
@Service
public class QboardServiceImpl implements QboardService {
	@Autowired
	private QboardDao qboardDao;
	String backupPath = "D:\\YeosongYoon\\WebProgramming\\Source\\10_2ndTeamProject\\pronect\\src\\main\\webapp\\qboardFile\\";
	
	@Override
	public List<Qboard> qboardList(Qboard qboard, String pageNum) {
		// TODO Auto-generated method stub
		Paging paging = new Paging(qboardDao.totCntQboard(qboard), pageNum);
		qboard.setStartRow(paging.getStartRow());
		qboard.setEndRow(paging.getEndRow());
		return qboardDao.qboardList(qboard);
	}

	@Override
	public int totCntQboard(Qboard qboard) {
		// TODO Auto-generated method stub
		return qboardDao.totCntQboard(qboard);
	}

	@Override
	public int writeQboard(Qboard qboard, MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("qboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String qfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		qfile = mFile.getOriginalFilename();
		if(qfile!=null && !qfile.equals("")) { // 첨부함
			if(new File(uploadPath + qfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				qfile = System.currentTimeMillis() + "_" + qfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + qfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + qfile);
				System.out.println("백업파일 : " + backupPath + qfile);
				boolean result = fileCopy(uploadPath + qfile, backupPath + qfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			qfile="";
		}// if
		qboard.setQfile(qfile);
		return qboardDao.writeQboard(qboard);
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
	public Qboard contentQboard(int qid) {
		return qboardDao.contentQboard(qid);
	}

	@Override
	public int modifyQboard(Qboard qboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("qboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String qfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		qfile = mFile.getOriginalFilename();
		if(qfile!=null && !qfile.equals("")) { // 첨부함
			if(new File(uploadPath + qfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				qfile = System.currentTimeMillis() + "_" + qfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + qfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + qfile);
				System.out.println("백업파일 : " + backupPath + qfile);
				boolean result = fileCopy(uploadPath + qfile, backupPath + qfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			qfile="";
		}// if
		qboard.setQfile(qfile);
		return qboardDao.writeQboard(qboard);
	}

	@Override
	public int deleteQboard(int qid) {
		// TODO Auto-generated method stub
		return qboardDao.deleteQboard(qid);
	}

	@Override
	public int replyQboard(Qboard qboard, MultipartHttpServletRequest mRequest) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("qboardFile/");
		Iterator<String> params = mRequest.getFileNames();
		String qfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		qfile = mFile.getOriginalFilename();
		if(qfile!=null && !qfile.equals("")) { // 첨부함
			if(new File(uploadPath + qfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				qfile = System.currentTimeMillis() + "_" + qfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + qfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + qfile);
				System.out.println("백업파일 : " + backupPath + qfile);
				boolean result = fileCopy(uploadPath + qfile, backupPath + qfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			qfile="";
		}// if
		qboard.setQfile(qfile);
		qboardDao.replyQboardPreStep(qboard);
		return qboardDao.replyQboard(qboard);
	}

}
