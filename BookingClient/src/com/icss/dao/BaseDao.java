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
	 * ͨ��JDBCֱ�Ӵ�oracle��ȡ���ݿ����ӳ�
	 * @throws Exception
	 */
	public void OpenConncetion() throws Exception{
		try {
			if(connection == null || connection.isClosed()){
				
				DbInfo dbInfo = DbInfo.instance();				
				Class.forName(dbInfo.getDbdriver());	    //�������������Ƿ����
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
	 * �˴����쳣�������׳���ֻ��Ҫ��¼
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
		
		//mysql �б���ӱ���w
		String strExe = "SELECT count(*) FROM (" + strSql + ") w";	
		Object obj = executeScalar(strExe);
		if(obj != null){
			iRec = Integer.parseInt(obj.toString());		
		}
		
		return iRec;
	}
	
	//���ز�ѯ����ĵ�һ�е�һ�е�ֵ(---���û�в�ѯ������򷵻�null)
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
						obj = rs.getObject(1);       //columnIndex - ��һ������ 1
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
