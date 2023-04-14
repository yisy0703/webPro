package com.lec.ch19.service;
import java.util.List;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.lec.ch19.vo.Book;
public interface BookService {
	public List<Book> mainList();
	public List<Book> bookList(String pageNum);
	public int totCntBook();
	public Book getDetailBook(int bnum);
	public int registerBook(MultipartHttpServletRequest mRequest, Book book);
	public int registerBook(MultipartHttpServletRequest mRequest); // 비추
	public int modifyBook(MultipartHttpServletRequest mRequest, Book book);
	//public int modifyBook(MultipartHttpServletRequest mRequest);
}
