package com.lec.like.service;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.lec.like.vo.Category;
import com.lec.like.vo.Clike;

public interface ClikeService {
	public List<Category> categoryList();
	public String myClikeList(HttpSession session);
	public int insertLike(Clike clike, HttpSession session, Model model);
	public int deleteLike(Clike clike, HttpSession session, Model model);
}
