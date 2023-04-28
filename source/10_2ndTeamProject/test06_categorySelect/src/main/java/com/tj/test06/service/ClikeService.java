package com.tj.test06.service;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.ui.Model;
import com.tj.test06.dto.Category;
import com.tj.test06.dto.Clike;

public interface ClikeService {
	public List<Category> categoryList();
	public String myClikeList(HttpSession session);
	public int myClikeInsert(Clike clike, HttpSession session, Model model);
	public int myClikeDelete(Clike clike, HttpSession session, Model model);
}
