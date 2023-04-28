package com.lec.infinity.util;

import lombok.Data;

@Data
public class Paging {
	private int currentPage = 1;
	private int pageSize = 5;
	private int blockSize = 3;
	private int startRow;
	private int endRow;
	private int total;
	private int pageCnt;
	private int startPage;
	private int endPage;
	public Paging(int total, String pageNum, int pageSize, int blockSize) {
		this.total = total;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1 ;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage -1) / blockSize) * blockSize + 1 ;
		//startPage = currentPage - (currentPage -1)%blockSize;
		endPage = startPage + blockSize - 1 ;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}// 생성자
	public Paging(int total, String pageNum) {
		this.total = total;
		if(pageNum!=null) {
			currentPage = Integer.parseInt(pageNum);
		}
		startRow = (currentPage - 1) * pageSize + 1;
		endRow = startRow + pageSize - 1 ;
		pageCnt = (int)Math.ceil((double)total/pageSize);
		startPage = ((currentPage -1) / blockSize) * blockSize + 1 ;
		//startPage = currentPage - (currentPage -1)%blockSize;
		endPage = startPage + blockSize - 1 ;
		if(endPage > pageCnt) {
			endPage = pageCnt;
		}
	}// 생성자(pageSize와 blockSize가 초기값 5 , 3으로)
}
