package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import driverdb.DriverDB;
import dto.Activity;

public class ActivityDao {
	Connection connection = null;
	PreparedStatement preparedStatement = null;
	ResultSet resultSet = null;
	String sql = null;
	/*
	�޼ҵ� ����	
	1. �뵵 : ȸ���� 1���� Ȱ�������� �Է��ϴ� �޼ҵ���(Database�� activity���̺� 1������ �Է��ϴ� �޼ҵ�).
	2. �Ű����� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	3. ���ϰ� : void
	4. Activity Class ������Ƽ
		- ���������ڴ� ��� private��. 
		String memberId, int totalQuestion, int totalAnswer, int chooseAnswer, int activityScore
	*/
	public void insertActivity(Activity activity) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "INSERT INTO activity (member_id)	VALUES (?)";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, activity.getMemberId());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	/*
	�޼ҵ� ����	
	1. �뵵 : ȸ���� 1���� Ȱ�������� ��ȸ�ϴ� �޼ҵ���(Database�� activity���̺� 1������ ��ȸ�ϴ� �޼ҵ�).
	2. �Ű����� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	3. ���ϰ� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	4. Activity Class ������Ƽ
		- ���������ڴ� ��� private��. 
		String memberId, int totalQuestion, int totalAnswer, int chooseAnswer, int activityScore
	*/
	public Activity selectActivity(Activity activity) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "select member_id,total_question,total_answer,choose_answer,activity_score from activity where member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setString(1, activity.getMemberId());
		resultSet = preparedStatement.executeQuery();
		resultSet.next();
		activity.setMemberId(resultSet.getString(1));
		activity.setTotalQuestion(resultSet.getInt(2));
		activity.setTotalAnswer(resultSet.getInt(3));
		activity.setChooseAnswer(resultSet.getInt(4));
		activity.setActivityScore(resultSet.getInt(5));
		resultSet.close();
		preparedStatement.close();
		connection.close();
		return activity;
	}
	
	/*
	�޼ҵ� ����	
	1. �뵵 : ȸ���� 1���� Ȱ�������� �����ϴ� �޼ҵ���(Database�� activity���̺� 1������ �����ϴ� �޼ҵ�).
		- ������ �ۼ��� totalQuestion(��������+1) ��  activityScore(Ȱ������+10) ����
	2. �Ű����� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	3. ���ϰ� : void
	4. Activity Class ������Ƽ
		- ���������ڴ� ��� private��. 
		String memberId, int totalQuestion, int totalAnswer, int chooseAnswer, int activityScore
	*/
	public void questionFromUpdateActivity(Activity activity) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE activity SET total_question=?, total_answer=?, choose_answer=?, activity_score=? WHERE member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, activity.getTotalQuestion()+1);
		preparedStatement.setInt(2, activity.getTotalAnswer());
		preparedStatement.setInt(3, activity.getChooseAnswer());
		preparedStatement.setInt(4, activity.getActivityScore()+10);
		preparedStatement.setString(5, activity.getMemberId());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	/*
	�޼ҵ� ����	
	1. �뵵 : ȸ���� 1���� Ȱ�������� �����ϴ� �޼ҵ���(Database�� activity���̺� 1������ �����ϴ� �޼ҵ�).
		- �����ۿ� ���� �亯�� �ۼ��� totalAnswer(�Ѵ亯��+1) ��  activityScore(Ȱ������+10) ����
	2. �Ű����� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	3. ���ϰ� : void
	4. Activity Class ������Ƽ
		- ���������ڴ� ��� private��. 
		String memberId, int totalQuestion, int totalAnswer, int chooseAnswer, int activityScore
	*/
	public void answerFromUpdateActivity(Activity activity) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE activity SET total_question=?, total_answer=?, choose_answer=?, activity_score=? WHERE member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, activity.getTotalQuestion());
		preparedStatement.setInt(2, activity.getTotalAnswer()+1);
		preparedStatement.setInt(3, activity.getChooseAnswer());
		preparedStatement.setInt(4, activity.getActivityScore()+10);
		preparedStatement.setString(5, activity.getMemberId());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
	
	/*
	�޼ҵ� ����	
	1. �뵵 : ȸ���� 1���� Ȱ�������� �����ϴ� �޼ҵ���(Database�� activity���̺� 1������ �����ϴ� �޼ҵ�).
		- �����ۿ� ���� �亯�� �ۼ��� ChooseAnswer(ä�ô亯��+1) ��  activityScore(Ȱ������+20) ����
	2. �Ű����� : Activity activity(ActivityŬ������ ���� ������ activity��ü�� ������)
	3. ���ϰ� : void
	4. Activity Class ������Ƽ
		- ���������ڴ� ��� private��. 
		String memberId, int totalQuestion, int totalAnswer, int chooseAnswer, int activityScore
	*/
	public void chooseAnswerFromUpdateActivity(Activity activity) throws ClassNotFoundException, SQLException {
		DriverDB driverDB = new DriverDB();
		connection = driverDB.drivercon();
		sql = "UPDATE activity SET total_question=?, total_answer=?, choose_answer=?, activity_score=? WHERE member_id=?";
		preparedStatement = connection.prepareStatement(sql);
		preparedStatement.setInt(1, activity.getTotalQuestion());
		preparedStatement.setInt(2, activity.getTotalAnswer());
		preparedStatement.setInt(3, activity.getChooseAnswer()+1);
		preparedStatement.setInt(4, activity.getActivityScore()+20);
		preparedStatement.setString(5, activity.getMemberId());
		preparedStatement.executeUpdate();
		preparedStatement.close();
		connection.close();
	}
}

