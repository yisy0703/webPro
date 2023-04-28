package com.lec.infinity.dao;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.lec.infinity.vo.Memo;
@Mapper
public interface MemoDao {
	public int memoInsert(Memo memo);
	public List<Memo> memoList(Memo memo);
	public int getMemoCnt();
}
