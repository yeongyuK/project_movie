package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieVO;
import vo.TicketVO;

public class TicketDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 전체게시물 조회
	public List<MovieVO> selectList() {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list");
		return list;
	}

	// 일자별 게시물 조회
	public List<MovieVO> select1(String movieDate) {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list_first", movieDate);
		return list;
	}

	public List<MovieVO> select2(String movieDate) {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list_second", movieDate);
		return list;
	}

	public List<MovieVO> select3(String movieDate) {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list_third", movieDate);
		return list;
	}

	public List<MovieVO> select4(String movieDate) {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list_fourth", movieDate);
		return list;
	}

	public List<MovieVO> select5(String movieDate) {
		List<MovieVO> list = sqlSession.selectList("t.ticket_list_fifth", movieDate);
		return list;
	}

	// 게시물 한 건 조회
	public MovieVO selectOne(int movieIdx) {
		MovieVO vo = sqlSession.selectOne("t.ticket_one", movieIdx);
		return vo;
	}

	// 예매 정보 DB insert
	public int insert(TicketVO vo) {
		int res = sqlSession.insert("t.ticket_insert", vo);
		return res;
	}

	// 예매 완료 정보 조회
	public TicketVO selectTicket(String ticketId) {
		TicketVO vo = sqlSession.selectOne("t.ticket_info", ticketId);
		return vo;
	}

	// 예매번호 불러오기
	public String createTicketId() {
		String res = sqlSession.selectOne("t.ticket_id");
		return res;
	}

	// 예매 인원 수 조회
	public int selectCount(int movieIdx) {
		int count = sqlSession.selectOne("t.ticket_count", movieIdx);
		return count;
	}
}
