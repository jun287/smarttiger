package dao;
import driverdb.DriverDB;
import dto.BoardQnA;
import java.sql.*;
import java.util.ArrayList;

public class BoardQnADao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String sql = null;
	/*
	메소드 설명	
	1. 용도 : 한 개의 QnA게시판 글 입력(DB BoardQnA테이블 1개 행 입력)
	2. 매개변수 : BoardQnA boardQnA(BoardQnA클래스를 통해 생성된 boardQnA객체의 참조값)
	3. 리턴값 : void
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnAChoose, String boardQnACategory
	*/
	public void insertBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "INSERT INTO boardqna(member_id, boardqna_title, boardqna_content, boardqna_date, boardqna_category) VALUES (?, ?, ?, now(), ?)";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, boardQnA.getMemberId());
		preparedStatement.setString(2, boardQnA.getBoardQnAtitle());
		preparedStatement.setString(3, boardQnA.getBoardQnAContent());
		preparedStatement.setString(4, boardQnA.getBoardQnACategory());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	/*
	메소드 설명	
	1. 용도 : 전체 QnA게시판글을 조회(DB BoardQnA테이블 전체 행 조회)
	2. 매개변수 : ArrayList<BoardQnA>(ArrayList클래스를 통해 생성된 boardQnAList객체의 참조값으로 BoardQnA클래스를 통해 생성된 객체의 참조값을 담고 있음.)
	3. 리턴값 : ArrayList<BoardQnA>
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnAChoose, String boardQnACategory
	*/
	public ArrayList<BoardQnA> allSelectBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException{
		ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna";
		preparedStatement = connection.prepareStatement(sql);
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			boardQnA = new BoardQnA();
			boardQnA.setBoardQnACategory(resultSet.getNString(1));
			boardQnA.setBoardQnANumber(resultSet.getInt(2));
			boardQnA.setBoardQnAtitle(resultSet.getString(3));
			boardQnA.setMemberId(resultSet.getString(4));
			boardQnA.setBoardQnADate(resultSet.getString(5));
			boardQnA.setBoardQnAhits(resultSet.getInt(6));
			boardQnAList.add(boardQnA);
		}
		return boardQnAList;
	}
	

	
}
