package dto;

import java.time.LocalDate;
import java.util.Date;

public class BoardVO {
	private String id;								// 고유키
	private String title;							// 제목
	private String author;							// 작성자
	private String content;							// 내용
	private LocalDate writeDate = LocalDate.now();	// 작성일
	private int hit = 0;							// 조회수
	private String filename;						// 저장 파일명
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public LocalDate getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(LocalDate writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
	
}
