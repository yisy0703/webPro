package com.lec.sn.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.sn.dao.BoardDao;
import com.lec.sn.vo.Board;
@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;
	private String backupPath = "D:\\webPro\\source\\10_2ndTeamProject\\ch03_summernoteEditor\\src\\main\\webapp\\fileUp\\";
	@Override
	public List<Board> list() {
		return boardDao.list();
	}
	@Override
	public void write(Board board, MultipartHttpServletRequest mRequest, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String[] bFile = new String[3];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			if(!param.equals("tempBfile1") && !param.equals("tempBfile2")  && !param.equals("tempBfile3") ) {
				continue;
			}
			MultipartFile mFile = mRequest.getFile(param);
			bFile[idx] = mFile.getOriginalFilename();
			System.out.println("파라미터 이름 : "+ param +"/ 파일이름 : " + (bFile[idx].equals("")? "빈스트링(첨부안함)" : bFile[idx]));
			if(bFile[idx]!=null && !bFile[idx].equals("")) {
				if(new File(uploadPath + bFile[idx]).exists()) {
					bFile[idx] = System.currentTimeMillis() + "_" + bFile[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + bFile[idx]));
					System.out.println("서버파일 : " + uploadPath + bFile[idx]);
					System.out.println("서버파일 : " + backupPath + bFile[idx]);
					int result = filecopy(uploadPath + bFile[idx], backupPath + bFile[idx]);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
//				System.out.println(idx+"번째("+param+") 파일 첨부를 안 했네");
			}
			idx++;
		}//while
		//System.out.println(Arrays.toString(bFile));
		board.setbFile1(bFile[0]);
		board.setbFile2(bFile[1]);
		board.setbFile3(bFile[2]);
		try {
			boardDao.write(board);
			model.addAttribute("resultMsg", "글쓰기가 완료되었습니다");
		} catch (Exception e) {
			model.addAttribute("resultMsg", "글쓰기에 실패되었습니다");
			System.out.println(e.getMessage());
		}
	}
	@Override
	public Board detail(int bNo) {
		return boardDao.detail(bNo);
	}
	@Override
	public void update(Board board, MultipartHttpServletRequest mRequest, Model model) {
		String uploadPath = mRequest.getRealPath("fileUp/");
		Iterator<String> params = mRequest.getFileNames();
		String[] bFile = new String[3];
		int idx = 0;
		while(params.hasNext()) {
			String param = params.next();
			System.out.println(idx+"번째 파라미터 이름  : "+param);
			if(!param.equals("tempBfile1") && !param.equals("tempBfile2")  && !param.equals("tempBfile3") ) {
				continue;
			}
			MultipartFile mFile = mRequest.getFile(param);
			bFile[idx] = mFile.getOriginalFilename();
			System.out.println("파라미터 이름 : "+ param +"/ 파일이름 : " + (bFile[idx].equals("")? "빈스트링(첨부안함)" : bFile[idx]));
			if(bFile[idx]!=null && !bFile[idx].equals("")) {
				if(new File(uploadPath + bFile[idx]).exists()) {
					bFile[idx] = System.currentTimeMillis() + "_" + bFile[idx];
				}
				try {
					mFile.transferTo(new File(uploadPath + bFile[idx]));
					System.out.println("서버파일 : " + uploadPath + bFile[idx]);
					System.out.println("서버파일 : " + backupPath + bFile[idx]);
					int result = filecopy(uploadPath + bFile[idx], backupPath + bFile[idx]);
					System.out.println(result == 1? "파일 복사 성공" : "파일 복사 실패");
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
//				System.out.println(idx+"번째("+param+") 파일 첨부를 안 했네");
			}
			idx++;
		}//while
		board.setbFile1(bFile[0]);
		board.setbFile2(bFile[1]);
		board.setbFile3(bFile[2]);
		try {
			System.out.println("수정될 데이터 : " + board);
			int r = boardDao.update(board);
			if(r>0) {
				model.addAttribute("resultMsg", "글수정이 완료되었습니다");
			}else {
				model.addAttribute("resultMsg", "글수정에 실패되었습니다");
			}
		} catch (Exception e) {
			model.addAttribute("resultMsg", "글수정에 실패되었습니다");
			System.out.println(e.getMessage());
		}
	}
	@Override
	public void delete(int bNo, Model model) {
		int result = 0;
		try {
			result = boardDao.delete(bNo);
			if(result>0) {
				model.addAttribute("resultMsg", "글삭제가 완료되었습니다");
			}else {
				model.addAttribute("resultMsg", "글삭제가 실패되었습니다");
			}
		} catch (Exception e) {
			model.addAttribute("resultMsg", "글수정에 실패되었습니다");
			System.out.println(e.getMessage());
		}
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
	@Override
	public int getCnt() {
		return boardDao.getCnt();
	}
}
