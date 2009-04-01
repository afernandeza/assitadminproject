package mx.itesm.assistadmin.database;

import org.junit.Assert;
import org.junit.Test;

public class UsersManagerTest {

	@Test
	public void testInsert(){
		System.out.println(UsersManager.insertUser("afita", "paterno", 
				"materno", "tutor", "afita", "passafa"));
	}
	
	//@Test
	public void testGetUserId() {
		Assert.assertEquals(UsersManager.getUserId("afa"), 2);
	}
	
	//@Test
	public void testGetfullname() {
		System.out.println(UsersManager.getFullName(2));
	}
	
	//@Test
	public void checkPassword(){
		Assert.assertEquals(true, UsersManager.checkPassword(2, "afa"));
		Assert.assertEquals(false, UsersManager.checkPassword(2, "afa2"));
		Assert.assertEquals(false, UsersManager.checkPassword(2, "ibaven"));
		Assert.assertEquals(true, UsersManager.checkPassword(1, "ibaven"));
	}

	//@Test
	public void updateUser(){
		Assert.assertTrue(UsersManager.updateUser(2, "a00993882@itesm.mx", "36051150",
				"5554534335", "av club de golf 8", "7", "greenhouse", "huixquilucan", 
				"itnerlomas", "de mexico", "afa2", "afa"));
	}
	
	//@Test
	public void getAtt(){
		System.out.println(UsersManager.getAttribute("delegacion", 2));
	}
	
	//@Test
	public void getUsers(){
		Object o[][] = UsersManager.getUsers();
		for(int i = 0; i < o.length; i++){
			for(int j = 0; j < o[0].length; j++){
				System.out.print(o[i][j] + " ");
			}
			System.out.println();
		}
	}
	
}
