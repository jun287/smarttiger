package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import driverdb.DriverDB;
import dto.Member;

public class MemberDao {
	
	Connection connection = null;
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	
	public void memberDelete(String id, String pw) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
			
		
	}
	// id �� level�� �Ű������� �޾Ƽ� �����ͺ��̽� ���̺� level �÷��� �����ϴ� �޼��� ����
	public void memberLevel(String id ,String level) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("UPDATE member SET level=? WHERE id=?");
		
		statement.setString(1, level);
		statement.setString(2, id);
		
		statement.executeUpdate();
		
		statement.close();
		connection.close();
		
	}
	// ������ ȸ�������� ���� Member��ü�� �ּҰ��� �Ű������� �Ͽ� �����ͺ��̽��� ���̺� �����͸� �����ϴ� �޼��� ���� 
	public void memberUpdate(Member member) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("UPDATE member SET pw=?,name=?,level=?,email=?,phone=? WHERE id=?");
		
		statement.setString(1, member.getPw());
		statement.setString(2, member.getName());
		statement.setString(3, member.getLevel());
		statement.setString(4, member.getEmail());
		statement.setString(5, member.getPhone());
		statement.setString(6, member.getId());
		
		statement.executeUpdate();
		
		statement.close();
		connection.close();
	}
	// �������� ID�� �Ű������� �޾Ƽ� �����ͺ��̽� ���̺��� ��ȸ�ϰ� ȸ�� ������ member Ŭ������ü�� �����Ͽ� ���Թ޾� ��ü�� �ּҸ� �����ϴ� �޼��� ����
	public Member memberInformationSelect(String id) throws ClassNotFoundException, SQLException {
		
		Member member = new Member();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("SELECT * FROM member WHERE id=?");
		
		statement.setString(1, id);
		
		resultSet = statement.executeQuery();

		if(resultSet.next()){	
			member.setId(resultSet.getString("id"));
			member.setPw(resultSet.getString("pw"));
			member.setName(resultSet.getString("name"));
			member.setLevel(resultSet.getString("level"));
			member.setEmail(resultSet.getString("email"));
			member.setPhone(resultSet.getString("phone"));
		}
		
		statement.close();
		connection.close();
		
		return member;
		
	}
	// ȸ�� id �� �Ű������� �޾Ƽ� ����ó�� �� id,level,name �� �����ͺ��̽����̺��� ��ȸ�� member Ŭ������ü�� �����ϰ� �����ϴ� �޼��� ����(���� ó���� �ʿ�)
	public Member memberGetForSession(String id) throws ClassNotFoundException, SQLException {
		
		Member member = new Member();
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("SELECT id,level,name FROM member WHERE id=?");
		
		statement.setString(1, id);
		resultSet = statement.executeQuery();

		if(resultSet.next()){	
			member.setId(resultSet.getString("id"));
			member.setLevel(resultSet.getString("level"));
			member.setName(resultSet.getString("name"));
			
		}

		statement.close();
		connection.close();
		
		return member;	
	}
	// id �� pw �� �޾Ƽ� id�� �����ͺ��̽� ��ȸ�� ���ǹ����� ����� �� ��� result �� �޾� �����ϴ� �޼��� ����(�α��ν� �ʿ�)
	public String memberLogin(String id, String pw) throws ClassNotFoundException, SQLException {
		
		DriverDB driverDb = new DriverDB();
		connection = driverDb.drivercon();
		
		String result = null;
		
		statement = connection.prepareStatement("SELECT pw,level,name,id FROM member WHERE id=?");
		statement.setString(1, id);
		
		resultSet = statement.executeQuery();
		
		if(resultSet.next()) {
			if(pw.equals(resultSet.getString("pw"))){
				System.out.println("01�α��� ����");
				result = "01�α��� ����";
			}else {
				System.out.println("03��� ����ġ");
				result = "03��� ����ġ";
			}
		}else {
			System.out.println("02���̵� ����ġ");
			result = "02���̵� ����ġ";
		}
		
		statement.close();
		connection.close();
		
		return result;
	}
	// ȸ�������� ��� member Ŭ������ü�� �ּҰ��� �Ű������� �޾Ƽ� �����ͺ��̽��� �Է��ϴ� �޼��� ����
	public void memberJoin(Member member) throws SQLException, ClassNotFoundException {
		
		DriverDB driverDb = new DriverDB();
		
		connection = driverDb.drivercon();
		
		statement = connection.prepareStatement("INSERT INTO member(id,pw,name,phone,email,joindate) VALUES(?,?,?,?,?,now())");
		// joinForm ���� ���� ������ �����ͺ��̽� ���̺�ȿ� �ֱ����� Query ���� �ۼ��ϰ� ��ü�� �����ؼ� �غ��մϴ�.
		// ������ �������ݴϴ�.
		statement.setString(1, member.getId());
		statement.setString(2, member.getPw());
		statement.setString(3, member.getName());
		statement.setString(4, member.getPhone());
		statement.setString(5, member.getEmail());

		statement.executeUpdate();
		
		statement.close();
		connection.close();
	}
}
