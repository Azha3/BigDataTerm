package com.icss.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.icss.util.DbInfo;

public abstract class BaseDao {
	
protected Connection connection;	


	public Connection getConnection() throws Exception {
		this.OpenConncetion();
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	/**
	 * 通过JDBC直接从oracle获取数据库连接池
	 * @throws Exception
	 */
	public void OpenConncetion() throws Exception{
		try {
			if(connection == null || connection.isClosed()){
				
				DbInfo dbInfo = DbInfo.instance();				
				Class.forName(dbInfo.getDbdriver());	    //反射检查驱动包是否存在
				connection = DriverManager.getConnection(dbInfo.getDbUrl(),dbInfo.getUname(),dbInfo.getPwd());	
			}			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			throw e;
		}catch (SQLException e){
			e.printStackTrace();
			throw e;
		}		
		
	}
	
	/**
	 * 此处的异常，不需抛出，只需要记录
	 */
	public void closeConnection(){
		
		if( connection != null){
			try {
				if(!connection.isClosed())
					connection.close();	
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	public void beginTransaction() throws Exception{		
		this.OpenConncetion();
		this.connection.setAutoCommit(false);		
	}
	
	public void commit() throws Exception{
		
		if(this.connection != null)
			this.connection.commit();
		
	}
	
	public void rollback() throws Exception{
		if(this.connection != null){
			this.connection.rollback();
		}		
	}
	
	
	public  int getRecCount(String strSql){
		int iRec = 0;
		
		//mysql 中必须加别名w
		String strExe = "SELECT count(*) FROM (" + strSql + ") w";	
		Object obj = executeScalar(strExe);
		if(obj != null){
			iRec = Integer.parseInt(obj.toString());		
		}
		
		return iRec;
	}
	
	//返回查询结果的第一行第一列的值(---如果没有查询结果，则返回null)
	private  Object executeScalar(String strSql){
		ResultSet rs;			
		Object obj;
		
		obj = null;
		rs = null;
		try{			
			Statement st = this.connection.createStatement();						
			rs = st.executeQuery(strSql);
			if( rs != null ){
				while( rs.next()){
					if(rs.isFirst()){
						obj = rs.getObject(1);       //columnIndex - 第一个列是 1
						break;
					}						
				}
				rs.close();
			}				
		}
		catch(SQLException ex){
		  ex.printStackTrace();				
		}			
		return obj;
	}    
	
}
