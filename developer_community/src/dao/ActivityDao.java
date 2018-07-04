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
	메소드 설명	
	1. 용도 : 회원의 1명의 활동내역을 입력하는 메소드임(Database내 activity테이블에 1개행을 입력하는 메소드).
	2. 매개변수 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	3. 리턴값 : void
	4. Activity Class 프로퍼티
		- 접근지정자는 모두 private임. 
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
	메소드 설명	
	1. 용도 : 회원의 1명의 활동내역을 조회하는 메소드임(Database내 activity테이블에 1개행을 조회하는 메소드).
	2. 매개변수 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	3. 리턴값 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	4. Activity Class 프로퍼티
		- 접근지정자는 모두 private임. 
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
	메소드 설명	
	1. 용도 : 회원의 1명의 활동내역을 수정하는 메소드임(Database내 activity테이블에 1개행을 수정하는 메소드).
		- 질문글 작성시 totalQuestion(총질문수+1) 및  activityScore(활동점수+10) 증가
	2. 매개변수 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	3. 리턴값 : void
	4. Activity Class 프로퍼티
		- 접근지정자는 모두 private임. 
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
	메소드 설명	
	1. 용도 : 회원의 1명의 활동내역을 수정하는 메소드임(Database내 activity테이블에 1개행을 수정하는 메소드).
		- 질문글에 대한 답변글 작성시 totalAnswer(총답변수+1) 및  activityScore(활동점수+10) 증가
	2. 매개변수 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	3. 리턴값 : void
	4. Activity Class 프로퍼티
		- 접근지정자는 모두 private임. 
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
	메소드 설명	
	1. 용도 : 회원의 1명의 활동내역을 수정하는 메소드임(Database내 activity테이블에 1개행을 수정하는 메소드).
		- 질문글에 대한 답변글 작성시 ChooseAnswer(채택답변수+1) 및  activityScore(활동점수+20) 증가
	2. 매개변수 : Activity activity(Activity클래스를 통해 생성된 activity객체의 참조값)
	3. 리턴값 : void
	4. Activity Class 프로퍼티
		- 접근지정자는 모두 private임. 
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

