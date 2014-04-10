package com.infos.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class TestReadExcel {
	
	private static Logger logger = Logger.getLogger(TestReadExcel.class);

	public static void main(String[] args) {
		try {
			File file = new File("c:/") ;
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(file)) ;
			HSSFSheet sheet = workbook.getSheet("竞赛人员");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
