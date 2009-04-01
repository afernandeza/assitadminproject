package mx.itesm.assistadmin.database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class DatabaseManager {

	private static final String DATABASE = "assistadmin";
	private static final String USERNAME = "assistadmin";
	private static final String PASSWORD = "assistadmin";

	public static final boolean DEBUG = true;

	public static int runCountQuery(PreparedStatement query){
		int count = -1;
		ResultSet rs = runQuery(query);
		try{
			rs.next();
			count = rs.getInt(1);
			close(rs);
			close(query);
		} catch(SQLException sqle){
			if(DatabaseManager.DEBUG){
				System.out.println("Error reading resultset: " + sqle.getMessage());
			}
		}
		return count;
	}
	
	public static Object[][] runReportQuery(PreparedStatement pstmt){
		Object o[][] = null;
		ResultSet rs = runQuery(pstmt);
		try{
			rs.last();
			int rowCount = rs.getRow();
			rs.beforeFirst();
			ResultSetMetaData rsMetaData = rs.getMetaData();
			int columnCount = rsMetaData.getColumnCount();
			o = new Object[rowCount][columnCount];
			
			int row = 0;
			while(rs.next()){
				for(int column = 0; column < columnCount; column++){
					o[row][column] = rs.getObject(column + 1);
				}
				row++;
			}
			close(rs);
		}catch(SQLException sqle){
			if(DatabaseManager.DEBUG){
				System.out.println("Error running report: " + sqle.getMessage());
			}
		}
		return o;
	}
	
	public static Object[] runListingQuery(PreparedStatement query){
		ResultSet rs = runQuery(query);
		Object[] o = null;
		try{
			rs.last();
			int rowCount = rs.getRow();
			o = new Object[rowCount];
			rs.beforeFirst();
			int i = 0;
			while(rs.next()){
				o[i] = rs.getObject(1);
				i++;
			}
		} catch(SQLException sqle){
			if(DatabaseManager.DEBUG){
				System.out.println("Error reading resultset: " + sqle.getMessage());
			}
		}
		return o;
	}
	
	public static ResultSet runQuery(PreparedStatement query){
		ResultSet rs = null;
		try{
			rs = query.executeQuery();
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error running query: " + sqle.getMessage());
			}
		}
		return rs;
	}
	
	public static boolean runUpdate(PreparedStatement query){
		List<PreparedStatement> queries = new LinkedList<PreparedStatement>();
		queries.add(query);
		return runTransaction(queries);
	}
	
	public static boolean runTransaction(List<PreparedStatement> queries) {
		boolean successful = false;
		Connection conn = connect();
		try {
			conn.setAutoCommit(false);
			for(PreparedStatement query: queries){
				query.executeUpdate();
				close(query);
			}
			commit(conn);
			successful = true;
		} catch (SQLException sqle) {
			successful = false;
			if (DEBUG) {
				System.out.println("Error in transaction: " + sqle.getMessage());
			}
			rollback(conn);
		}
		close(conn);
		return successful;
	}
	
	public static void setString(PreparedStatement pstmt, int index, String x){
		if(pstmt == null || x == null || index <= 0){
			throw new IllegalArgumentException("Argumento invalido");
		}
		try{
			pstmt.setString(index, x);
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error setting string: " + sqle.getMessage());
			}
		}
	}
	
	public static void setDate(PreparedStatement pstmt, int index, Date x){
		if(pstmt == null || x == null || index <= 0){
			throw new IllegalArgumentException("Argumento invalido");
		}
		try{
			pstmt.setDate(index, x);
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error setting string: " + sqle.getMessage());
			}
		}
	}
	
	public static void setNull(PreparedStatement pstmt, int index){
		if(pstmt == null || index <= 0){
			throw new IllegalArgumentException("Argumento invalido");
		}
		try{
			pstmt.setNull(index, java.sql.Types.VARCHAR);
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error setting null: " + sqle.getMessage());
			}
		}
	}
	
	public static void setInt(PreparedStatement pstmt, int index, int x){
		if(pstmt == null || index <= 0){
			throw new IllegalArgumentException("Argumento invalido");
		}
		try{
			pstmt.setInt(index, x);
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error setting integer: " + sqle.getMessage());
			}
		}
	}
	
	public static PreparedStatement prepareStatement(String sql){
		PreparedStatement pstmt = null;
		Connection conn = connect();
		try{
			pstmt = conn.prepareStatement(sql);
		}catch(SQLException sqle){
			if (DEBUG) {
				System.out.println("Error preparing statement: " + sqle.getMessage());
			}
		}
		return pstmt;
	}

	public static void commit(Connection conn) {
		try {
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException sqle) {
			if (DEBUG) {
				System.out.println("Error comitting: " + sqle.getMessage());
			}
		}
	}
	
	public static void rollback(Connection conn) {
		try {
			conn.rollback();
			conn.setAutoCommit(true);
		} catch (SQLException sqle) {
			if (DEBUG) {
				System.out.println("Error rolling back: " + sqle.getMessage());
			}
		}
	}

	public static Connection connect() {
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"
					+ DATABASE, USERNAME, PASSWORD);
		} catch (Exception sqle) {
			if (DEBUG) {
				System.out.println("Error connecting: " + sqle.getMessage());
			}
		}
		return conn;
	}

	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (Exception sqle) {
				if (DEBUG) {
					System.out.println("Error closing connection: " + sqle.getMessage());
				}
			}
		}
	}

	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (Exception sqle) {
				if (DEBUG) {
					System.out.println("Error closing statement" + sqle.getMessage());
				}
			}
		}
	}
	
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (Exception sqle) {
				if (DEBUG) {
					System.out.println("Error closing resultset: " + sqle.getMessage());
				}
			}
		}
	}
}
