package mx.itesm.assistadmin.database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 * Aqui mete tu codigo DANIEL
 *
 */
public class ReportManager {

	public static Object[][] reportByDate(String date){
		String query = "SELECT username, fecha, horaentrada, horasalida, actividad " +
				"FROM assistadmin.asistencia a, assistadmin.actividades ac, " +
				"assistadmin.users u WHERE a.userid = u.userid " +
				"AND a.actividadid = ac.actividadid AND fecha = ? " +
				"ORDER BY fecha DESC, horaentrada DESC";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, date);
		return DatabaseManager.runReportQuery(pstmt);
	}
	
	public static Object[][] reportByDateHour(String date, int hour){
		String query = "SELECT username, fecha, horaentrada, horasalida, actividad " +
				"FROM assistadmin.asistencia a, assistadmin.actividades ac, " +
				"assistadmin.users u WHERE a.userid = u.userid " +
				"AND a.actividadid = ac.actividadid AND fecha = ? " +
				"AND HOUR(horaentrada) = ? " +
				"ORDER BY fecha DESC, horaentrada DESC";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, date);
		DatabaseManager.setInt(pstmt, 2, hour);
		return DatabaseManager.runReportQuery(pstmt);
	}
	
	public static Object[][] reportByUser(int userid){
		String query = "SELECT fecha, actividad, horaentrada, horasalida, " +
					   "TIMEDIFF(horasalida, horaentrada)" +
					   "FROM asistencia, actividades " +
					   "WHERE userid = ? AND actividades.actividadid = asistencia.actividadid " +
					   "ORDER BY fecha DESC, horaentrada DESC";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setInt(pstmt, 1, userid);
		
		Object o[][] = null;
		ResultSet rs = DatabaseManager.runQuery(pstmt);
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
					if(column + 1 == columnCount){
						o[row][column] = rs.getTime(column + 1);
					} else{
						o[row][column] = rs.getObject(column + 1);
					}
				}
				row++;
			}
			DatabaseManager.close(rs);
		}catch(SQLException sqle){
			if(DatabaseManager.DEBUG){
				System.out.println("Error running report: " + sqle.getMessage());
			}
		}
		return o;
	}
	
	public static Object[][] getUsers(){
		String query = "SELECT userid, username " +
				"FROM assistadmin.users ORDER BY username";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		return DatabaseManager.runReportQuery(pstmt);
	}
	
}
