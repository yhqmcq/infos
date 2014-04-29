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


public class TestReadExcelProject {
	
	public static void main(String[] args) {
		try {
			File file = new File("c:/12.xls") ;
			Workbook book = null;
	        try {
	            book = new XSSFWorkbook(new FileInputStream(file));
	        } catch (Exception ex) {
	            book = new HSSFWorkbook(new FileInputStream(file));
	        }
	        if(null != book) {
	        	Sheet sheet = book.getSheet("数据模板") ;
	        	int lastRowNum = sheet.getLastRowNum() ;
	        	if(lastRowNum > 0) {
	        		
	        		String p_id = getCellValue(sheet.getRow(1).getCell(2)) ;
	        		String p_sd = getCellValue(sheet.getRow(2).getCell(2)) ;
	        		String p_ed = getCellValue(sheet.getRow(2).getCell(4)) ;
	        		String p_num = getCellValue(sheet.getRow(3).getCell(2)) ;
	        		String p_name = getCellValue(sheet.getRow(4).getCell(2)) ;
	        		String p_dept = getCellValue(sheet.getRow(5).getCell(2)) ;
	        		String p_pm = getCellValue(sheet.getRow(6).getCell(2)) ;
	        		
	        		System.out.println(p_id);
	        		System.out.println(p_sd);
	        		System.out.println(p_ed);
	        		System.out.println(p_num);
	        		System.out.println(p_name);
	        		System.out.println(p_dept);
	        		System.out.println(p_pm);
	        		System.out.println("---------------------");
	        		
	        		int count = 0 ;
	        		for(int i=9;i<lastRowNum;i++) {
	        			count=i ;
	        			if(null == sheet.getRow(i)) {
	        				break ;
	        			}
	        			String e_id = getCellValue(sheet.getRow(i).getCell(1)) ;
	        			System.out.println(e_id);
	        		}
	        		System.out.println("---------------------");
	        		
	        		for(int i=count+1;i<=lastRowNum;i++) {
	        			if(null == sheet.getRow(i)) {
	        				break ;
	        			}
	        			String e_id = getCellValue(sheet.getRow(i).getCell(1)) ;
	        			System.out.println(e_id);
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
	
	public static String getCellValue(Cell cell) {
		String str = null;
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BLANK:
			str = "";
			break;
		case Cell.CELL_TYPE_BOOLEAN:
			str = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_FORMULA:
			str = String.valueOf(cell.getCellFormula());
			break;
		case Cell.CELL_TYPE_NUMERIC:
			str = String.valueOf((long) cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_STRING:
			str = String.valueOf(cell.getStringCellValue());
			break;
		default:
			str = null;
			break;
		}
		return str;
	}
}
