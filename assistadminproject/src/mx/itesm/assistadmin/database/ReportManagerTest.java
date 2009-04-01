package mx.itesm.assistadmin.database;

import org.junit.Test;

public class ReportManagerTest {

	@Test
	public void reportByUser(){
		Object o[][] = ReportManager.reportByUser(2);
		for(int i = 0; i < o.length; i++){
			for(int j = 0; j < o[0].length; j++){
				System.out.print(o[i][j] + " ");
			}
			System.out.println();
		}
	}
	
	//@Test
	public void reportByDate(){
		Object o[][] = ReportManager.reportByDate("2008-04-28");
		for(int i = 0; i < o.length; i++){
			for(int j = 0; j < o[0].length; j++){
				System.out.print(o[i][j] + " ");
			}
			System.out.println();
		}
	}
	
}
