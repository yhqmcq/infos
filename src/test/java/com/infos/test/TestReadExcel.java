package com.infos.test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.infox.common.util.PoiUtil;


public class TestReadExcel {
	
	public static void main(String[] args) {
		try {
			File file = new File("c:/公司人员信息.xlsx") ;
			Workbook book = null;
	        try {
	            book = new XSSFWorkbook(new FileInputStream(file));
	        } catch (Exception ex) {
	            book = new HSSFWorkbook(new FileInputStream(file));
	        }
	        
	        if(null != book) {
	        	Sheet sheet = book.getSheetAt(0) ;
	        	int lastRowNum = sheet.getLastRowNum() ;
	        	if(lastRowNum > 0) {
	        		
	        		for(int i=3; i<lastRowNum; i++) {
	        			Cell id = sheet.getRow(i).getCell(1) ;
	        			Cell name = sheet.getRow(i).getCell(2) ;
	        			Cell sex = sheet.getRow(i).getCell(3) ;
	        			Cell dept = sheet.getRow(i).getCell(4) ;
	        			Cell jp = sheet.getRow(i).getCell(5) ;
	        			Cell bysj = sheet.getRow(i).getCell(6) ;
	        			Cell rzsj = sheet.getRow(i).getCell(7) ;
	        			Cell postion = sheet.getRow(i).getCell(8) ;
	        			
	        			System.out.println(i+"=="+PoiUtil.getCellValue(id)+"=="+PoiUtil.getCellValue(name)+"=="+PoiUtil.getCellValue(sex)+"=="+PoiUtil.getCellValue(dept)+"=="+PoiUtil.getCellValue(jp)+"=="+PoiUtil.getCellValue(bysj)+"=="+PoiUtil.getCellValue(rzsj)+"=="+PoiUtil.getCellValue(postion));
	        			
	        		}
	        		
	        	}
	        }
		} catch (org.apache.poi.poifs.filesystem.OfficeXmlFileException e) {
			System.out.println("发生错误，程序无法处理 Office 2003之后的文档，请将xlsx文件转换为xls！");
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
}
