// 28�� 2018. 7. 5(��) �̿��� BoardQnADao.java
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
	�޼ҵ� ����	
	1. �뵵 : �� ���� QnA�Խ��� �� �Է�(DB BoardQnA���̺� 1�� �� �Է�)
	2. �Ű����� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ boardQnA��ü�� ������)
	3. ���ϰ� : void
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : ��ü QnA�Խ��Ǳ��� ��ü���� ���� ��ȸ�ϴ� �޼ҵ�(DB BoardQnA���̺� ��ü ���� ���� ��ȸ)
	2. �Ű����� : int pagePerRow(�������� �� ���� ��)
	3. ���ϰ� : int lastPage(�� ���� �� / �������� �� ���� ���� ���� ���������� 0�ϰ�� �״��, 0�� �ƴҰ�� last page +1)
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
	�޼ҵ� ����	
	1. �뵵 : ��ü QnA�Խ��Ǳ��� �˻����ǿ� ���� ��ȸ, �˻����Ǿ����� ��ü��ȸ(DB BoardQnA���̺� Ư������ �� ��ȸ)
	2. �Ű����� : String beginDate(�˻����۳�¥), String endDate(�˻����ᳯ¥), String sk(�˻�����), String sv(�˻��ܾ�), int currentPage(����������), int pagePerRow(�������� �� ���� ��)
	3. ���ϰ� : ArrayList<BoardQnA>
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
		int boardQnANumber, String memberId, String boardQnAtitle, String boardQnAContent, String boardQnADate
		int boardQnAhits, String boardQnACategory
	*/
	public ArrayList<BoardQnA> selectBoardQnASearch(String beginDate, String endDate, String sk, String sv, int currentPage, int pagePerRow) throws ClassNotFoundException, SQLException{
		ArrayList<BoardQnA> boardQnAList = new ArrayList<>();
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		int startRow = (currentPage-1)*pagePerRow;
		if(!beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("01���� beginDate,endDate,sk,sv ��� ���� �ִ�");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(!beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("02���� beginDate,endDate,sk�� ���� �ְ� sv���� ����");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(!beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("03���� beginDate���� �ְ�,endDate���� ����,sk�� ���� �ְ� sv���� �ִ�");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, "2099-12-31");
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(!beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("04���� beginDate���� �ְ�,endDate���� ����,sk�� ���� �ְ� sv���� ����");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, "2099-12-31");
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && !sv.equals("")) {
			System.out.println("05���� beginDate���� ����,endDate���� �ְ�,sk�� ���� �ְ� sv���� �ִ�");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? and "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setString(3, sv);
			preparedStatement.setInt(4, startRow);
			preparedStatement.setInt(5, pagePerRow);
		}else if(beginDate.equals("") &&  !endDate.equals("") && !sk.equals("") && sv.equals("")) {
			System.out.println("06���� beginDate���� ����,endDate���� �ְ�,sk�� ���� �ְ� sv���� ����");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where boardqna_date BETWEEN ? and ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, beginDate);
			preparedStatement.setString(2, endDate);
			preparedStatement.setInt(3, startRow);
			preparedStatement.setInt(4, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && !sv.equals("")){
			System.out.println("07���� beginDate���� ����,endDate���� ����,sk�� ���� �ְ� sv���� �ִ�");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " where "+sk+" like ? order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, sv);
			preparedStatement.setInt(2, startRow);
			preparedStatement.setInt(3, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && !sk.equals("") && sv.equals("")){
			System.out.println("08���� beginDate���� ����,endDate���� ����,sk�� ���� �ְ� sv���� ����");
			sql = "select boardqna_category,boardqna_no, boardqna_title, member_id, boardqna_date, hits from boardqna"
					+ " order by boardqna_date desc limit ?,?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
		}else if(beginDate.equals("") &&  endDate.equals("") && sk.equals("") && sv.equals("")){
			System.out.println("09���� beginDate,endDate,sk,sv��� ���� ����");
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
	�޼ҵ� ����	
	1. �뵵 : ��ü QnA�Խ��Ǳ� �� �Ѱ��� ���� ��ȸ(DB BoardQnA���̺� 1�� �� ��ȸ)
	2. �Ű����� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ ������)
	3. ���ϰ� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ ������)
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : QnA�Խ��Ǳ��� ��ȸ(����)�� ��ȸ��(hits�÷� ����)(DB BoardQnA���̺� 1�� �� ����)
	2. �Ű����� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ ������)
	3. ���ϰ� : void
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : QnA�Խ��Ǳ��� 1���� �����ϴ� �޼ҵ�(DB BoardQnA���̺� 1�� �� ����)
	2. �Ű����� : int boardQnANumber(db���̺��� boardQnANumber���� ��)
	3. ���ϰ� : void
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
	�޼ҵ� ����	
	1. �뵵 : QnA�Խ��Ǳ��� �����ϴ� �޼ҵ�(DB BoardQnA���̺� 1�� �� ����)
	2. �Ű����� : BoardQnA boardQnA(BoardQnAŬ������ ���� ������ ������)
	3. ���ϰ� : void
	4. BoardQnA Class ������Ƽ
		- ���������ڴ� ��� private��. 
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
