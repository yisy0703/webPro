package com.lec.ch19.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.ch19.service.BookService;
import com.lec.ch19.util.Paging;
import com.lec.ch19.vo.Book;
@Controller
@RequestMapping(value = "book")
public class BookController {
	@Autowired
	private BookService bookService;
	@RequestMapping(params="method=register", method=RequestMethod.GET)
	public String register() {
		return "book/register";
	}
	@RequestMapping(params = "method=register", method=RequestMethod.POST)
	public String register(MultipartHttpServletRequest mRequest, 
			@ModelAttribute("bDto") Book book, Model model) {
		model.addAttribute("registerResult", bookService.registerBook(mRequest, book));
		return "book/register";
	}
	@RequestMapping(params="method=list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list(String pageNum, Model model) {
		System.out.println("list 출력전");
		model.addAttribute("bookList", bookService.bookList(pageNum));
		model.addAttribute("paging", new Paging(bookService.totCntBook(), pageNum, 3, 3));
		return "book/list";		
	}
}
