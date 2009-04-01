package mx.itesm.assistadmin.database;

import java.sql.PreparedStatement;
import java.util.LinkedList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;

public class DatabaseManagerTest {

	//@Test
	public void testRunQuery() {
		List<PreparedStatement> queries = new LinkedList<PreparedStatement>();
		String query = "INSERT INTO authorizedhosts VALUES(?)";
		
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt, 1, "5.5.5.5");
		
		PreparedStatement pstmt2 = DatabaseManager.prepareStatement(query);
		DatabaseManager.setString(pstmt2, 1, "6.6.6.6");
		
		queries.add(pstmt);
		queries.add(pstmt2);
		
		Assert.assertTrue(DatabaseManager.runTransaction(queries));
	}
	
	//@Test
	public void testListing(){
		String getActivitiesQuery = "SELECT actividad FROM actividades ORDER BY actividad";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(getActivitiesQuery);
		Object[] o = DatabaseManager.runListingQuery(pstmt);
		for(Object ob: o){
			System.out.println(ob);
		}
	}
	
	@Test
	public void testObjsQueries(){
		String query = "SELECT * FROM actividades";
		PreparedStatement pstmt = DatabaseManager.prepareStatement(query);
		Object o[][] = DatabaseManager.runReportQuery(pstmt);
		for(int i = 0; i < o.length; i++){
			for(int j = 0; j < o[0].length; j++){
				System.out.print(o[i][j] + " ");
			}
			System.out.println();
		}
	}
}
