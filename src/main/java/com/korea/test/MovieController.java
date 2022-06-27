package com.korea.test;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MovieDAO;
import util.Common;
import util.Paging;
import vo.MovieVO;

@Controller
public class MovieController {

	MovieDAO movie_dao;

	public void setMovie_dao(MovieDAO movie_dao) {
		this.movie_dao = movie_dao;
	}

	@Autowired
	HttpServletRequest request;

	// 페이지별 목록조회
	@RequestMapping(value = { "/", "/movie_list.do" })
	public String list(Model model, String page) {

		int nowPage = 1;

		if (page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}

		int start = (nowPage - 1) * Common.Movie.BLOCKLIST + 1;
		int end = start + Common.Movie.BLOCKLIST - 1;

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end", end);

		// 페이지 번호에 따른 게시글 조회
		List<MovieVO> list = movie_dao.selectList(map);

		// 전체게시물 수 구하기
		int rowTotal = movie_dao.getRowTotal();

		// 페이지 메뉴 생성하기
		String pageMenu = Paging.getPaging("movie_list.do", nowPage, // 현재 페이지 번호
				rowTotal, // 전체 게시물 수
				Common.Movie.BLOCKLIST, // 한 페이지에 표기할 게시물 수
				Common.Movie.BLOCKPAGE);// 페이지 메뉴 수

		// 리퀘스트영역에 바인딩
		model.addAttribute("rowTotal", rowTotal);
		model.addAttribute("list", list);
		model.addAttribute("pageMenu", pageMenu);

		return Common.Movie.VIEW_PATH + "movie_list.jsp";
	}

	// 상세 내용 보기
	@RequestMapping("/movie_view.do")
	public String movieView(Model model, int movieIdx) {
		MovieVO vo = movie_dao.selectOne(movieIdx);
		model.addAttribute("vo", vo);
		return Common.Movie.VIEW_PATH + "movie_view.jsp";
	}

	// 검색된 게시물
	@RequestMapping("/movie_list_search.do")
	public String search_list(Model model, String str_search) {
		int rowCount = movie_dao.getRowCount(str_search);

		String search = "all";

		if (str_search != null && !str_search.isEmpty()) {
			search = str_search;
		}

		// 게시물 조회
		List<MovieVO> list = null;
		if (search.equals("all")) {
			list = movie_dao.selectList();
		} else {
			list = movie_dao.selectList(search);
		}

		model.addAttribute("rowCount", rowCount);
		model.addAttribute("list", list);

		return Common.Movie.VIEW_PATH + "movie_list_search.jsp";
	}
}
