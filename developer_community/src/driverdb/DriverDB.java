package driverdb;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DriverDB {
	public Connection  drivercon() throws SQLException, ClassNotFoundException {
		System.out.println("01����̹��ε���DB����");
		
		//ip�ּ�,��Ʈ��ȣ,db��,�����id,�����pw
		String dbname="jdbc:mysql://localhost:3306/developer_community?\" +\"useUnicode=true&characterEncoding=euckr";
		String dbid="java";
		String dbpw="java0000";
		
		//driver�ּ�
		String dbdriver="com.mysql.jdbc.Driver";
		
		//driver�ε�
		Class.forName(dbdriver);
		
		//db����
		Connection conn=DriverManager.getConnection(dbname,dbid,dbpw);
		
		System.out.println(conn+"<--conn");
		return conn;
	}
}
