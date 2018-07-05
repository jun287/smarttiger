package dao;
import driverdb.DriverDB;
import dto.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class GoodsDao {
	
	//상품등록시키는 메서드 dto로 값을 받는다
	public void insertGoods(Goods goods) throws ClassNotFoundException, SQLException{
		System.out.println("insertGoods");
		
		DriverDB driverdb=new DriverDB();
		Connection connection=null;
		PreparedStatement statement=null;
		String sql="insert into good(id,goods_title,goods_info,goods_price,goods_date,goods_img) values(?,?,?,?,CURDATE(),?)";
		
		
		connection=driverdb.drivercon();
		statement =connection.prepareStatement(sql);
		
		statement.setString(1, "1");
		statement.setString(2, goods.getGoods_title());
		statement.setString(3, goods.getGoods_info());
		statement.setString(4, goods.getGoods_price());
		statement.setString(5, goods.getGoods_img());
	
		statement.executeUpdate();
		
	}

	public ArrayList<Goods> selectGoods() throws ClassNotFoundException, SQLException {
		System.out.println("selectGodds");
		Connection connection=null;
		PreparedStatement statement =null;
		ResultSet resultSet=null;
		ArrayList<Goods> arrayGoods=new ArrayList<Goods>();
		DriverDB driverdb=new DriverDB();
	
		String sql="select goods_code,id,goods_title,goods_info,goods_price,goods_date,goods_img,goods_inquiry from good order by goods_code DESC";
		
		
		connection=driverdb.drivercon();
		statement =connection.prepareStatement(sql);
		
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
		return arrayGoods;
	}
}
