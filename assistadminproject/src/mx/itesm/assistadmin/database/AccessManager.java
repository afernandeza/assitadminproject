package mx.itesm.assistadmin.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccessManager {

	public static Object[][] whoIsIn(){
		String query = "SELECT actividad, username, " +
				"CONCAT(appaterno, ' ', apmaterno, ', ', nombre) AS nombrecom " +
				"FROM asistencia, actividades, users WHERE fecha = CURDATE() AND " +
				"horasalida IS NULL AND actividades.actividadid = asistencia.actividadid " +
				"AND asistencia.userid = users.userid ORDER BY nombrecom";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		return DatabaseManager.runReportQuery(pstmt);
	}
	
	public static boolean goIn(int userid, int actividadid){
		boolean successful = false;
		if(userIsOut(userid)){
			String goInQuery = "INSERT INTO asistencia VALUES(" +
							   "?, CURDATE(), CURTIME(), NULL, ?, NULL)";
			PreparedStatement pstmt = DatabaseManager.prepareStatement(goInQuery);
			DatabaseManager.setInt(pstmt, 1, userid);
			DatabaseManager.setInt(pstmt, 2, actividadid);
			successful = DatabaseManager.runUpdate(pstmt);
		} 
		return successful;
	}
	
	public static boolean goOut(int userid){
		boolean successful = false;
		if(userIsIn(userid)){
			String goInQuery = "UPDATE asistencia SET horasalida = CURTIME()" +
							   "WHERE fecha = CURDATE() AND horasalida IS NULL AND " +
							   "userid = ?";
			PreparedStatement pstmt = DatabaseManager.prepareStatement(goInQuery);
			DatabaseManager.setInt(pstmt, 1, userid);
			successful = DatabaseManager.runUpdate(pstmt);
		}
		return successful;
	}
	
	public static boolean userIsIn(int userid){
		String isInQuery = "SELECT COUNT(*) FROM asistencia " +
						   "WHERE fecha = CURDATE() " +
					       "AND userid = ? AND horasalida IS NULL";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(isInQuery);
		DatabaseManager.setInt(pstmt, 1, userid);
		int count = DatabaseManager.runCountQuery(pstmt);
		if(count == 1){
			return true;
		} else {
			return false;
		}
	}
	
	public static boolean userIsOut(int userid){
		return !userIsIn(userid);
	}
	
	/** has problems */
	public static String computeHours(int userid, String from, String to){
		String hours = "";
		String computeHoursQuery = "SELECT TIMEDIFF(horasalida, horaentrada)" +
								   "FROM asistencia WHERE horasalida IS NOT NULL " +
								   "AND userid = ? AND ? <= fecha AND fecha <= ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(computeHoursQuery);
		DatabaseManager.setInt(pstmt, 1, userid);
		DatabaseManager.setString(pstmt, 2, from);
		DatabaseManager.setString(pstmt, 3, to);
		ResultSet rs = DatabaseManager.runQuery(pstmt);
		try{
			rs.next();
			hours = rs.getTime(1).toString();
		} catch(SQLException sqle){
			if (DatabaseManager.DEBUG) {
				System.out.println("Error running query: " + sqle.getMessage());
			}
		}
		return hours;
	}
	
	public static String[][] getActivities(){
		String getActivitiesQuery = "SELECT actividadid, actividad FROM actividades ORDER BY actividad";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(getActivitiesQuery);
		
		ResultSet rs = DatabaseManager.runQuery(pstmt); 
		String[][] acts = null;
		try{
			rs.last();
			acts = new String[rs.getRow()][2];
			rs.beforeFirst();
			int i = 0;
			while(rs.next()){
				acts[i][0] = rs.getString("actividadid");
				acts[i][1] = rs.getString("actividad");
				i++;
			}
		} catch(SQLException sqle){
			if (DatabaseManager.DEBUG) {
				System.out.println("Error running query: " + sqle.getMessage());
			}
		}
		
		return acts;
	}
	
	public static boolean authorizedHost(String ip){
		String query = "SELECT COUNT(*) FROM authorizedhosts WHERE host = ?";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, ip);
		int count = DatabaseManager.runCountQuery(pstmt);
		if(count == 1){
			return true;
		} else {
			return false;
		}
	}
	
}
