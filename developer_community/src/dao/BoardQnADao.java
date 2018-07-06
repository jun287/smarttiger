// 28기 2018. 7. 5(목) 이원상 BoardQnADao.java
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
		int boardQnAhits, String boardQnACategory
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
	1. 용도 : 전체 QnA게시판글의 전체글의 수를 조회하는 메소드(DB BoardQnA테이블 전체 행의 수를 조회)
	2. 매개변수 : int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : int lastPage(총 행의 수 / 페이지당 볼 행의 수를 나눠 나머지값이 0일경우 그대로, 0이 아닐경우 last page +1)
	*/
	public int countBoardQnA(int pagePerRow) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		int lastPage = 0;
		sql = "select count(boardqna_no) as count from boardqna";
		preparedStatement = connection.prepareStatement(sql);
		resultSet = preparedStatement.executeQuery();
		resultSet.next();
		int totalRow = resultSet.getInt("count");
		lastPage = totalRow/pagePerRow;
		if(totalRow%pagePerRow!=0){
			lastPage++;
		}
		resultSet.close();
		preparedStatement.close();
		connection.close();
		return lastPage;
	}
	/*
	메소드 설명	
	1. 용도 : 전체 QnA게시판글을 검색조건에 맞춰 조회, 검색조건없을시 전체조회(DB BoardQnA테이블 특정조건 행 조회)
	2. 매개변수 : String beginDate(검색시작날짜), String endDate(검색종료날짜), String sk(검색구분), String sv(검색단어), int currentPage(현재페이지), int pagePerRow(페이지당 볼 행의 수)
	3. 리턴값 : ArrayList<BoardQnA>
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public ArrayList<BoardQnA> selectBoardQnASearch(String beginDate, String endDate, String sk, String sv, int currentPage, int pagePerRow) throws ClassNotFoundException, SQLException{
		ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		int startRow = (currentPage-1)*pagePerRow;
		if(!beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("01조건 beginDate,endDate,sk,sv 모두 값이 있다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(!beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("02조건 beginDate,endDate,sk의 값이 있고 sv값이 없다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(!beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("03조건 beginDate값이 있고,endDate값이 없고,sk의 값이 있고 sv값이 있다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, "2099-12-31");
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(!beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("04조건 beginDate값이 있고,endDate값이 없고,sk의 값이 있고 sv값이 없다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, "2099-12-31");
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("05조건 beginDate값이 없고,endDate값이 있고,sk의 값이 있고 sv값이 있다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("06조건 beginDate값이 없고,endDate값이 있고,sk의 값이 있고 sv값이 없다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && !sv.equals("")){
			System.out.println("07조건 beginDate값이 없고,endDate값이 없고,sk의 값이 있고 sv값이 있다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, sv);
			preparedStatement.setInt(2, startRow);
			preparedStatement.setInt(3, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && sv.equals("")){
			System.out.println("08조건 beginDate값이 없고,endDate값이 없고,sk의 값이 있고 sv값이 없다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && sk.equals("") && sv.equals("")){
			System.out.println("09조건 beginDate,endDate,sk,sv모두 값이 없다");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
		}
		resultSet = preparedStatement.executeQuery();
		while(resultSet.next()) {
			BoardQnA boardQnA = new BoardQnA();
			boardQnA.setBoardQnACategory(resultSet.getString(1));
			boardQnA.setBoardQnANumber(resultSet.getInt(2));
			boardQnA.setBoardQnAtitle(resultSet.getString(3));
			boardQnA.setMemberId(resultSet.getString(4));
			boardQnA.setBoardQnADate(resultSet.getString(5));
			boardQnA.setBoardQnAhits(resultSet.getInt(6));
			boardQnAList.add(boardQnA);
		}
		resultSet.close();
		preparedStatement.close();
		connection.close();
		return boardQnAList;
	}
	/*
	메소드 설명	
	1. 용도 : 전체 QnA게시판글 중 한개의 글을 조회(DB BoardQnA테이블 1개 행 조회)
	2. 매개변수 : BoardQnA boardQnA(BoardQnA클래스를 통해 생성된 참조값)
	3. 리턴값 : BoardQnA boardQnA(BoardQnA클래스를 통해 생성된 참조값)
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public BoardQnA selectBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select boardqna_no,member_id,boardqna_title,boardqna_content,boardqna_date,hits,boardqna_category from boardqna where boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnA.getBoardQnANumber());
		resultSet = preparedStatement.executeQuery();
		resultSet.next();
		boardQnA.setBoardQnANumber(resultSet.getInt(1));
		boardQnA.setMemberId(resultSet.getString(2));
		boardQnA.setBoardQnAtitle(resultSet.getString(3));
		boardQnA.setBoardQnAContent(resultSet.getString(4));
		boardQnA.setBoardQnADate(resultSet.getString(5));
		boardQnA.setBoardQnAhits(resultSet.getInt(6));
		boardQnA.setBoardQnACategory(resultSet.getString(7));
		resultSet.close();
		preparedStatement.close();
		connection.close();
		return boardQnA;
	}
	
	/*
	메소드 설명	
	1. 용도 : QnA게시판글을 조회(열람)시 조회수(hits컬럼 증가)(DB BoardQnA테이블 1개 행 수정)
	2. 매개변수 : BoardQnA boardQnA(BoardQnA클래스를 통해 생성된 참조값)
	3. 리턴값 : void
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public void updateHitsBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE boardqna SET hits=? WHERE boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnA.getBoardQnAhits()+1);
		preparedStatement.setInt(2, boardQnA.getBoardQnANumber());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	/*
	메소드 설명	
	1. 용도 : QnA게시판글을 1개를 삭제하는 메소드(DB BoardQnA테이블 1개 행 삭제)
	2. 매개변수 : int boardQnANumber(db테이블의 boardQnANumber안의 값)
	3. 리턴값 : void
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public void deleteBoardQnA(int boardQnANumber) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "DELETE FROM boardqna WHERE boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, boardQnANumber);
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}

	/*
	메소드 설명	
	1. 용도 : QnA게시판글을 수정하는 메소드(DB BoardQnA테이블 1개 행 수정)
	2. 매개변수 : BoardQnA boardQnA(BoardQnA클래스를 통해 생성된 참조값)
	3. 리턴값 : void
	4. BoardQnA Class 프로퍼티
		- 접근지정자는 모두 private임. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public void updateBoardQnA(BoardQnA boardQnA) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE boardqna SET boardqna_title=?,boardqna_content=?,boardqna_category=? WHERE boardqna_no=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, boardQnA.getBoardQnAtitle());
		preparedStatement.setString(2, boardQnA.getBoardQnAContent());
		preparedStatement.setString(3, boardQnA.getBoardQnACategory());
		preparedStatement.setInt(4, boardQnA.getBoardQnANumber());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
}
