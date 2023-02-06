package dao;

import java.time.LocalDate;
import java.util.ArrayList;

import org.apache.commons.lang3.RandomStringUtils;

import dto.BoardVO;

public class BoardDAO {
	
	private ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public BoardDAO() {
//		BoardVO board1 = new BoardVO();
//		
//		board1.setId(RandomStringUtils.randomAlphanumeric(6));
//		board1.setTitle("게시물 입니당1");
//		board1.setAuthor("김작가1");
//		board1.setContent("내용입니당1");
//		
//		BoardVO board2 = new BoardVO();
//		
//		board2.setId(RandomStringUtils.randomAlphanumeric(6));
//		board2.setTitle("게시물 입니당2");
//		board2.setAuthor("김작가2");
//		board2.setContent("내용입니당2");
//		
//		BoardVO board3 = new BoardVO();
//		
//		board3.setId(RandomStringUtils.randomAlphanumeric(6));
//		board3.setTitle("게시물 입니당3");
//		board3.setAuthor("김작가3");
//		board3.setContent("내용입니당3");
//		
//		boardList.add(board1);
//		boardList.add(board2);
//		boardList.add(board3);
	}



	public ArrayList<BoardVO> getBoardList(){
		return boardList;
	}
	
	public void insertBoard(BoardVO board) {
		boardList.add(board);
	}
	
	public void updateBoard(BoardVO board) {
		int index = getBoardIndex(board);
		boardList.set(index, board);
	}
	
	public void deleteBoard(BoardVO board) {
		boardList.remove(board);
	}
	
	public BoardVO getBoardById(String boardId) {
		BoardVO boardById = null;
		
		for(BoardVO board : boardList) {
			if(board != null && board.getId() != null && board.getId().equals(boardId)) {
				boardById = board;
				break;
			}
		}
		return boardById;
	}
	
	public int getBoardIndex(BoardVO board) {
		int index = 0;
		
		for(BoardVO bv : boardList) {
			if(bv != null && bv.getId() != null && bv.getId().equals(board.getId())) {
				break;
			}
			index++;
		}
		return index;
	}
}
