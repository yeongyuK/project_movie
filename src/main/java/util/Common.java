package util;

public class Common {
	
	
	//상영작 게시판용
	public static class Movie{
		
		public final static String VIEW_PATH = "/WEB-INF/views/movie/";
		
		//한페이지에 보여줄 게시물 갯수
		public final static int BLOCKLIST = 5;
		
		//페이지 메뉴 수  < 1 2 3 ... >
		public final static int BLOCKPAGE = 3;
	}
	
	public static class Ticketing{
		
		public final static String REV_PATH = "/WEB-INF/views/ticketing/";
	}
}
