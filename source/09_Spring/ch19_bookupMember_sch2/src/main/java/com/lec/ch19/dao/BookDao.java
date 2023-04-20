package com.lec.ch19.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.ch19.vo.Book;
@Mapper
public interface BookDao {
	public List<Book> mainList();
	public List<Book> bookList(Book book);
	public int totCntBook(Book book);
	public Book getDetailBook(int bnum);
	public int registerBook(Book book);
	public int modifyBook(Book book);
}
