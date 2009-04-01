package mx.itesm.assistadmin.database;

import java.sql.PreparedStatement;

public class UsersManager {
	
	public static boolean deleteUser(int userid){
		String query = "DELETE FROM users WHERE userid = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setInt(pstmt, 1, userid);
		return DatabaseManager.runUpdate(pstmt);
	}
	
	public static boolean updateUser(String nombre, String appat, String apmat,
			 String rol, String username, String password, int userid){
		String query = "UPDATE users SET nombre = ?, appaterno = ?, apmaterno = ?," +
				"username = ?, password = ? WHERE userid = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, nombre);
		DatabaseManager.setString(pstmt, 2, appat);
		DatabaseManager.setString(pstmt, 3, apmat);
		DatabaseManager.setString(pstmt, 4, username);
		DatabaseManager.setString(pstmt, 5, password);
		DatabaseManager.setInt(pstmt, 6, userid);
		return DatabaseManager.runUpdate(pstmt);
	}
	
	public static boolean insertUser(String nombre, String appat, String apmat,
									 String rol, String username, String password){
		String insertQuery = "INSERT INTO users SET nombre = ?, appaterno = ?, " +
							 "apmaterno = ?, username = ?, password = ?";
		PreparedStatement pstmt1 = DatabaseManager.prepareStatement(insertQuery);
		DatabaseManager.setString(pstmt1, 1, nombre);
		DatabaseManager.setString(pstmt1, 2, appat);
		DatabaseManager.setString(pstmt1, 3, apmat);
		DatabaseManager.setString(pstmt1, 4, username);
		DatabaseManager.setString(pstmt1, 5, password);
		
		String insertRoleQuery = "INSERT INTO userroles values(?, ?, NULL)";
		PreparedStatement pstmt2 = DatabaseManager.prepareStatement(insertRoleQuery);
		DatabaseManager.setString(pstmt2, 1, username);
		DatabaseManager.setString(pstmt2, 2, rol);
		
		return DatabaseManager.runUpdate(pstmt1) && DatabaseManager.runUpdate(pstmt2);
	}
	
	public static Object[][] getUsers(){
		String query = "SELECT userid, username, " +
					   "CONCAT(appaterno, ' ', apmaterno, ', ', nombre) as nombre " +
					   "FROM users ORDER BY nombre";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		return DatabaseManager.runReportQuery(pstmt);
	}

	public static boolean updateUser(int userid, String email, String telcasa, String telcel, 
			String callenum, String numint, String colonia, String delegacion, 
			String ciudad, String estado, String password, String newpassword){
		boolean successful = false;
		if(checkPassword(userid, password)){
			String updateUserQuery = "UPDATE users SET email = ?, telcasa = ?, " +
			"telcel = ?, callenumero = ?, numint = ?, colonia = ?," +
			"delegacion = ?, ciudad = ?, estado = ?, password = ? WHERE userid = ?";
			PreparedStatement pstmt = DatabaseManager.prepareStatement(updateUserQuery);
			DatabaseManager.setString(pstmt, 1, email);
			DatabaseManager.setString(pstmt, 2, telcasa);
			if(telcel == null || telcel.equals("")){
				DatabaseManager.setNull(pstmt, 3);
			} else {
				DatabaseManager.setString(pstmt, 3, telcel);	
			}
			
			DatabaseManager.setString(pstmt, 4, callenum);
			
			if(numint == null || numint.equals("")){
				DatabaseManager.setNull(pstmt, 5);
			} else {
				DatabaseManager.setString(pstmt, 5, numint);
			}
			DatabaseManager.setString(pstmt, 6, colonia);
			DatabaseManager.setString(pstmt, 7, delegacion);
			DatabaseManager.setString(pstmt, 8, ciudad);
			DatabaseManager.setString(pstmt, 9, estado);
			if(newpassword == null || newpassword.equals("")){
				DatabaseManager.setString(pstmt, 10, password);	
			} else{
				DatabaseManager.setString(pstmt, 10, newpassword);	
			}
			DatabaseManager.setInt(pstmt, 11, userid);
			successful = DatabaseManager.runUpdate(pstmt);
		}
		return successful;
	}
	
	public static String getAttribute(String attribute, int userid){
		String getAttributeQuery = "SELECT " + attribute + " FROM users WHERE userid = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(getAttributeQuery);
		DatabaseManager.setInt(pstmt, 1, userid);
		Object o[] = DatabaseManager.runListingQuery(pstmt);
		if(o[0] == null)
			return "";
		return o[0].toString();		
	}
	
	public static boolean checkPassword(int userid, String password){
		boolean successful = false;
		String checkPasswordQuery = "SELECT COUNT(*) FROM users WHERE userid = ? AND password = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(checkPasswordQuery);
		DatabaseManager.setInt(pstmt, 1, userid);
		DatabaseManager.setString(pstmt, 2, password);
		int count = DatabaseManager.runCountQuery(pstmt);
		if(count == 1)
			successful = true;
		return successful;
		
	}
	
	public static int getUserId(String userName){
		String query = "SELECT userid FROM users WHERE username = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, userName);
		int id = DatabaseManager.runCountQuery(pstmt);
		return id;
	}
	
	public static String getFullName(int userid){
		String query = "SELECT CONCAT(nombre, ' ', appaterno) FROM users WHERE userid = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setInt(pstmt, 1, userid);
		Object o[] = DatabaseManager.runListingQuery(pstmt);
		return o[0].toString();
	}
}
