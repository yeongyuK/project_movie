package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.MovieVO;

public class MovieDAO {

	SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	// 전체 게시물 조회
	public List<MovieVO> selectList(){
		List<MovieVO> list = sqlSession.selectList("m.movie_list");
		return list;
	}
	
	// 페이지별게시물 조회
	public List<MovieVO> selectList(HashMap<String, Integer> map) {
		List<MovieVO> list = sqlSession.selectList("m.movie_list_page", map);
		return list;
	}
	
	// 게시물 한 건 조회
	public MovieVO selectOne(int movieIdx) {
		MovieVO vo = sqlSession.selectOne("m.movie_one", movieIdx);
		return vo;
	}

	// 검색된 게시물
	public List<MovieVO> selectList(String str_search) {
		List<MovieVO> list = sqlSession.selectList("m.movie_list_search", str_search);
		return list;
	}

	// 전체 게시물 수 조회
	public int getRowTotal() {
		int count = sqlSession.selectOne("m.movie_count");
		return count;
	}

	// 검색 게시물 수 조회
	public int getRowCount(String str_search) {
		int count = sqlSession.selectOne("m.movie_search_count", str_search);
		System.out.println("count : " + count);
		return count;
	}

}
