package mx.itesm.assistadmin.database;

import org.junit.Assert;
import org.junit.Test;

public class AccessManagerTest {

	@Test
	public void testWhoIsIn(){
		Object o[][] = AccessManager.whoIsIn();
		for(int i = 0; i < o.length; i++){
			for(int j = 0; j < o[0].length; j++){
				System.out.print(o[i][j] + " ");
			}
			System.out.println();
		}
	}
	
	//@Test
	public void testAuthorizedHost() {
		Assert.assertTrue(AccessManager.authorizedHost("22.2.2.2"));
		Assert.assertFalse(AccessManager.authorizedHost("22.2.3.2"));
		Assert.assertFalse(AccessManager.authorizedHost("22.5.2.2"));
		Assert.assertFalse(AccessManager.authorizedHost("3.3.3.33"));
		Assert.assertTrue(AccessManager.authorizedHost("255.255.255.255"));
	}
	
	//@Test
	public void testGoIn(){
		Assert.assertTrue(AccessManager.goIn(4, 4));
	}
	
	//@Test
	public void testGoOut(){
		Assert.assertTrue(AccessManager.goOut(3));
	}
	
	//@Test
	public void testHours(){
		Assert.assertEquals("1:24", AccessManager.computeHours(2, "2008-04-21", "2008-04-28"));
	}
	
	//@Test
	public void testActivities(){
		String[][] s = AccessManager.getActivities();
		for(int i = 0; i < s.length; i++){
			System.out.println(s[i][0] + "" + s[i][1]);
		}
	}

}
