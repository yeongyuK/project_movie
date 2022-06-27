package com.korea.test;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.MovieDAO;
import dao.TicketDAO;
import util.Common;
import vo.MovieVO;
import vo.TicketVO;

@Controller
public class TicketingController {

	TicketDAO ticket_dao;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	public void setTicket_dao(TicketDAO ticket_dao) {
		this.ticket_dao = ticket_dao;
	}
	
	// 상영시간표
	@RequestMapping("/ticketing_view.do")
	public String ticketing_view(Model model, String movieDate) {
		List<List<MovieVO>> list = new ArrayList<List<MovieVO>>();
		List<MovieVO> list1 = ticket_dao.select1(movieDate);
		List<MovieVO> list2 = ticket_dao.select2(movieDate);
		List<MovieVO> list3 = ticket_dao.select3(movieDate);
		List<MovieVO> list4 = ticket_dao.select4(movieDate);
		List<MovieVO> list5 = ticket_dao.select5(movieDate);

		list.add(list1);
		list.add(list2);
		list.add(list3);
		list.add(list4);
		list.add(list5);
		
		int maxCount = 50;
		
		List<List<Integer>> revCountList = new ArrayList<List<Integer>>();
		List<Integer> revCountList1 = new ArrayList<Integer>();
			for( int j = 0; j < list1.size(); j++) {
				revCountList1.add(maxCount - ticket_dao.selectCount(list1.get(j).getMovieIdx()));
			}
			List<Integer> revCountList2 = new ArrayList<Integer>();
			for( int j = 0; j < list2.size(); j++) {
				revCountList2.add(maxCount - ticket_dao.selectCount(list2.get(j).getMovieIdx()));
			}
			List<Integer> revCountList3 = new ArrayList<Integer>();
			for( int j = 0; j < list3.size(); j++) {
				revCountList3.add(maxCount - ticket_dao.selectCount(list3.get(j).getMovieIdx()));
			}
			List<Integer> revCountList4 = new ArrayList<Integer>();
			for( int j = 0; j < list4.size(); j++) {
				revCountList4.add(maxCount - ticket_dao.selectCount(list4.get(j).getMovieIdx()));
			}
			List<Integer> revCountList5 = new ArrayList<Integer>();
			for (int j = 0; j < list5.size(); j++) {
				revCountList5.add(maxCount - ticket_dao.selectCount(list5.get(j).getMovieIdx()));
			}			
		revCountList.add(revCountList1);	
		revCountList.add(revCountList2);	
		revCountList.add(revCountList3);	
		revCountList.add(revCountList4);	
		revCountList.add(revCountList5);	
		System.out.println(revCountList.get(1).get(1));
		
		
		model.addAttribute("revCountList", revCountList);
		model.addAttribute("maxCount", maxCount);
		model.addAttribute("list", list);
		return Common.Ticketing.REV_PATH + "ticketing_view.jsp";
	}

	// 예매 상세페이지
	@RequestMapping("/ticketing_detail.do")
	public String ticketing_detail(Model model, int movieIdx) {
		MovieVO data = ticket_dao.selectOne(movieIdx);
		int revCount = ticket_dao.selectCount(movieIdx);
		int maxCount = 50;
				
		revCount = maxCount - revCount;
		
		model.addAttribute("data", data);
		model.addAttribute("revCount", revCount);
		model.addAttribute("maxCount", maxCount);
		return Common.Ticketing.REV_PATH + "ticketing_detail.jsp";
	}

	// 예매 내역 DB insert
	@RequestMapping("/insert.do")
	public String insert(Model model, int movieIdx, int adultCount, int childCount, int totalPrice) {
		
		//예매번호 생성
		String ticketId = ticket_dao.createTicketId();
		
		String userId = "userId1";
		
		TicketVO vo = new TicketVO();
		vo.setUserId(userId);
		vo.setAdultCount(adultCount);
		vo.setChildCount(childCount);
		vo.setMovieIdx(movieIdx);
		vo.setTotalPrice(totalPrice);
		vo.setTicketId(ticketId);
		int res = ticket_dao.insert(vo);
	
		return "redirect:ticketing_completed.do?ticketId=" + ticketId + "&movieIdx=" + movieIdx;
	}
	
	//예매 확인
	@RequestMapping("/ticketing_completed.do")
	public String selectTicket(Model model, String ticketId, int movieIdx) {
		TicketVO vo = ticket_dao.selectTicket(ticketId);
		MovieVO vo1 = ticket_dao.selectOne(movieIdx);
		model.addAttribute("vo", vo);
		model.addAttribute("vo1", vo1);
		return Common.Ticketing.REV_PATH + "ticketing_completed.jsp";
	}
	
	
	
}


