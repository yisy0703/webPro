package com.lec.ck.service;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.lec.ck.vo.B;
import com.lec.ck.vo.FileUpVO;
public interface BService {
	public List<B> listBboard(B b, String pageNum, Model model);
	public int writeBboard(MultipartHttpServletRequest mRequest, B b, Model model);
	public B detailBboard(int bno);
	public int updateBboard(MultipartHttpServletRequest mRequest, Model model);
	public int deleteBboard(int bno, Model model);
	public FileUpVO fileUp(FileUpVO fileUpVO, HttpServletRequest request);
}
