package com.google.pronect.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.pronect.dao.GroupBoardDao;
import com.google.pronect.util.Paging;
import com.google.pronect.vo.GroupBoard;

@Service
public class GroupBoardServiceImpl implements GroupBoardService {

	@Autowired
	private GroupBoardDao gboardDao;
	String backupPath = "C:\\JU\\WebProgramming\\source\\10_2ndTeamProject\\pronect\\src\\main\\webapp\\groupBoardFileUpload\\";
	@Override
	public List<GroupBoard> groupBoardList(GroupBoard groupboard, String pageNum, Model model) {
		System.out.println(" 서비스   totCnt  ");
		Paging paging = new Paging(gboardDao.totCntGroupBoard(groupboard), pageNum);
		model.addAttribute("paging", paging);
		groupboard.setStartRow(paging.getStartRow());
		groupboard.setEndRow(paging.getEndRow());
		System.out.println(" 서비스   groupBoardList  ");
		return gboardDao.groupBoardList(groupboard);
	}

	@Override
	public int writeGroupBoard(GroupBoard groupboard, MultipartHttpServletRequest mRequest,
			HttpServletRequest request) {
		String uploadPath = mRequest.getRealPath("groupBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String gfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		gfile = mFile.getOriginalFilename();
		if(gfile!=null && !gfile.equals("")) { // 첨부함
			if(new File(uploadPath + gfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				gfile = System.currentTimeMillis() + "_" + gfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + gfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + gfile);
				System.out.println("백업파일 : " + backupPath + gfile);
				boolean result = fileCopy(uploadPath + gfile, backupPath + gfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			gfile="";
		}// if
		groupboard.setGroup_board_file(gfile);
		groupboard.setGroup_board_ip(request.getRemoteAddr());
		return gboardDao.writeGroupBoard(groupboard);
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
	public GroupBoard detailGroupBoard(int group_bid) {
		gboardDao.hitUpGroupBoard(group_bid);
		return gboardDao.detailGroupBoard(group_bid);
	}

	@Override
	public int modifyGroupBoard(GroupBoard groupboard, MultipartHttpServletRequest mRequest, HttpServletRequest request) {
		String uploadPath = mRequest.getRealPath("groupBoardFileUpload/");
		Iterator<String> params = mRequest.getFileNames();
		String gfile = "";
		String param = params.next();
		MultipartFile mFile = mRequest.getFile(param); // 파라미터에 첨부된 파일 객체
		gfile = mFile.getOriginalFilename();
		if(gfile!=null && !gfile.equals("")) { // 첨부함
			if(new File(uploadPath + gfile).exists()) {
				// 서버에 같은 파일이름이 있을 경우(첨부파일과)
				gfile = System.currentTimeMillis() + "_" + gfile;
			}//if
			try {
				mFile.transferTo(new File(uploadPath + gfile)); // 서버에 저장
				System.out.println("서버파일 : " + uploadPath + gfile);
				System.out.println("백업파일 : " + backupPath + gfile);
				boolean result = fileCopy(uploadPath + gfile, backupPath + gfile);
				System.out.println(result ?"백업성공":"백업실패");
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}
		}else {
			gfile="";
		}// if
		groupboard.setGroup_board_file(gfile);
		groupboard.setGroup_board_ip(request.getRemoteAddr());
		return gboardDao.modifyGroupBoard(groupboard);
	}

	@Override
	public int deleteGroupBoard(int group_bid) {
		return gboardDao.deleteGroupBoard(group_bid);
	}
}
