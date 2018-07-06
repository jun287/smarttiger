package dao;
import driverdb.DriverDB;
import dto.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GoodsDao {
	
	//��ǰ��Ͻ�Ű�� �޼��� dto�� ���� �޴´�
	public void insertGoods(Goods goods,String id,String email) throws ClassNotFoundException, SQLException{
		System.out.println("insertGoods");
		
		DriverDB driverdb=new DriverDB();
		Connection connection=null;
		PreparedStatement statement=null;
		String sql="insert into good(id,email,goods_title,goods_info,goods_price,goods_date,goods_img) values(?,?,?,?,?,CURDATE(),?)";
		
		
		connection=driverdb.drivercon();
		statement =connection.prepareStatement(sql);
		
		statement.setString(1, id);
		statement.setString(2, email);
		statement.setString(3, goods.getGoods_title());
		statement.setString(4, goods.getGoods_info());
		statement.setString(5, goods.getGoods_price());
		statement.setString(6, goods.getGoods_img());
	
		statement.executeUpdate();
		
		statement.close();
		connection.close();
	}
	//��ǰ ����Ʈ ��ȸ
	public ArrayList<Goods> selectGoodsList(int currentPage,int row) throws ClassNotFoundException, SQLException {
		System.out.println("selectGodds");
		Connection connection=null;
		PreparedStatement statement =null;
		ResultSet resultSet=null;
		ArrayList<Goods> arrayGoods=new ArrayList<Goods>();
		DriverDB driverdb=new DriverDB();
		
		String sql="select goods_code,id,goods_title,goods_info,goods_price,goods_date,goods_img,goods_inquiry from good order by goods_code DESC limit ?,?";
		
		int start=(currentPage-1)*row;
		connection=driverdb.drivercon();
		statement =connection.prepareStatement(sql);
		statement.setInt(1,start);
		statement.setInt(2,row);
		resultSet=statement.executeQuery();
		
		while(resultSet.next()){
			Goods goods=new Goods();
			goods.setGoods_code(resultSet.getString("goods_code"));
			goods.setGoods_title(resultSet.getString("goods_title"));
			goods.setId(resultSet.getString("id"));
			goods.setGoods_date(resultSet.getString("goods_date"));
			goods.setGoods_inquiry(resultSet.getString("goods_inquiry"));
			
			arrayGoods.add(goods);
		}
		resultSet.close();
		statement.close();
		connection.close();
		
		return arrayGoods;
	}

	//Ư����ǰ �����ֱ�
	public Goods selectGoods(String goodscode) throws ClassNotFoundException, SQLException{
		System.out.println("selectGoods");
		
		DriverDB driverdb=new DriverDB();
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		String sql="select goods_code,id,email,goods_title,goods_info,goods_price,goods_date,goods_img,goods_inquiry from good  where goods_code =? order by goods_code DESC";
	
		connection=driverdb.drivercon();
		statement=connection.prepareStatement(sql);
		statement.setString(1, goodscode);
		resultSet=statement.executeQuery();
		
		Goods goods=new Goods();
		
		if(resultSet.next()) {
		goods.setGoods_code(resultSet.getString("goods_code"));
		goods.setId(resultSet.getString("id"));
		goods.setEmail(resultSet.getString("email"));
		goods.setGoods_title(resultSet.getString("goods_title"));
		goods.setGoods_price(resultSet.getString("goods_price"));
		goods.setGoods_info(resultSet.getString("goods_info"));
		goods.setGoods_date(resultSet.getString("goods_date"));
		goods.setGoods_img(resultSet.getString("goods_img"));
		goods.setGoods_inquiry(resultSet.getString("goods_inquiry"));
		}
		resultSet.close();
		statement.close();
		connection.close();
		
		return goods;
	}
	//��ǰ���� ������Ʈ
	public void updateGoods(Goods goods) throws ClassNotFoundException, SQLException {
		System.out.print("updateGoods");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		DriverDB driverdb=new DriverDB();
		connection=driverdb.drivercon();
		String sql="update good set goods_title=?,goods_info=?,goods_price=?,goods_img=? where goods_code=?";
		
		statement=connection.prepareStatement(sql);
		statement.setString(1, goods.getGoods_title());
		statement.setString(2, goods.getGoods_info());
		statement.setString(3, goods.getGoods_price());
		statement.setString(4, goods.getGoods_img());
		statement.setString(5, goods.getGoods_code());
		
		statement.executeUpdate();
		
		statement.close();
		connection.close();
	}
	//��ǰ���� ����
	public void deleteGoods(String goodscode) throws ClassNotFoundException, SQLException {
		System.out.println("deleteGoods");
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		DriverDB driverdb=new DriverDB();
		connection=driverdb.drivercon();
		
		String sql="delete from good where goods_code=? ";
		statement=connection.prepareStatement(sql);
		statement.setString(1, goodscode);
		statement.executeUpdate();
		
		
		statement.close();
		connection.close();
	}
	//����¡
	public int paging(int row) throws ClassNotFoundException, SQLException {
		System.out.println("paging()");
		
		Connection connection=null;
		PreparedStatement statement=null;
		ResultSet resultSet=null;
		
		DriverDB driverDb=new DriverDB();
		connection= driverDb.drivercon();
		
		String sql="select count(*) from good";
		statement=connection.prepareStatement(sql);
		
		resultSet=statement.executeQuery();
		
		int total=0;
		
		if(resultSet.next()) {
			if(resultSet.getInt("count(*)")%row==0) {
				total=resultSet.getInt("count(*)")/row;
			}else if(resultSet.getInt("count(*)")%row!=0) {
				total=(resultSet.getInt("count(*)")/row)+1;
			}
			
		}
		
		resultSet.close();
		statement.close();
		connection.close();
		
		return total;
	}
	//��ȸ�� ����
	public void insertInquiry(int goods_inquiry,String goods_code) throws ClassNotFoundException, SQLException {
		
		Connection connection=null;
		PreparedStatement statement=null;
		
		
		DriverDB driverDb=new DriverDB();
		connection=driverDb.drivercon();
		
		String sql="update good set goods_inquiry=? where goods_code=?";
		
		statement=connection.prepareStatement(sql);
		statement.setInt(1, goods_inquiry);
		statement.setString(2, goods_code);
		
		statement.executeUpdate();
		
		statement.close();
		connection.close();
		
	}
}
