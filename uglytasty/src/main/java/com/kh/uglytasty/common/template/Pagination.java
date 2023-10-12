package com.kh.uglytasty.common.template;

import com.kh.uglytasty.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount/boardLimit);
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		int endPage = startPage + pageLimit - 1;
		if(endPage > maxPage) {
			// 맨 끝 페이지가 맥스페이지보다 작으면 맨 끝 페이지가 맥스페이지
			endPage = maxPage;
		}
		
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		// 앞에 4개는 나중에 사용자한테 넘겨받아야함
	}
	

}
