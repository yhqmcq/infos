package com.infos.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class TestReadExcel {
	
	public static void main(String[] args) {
		try {
			File file = new File("c:/员工信息记录.xls") ;
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(file)) ;
			HSSFSheet sheet = workbook.getSheetAt(0) ;
			if(null != sheet) {
				
				System.out.println(sheet.getRow(0).getCell(0).toString());
				
				System.out.println(sheet.getLastRowNum());
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
