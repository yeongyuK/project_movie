package vo;

public class MovieVO {
	//상영작인덱스
	private int movieIdx; 
	//제작년도
	private int createYear;
	//상영장 제목
	private String movieTitle;
	//감독 이름
	private String director;
	//제작국가
	private String createCountry;
	//러닝타임
	private String running;
	//프로그램노트
	private String programNote;
	//감독정보
	private String directorContent;
	//상영작 이미지
	private String movieImage;
	//상영날짜
	private String movieDate;
	//상영시작시간
	private String movieTime;
	
	public String getMovieTime() {
		return movieTime;
	}
	public void setMovieTime(String movieTime) {
		this.movieTime = movieTime;
	}
	public String getMovieDate() {
		return movieDate;
	}
	public void setMovieDate(String movieDate) {
		this.movieDate = movieDate;
	}
	
	public int getMovieIdx() {
		return movieIdx;
	}
	public void setMovieIdx(int movieIdx) {
		this.movieIdx = movieIdx;
	}
	public int getCreateYear() {
		return createYear;
	}
	public void setCreateYear(int createYear) {
		this.createYear = createYear;
	}
	public String getMovieTitle() {
		return movieTitle;
	}
	public void setMovieTitle(String movieTitle) {
		this.movieTitle = movieTitle;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getCreateCountry() {
		return createCountry;
	}
	public void setCreateCountry(String createCountry) {
		this.createCountry = createCountry;
	}
	public String getRunning() {
		return running;
	}
	public void setRunning(String running) {
		this.running = running;
	}
	public String getProgramNote() {
		return programNote;
	}
	public void setProgramNote(String programNote) {
		this.programNote = programNote;
	}
	public String getDirectorContent() {
		return directorContent;
	}
	public void setDirectorContent(String directorContent) {
		this.directorContent = directorContent;
	}
	public String getMovieImage() {
		return movieImage;
	}
	public void setMovieImage(String movieImage) {
		this.movieImage = movieImage;
	}
	
	

}
