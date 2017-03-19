package SQLHelper;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import sun.security.x509.UniqueIdentity;

public class SqlHelper {
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=PurchaseAndSold";
	protected  Connection conn=null;
	Statement cmd=null;
	public SqlHelper() {
		try {
			conn = DriverManager.getConnection(url,"sa","ZHIwen1995");
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public ResultSet queryAllPeople(){
		return ExecuteQuery("select * from users");
	}
	
	public int Addpeople(String name,String age,String pwd,String rank){
		String uidString = RandomID("U");
		String sql = "insert into users values ('"+uidString+"','"+name+"',"+age+",'"+pwd+"',"+rank+")";
		return ExecuteUpdate(sql);
	}
	
	public int DeletePeople(String id) {
		String sqlString = "delete users where UID = '"+id+"'";
		System.out.println(sqlString);
		return ExecuteUpdate(sqlString);
	}
	public ResultSet queryAllGoods() {
		return ExecuteQuery("select * from goods");
	}
	
	public  ResultSet ExecuteQuery(String sql) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		} catch (Exception e) {
			System.out.println(e);
			// TODO: handle exception
		}
		try {
			cmd = conn.createStatement();
			ResultSet resultSet = cmd.executeQuery(sql);
			return resultSet;
		} catch (SQLException e) {
			// TODO: handle exception
			System.out.println(e);
			return null;
		}
	}
	
	public boolean IsInserted(String id){
		String sql = "select * from goods where gid = '"+id+"'";
		ResultSet res = ExecuteQuery(sql);
		try {
			if(res.getRow()>0)
				return true;
			else {
				return false;
			}
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
	
	public int ExecuteUpdate(String sql) {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			cmd = conn.createStatement();
			return cmd.executeUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	public int AddGoods(String goodid,String goodname,float pprice,float sprice,int count) {
		String sql = "insert into goods values ('"+goodid+"','"+goodname+"',"+pprice+sprice+count;
		return ExecuteUpdate(sql);
	}
	
	public  int  UPdateCount(String goodid,int addcount,int subcount) {
		int count = addcount - subcount;
		ResultSet goodSet = ExecuteQuery("select * from goods where gid = '"+goodid+"'");
		try {
			int precount =Integer.parseInt(goodSet.getString(5));
			int newcount = precount+count;
			String sql = "update goods set gcount = "+newcount+"where gid = '"+goodid+"'";
			return ExecuteUpdate(sql);
		} catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
		
	}
	
	public ResultSet QueryUser(String UId,String pwd) {
		String sqlString = "select * from users where uid = '"+UId+"' and upassword = '"+pwd+"'";
		return ExecuteQuery(sqlString);
	}
	
	public int AddSold(String UID,String goodid,int count) {
		String SID = RandomID("S");
		String sql = "insert into sold(SID,UID,GID,scount) values('"+SID+"','"+UID+"','"+goodid+"',"+count+")";
		System.out.println(sql);
		return ExecuteUpdate(sql);
	}
	
	public String RandomID(String R) {
        //设置要获取到什么样的时间
        SimpleDateFormat sdf = new SimpleDateFormat("MMddHHmmss");
        //获取String类型的时间
        Random random = new Random();
        String createdate =R+ sdf.format(new Date())+(random.nextInt(90) +10)  ;
        return createdate;
	}
	
	public ResultSet QuerySingleGood(String gid) {
		String sqlString  = "select * from goods where gid = '"+gid+"'";
		return ExecuteQuery(sqlString);
		}
	public int AddGood(String goodname,float pprice ,float sprice,int count) {
		String Gid = RandomID("G");
		String sql = "insert into goods values('"+Gid+"','"+goodname+"',"+pprice+","+sprice+","+count+")";
		System.out.println(sql);
		return ExecuteUpdate(sql);
	}
	public int AddPur(String Pur,String goodid,int count) {
		String PTID = RandomID("PT");
		String sql = "insert into ptable(PTID,GID,PID,ptcount) values('"+PTID+"','"+goodid+"','"+Pur+"',"+count+")";
		System.out.println(sql);
		return ExecuteUpdate(sql);
	}
}
