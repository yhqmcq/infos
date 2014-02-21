package com.infos.test;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.infos.junit.BaseJunitCase;
import com.infox.sysmgr.service.FileManagerServiceI;

public class TestFileManagerService extends BaseJunitCase {
	
	@Autowired
	private FileManagerServiceI fms;
	
	@Test
	public void testTreeListFile() throws Exception {
		
	}

	
}
