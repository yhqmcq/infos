package com.infos.test;

import java.sql.SQLException;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.infos.junit.BaseJunitCase;
import com.infox.sysmgr.service.BaseDataBackServiceI;

public class TestDB extends BaseJunitCase {
	
	@Autowired
	private BaseDataBackServiceI j ;
	
	@Test
	public void testDB() throws SQLException {
		
		
		/*List<Map<String, String>> listDataBases = j.listDataBases() ;
		for (Map<String, String> map : listDataBases) {
			System.out.println(map);
		}*/

		
		/*List<BaseField> listFields = j.listFields("infox_sysmgr_emp") ;
		for (BaseField baseField : listFields) {
			System.out.println(baseField);
		}*/
		
		/*List<Object[]> createTableData = j.createTableData("infox_sysmgr_emp") ;
		for (Object[] objects : createTableData) {
			System.out.println(objects[0].toString());
		}*/
		
		/*List<Map<String, String>> listTables = j.listTables("infos");
		for (Map<String, String> map : listTables) {
			System.out.println(map);
		}*/
		
	}
	
	
	
}
