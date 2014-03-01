package com.infox.common.freemarker;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerToHtmlUtil {
	
	private static Configuration cfg ;
	
	private FreeMarkerToHtmlUtil(){}
	
	public static Configuration getInstance() {
		if(null == cfg) {
			cfg = new Configuration() ;
		} 
		return cfg ;
	}

	/**
	 * 
	 * @param request	上下文
	 * @param mapData	输出的数据
	 * @param template	模板的位置，从项目的根中的template目录中开始找，如：ftl/test.ftl
	 * 路径如下 template/ftl/test.ftl
	 * @param exportName	输出HTML的路径及文件名称，如hello/test.html
	 * @return true/false 
	 * @throws Exception 
	 */
	public static boolean exportHtml(HttpServletRequest request, Map<String,Object> rootMap, String template, String exportPath, String exportName) throws Exception {
		boolean flag = false ;
		
		
		FileOutputStream fos = null ;
		OutputStreamWriter osw = null ;
		BufferedWriter bw = null ;
		try {
			if(null == cfg) {
				getInstance() ;
			}
			cfg.setLocale(Locale.ITALY) ;
			cfg.setEncoding(Locale.getDefault(), "UTF-8") ;
			//自定义异常 
			cfg.setTemplateExceptionHandler(new MyTemplateExceptionHandler());  
			//空值处理
			cfg.setClassicCompatible(true) ;
			//指定模板目录位置为当前项目的根，如果不指定为当前项目的根，则无法再ftl中引入其他文件
			cfg.setServletContextForTemplateLoading(request.getServletContext(), "/") ;
			
			//创建目录
			exportPath = exportPath.replace("/", File.separator) ;
			File cf = new File(exportPath) ;
			if(!cf.exists()) {
				cf.mkdirs() ;
			}
			
			//加载模板文件
			Template tmp = cfg.getTemplate(template,"UTF-8") ;
			File file = new File(exportPath + exportName) ;
			fos = new FileOutputStream(file) ;
			osw = new OutputStreamWriter(fos,"UTF-8") ;
			bw = new BufferedWriter(osw) ;
			
			rootMap.put("base_server", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()) ;
			rootMap.put("host_contextPath", request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()) ;
			//输出HTML
			tmp.process(rootMap, bw) ;
			
			flag = true ;
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			throw new Exception("无法找到模板文件，目标文件路径不正确："+e.getMessage()) ;
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} finally {
			try {
				if(null != bw) 
					bw.flush() ;
				if(null != bw) 
					osw.flush() ;
				if(null != bw) 
					fos.flush() ;
				
				if(null != bw) 
					bw.close() ;
				if(null != osw) 
					osw.close() ;
				if(null != fos) 
					fos.close() ;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return flag ;
	}
	
	public static boolean exportHtml(String rootPath, String filename, Map<String,Object> rootMap, String exportPath, String exportName) throws Exception {
		boolean flag = false ;
		
		
		FileOutputStream fos = null ;
		OutputStreamWriter osw = null ;
		BufferedWriter bw = null ;
			try {
				if(null == cfg) {
					getInstance() ;
				}
				cfg.setLocale(Locale.ITALY) ;
				cfg.setEncoding(Locale.getDefault(), "UTF-8") ;
				//自定义异常 
				cfg.setTemplateExceptionHandler(new MyTemplateExceptionHandler());  
				//空值处理
				cfg.setClassicCompatible(true) ;
				//指定模板目录位置为当前项目的根，如果不指定为当前项目的根，则无法再ftl中引入其他文件
				cfg.setDirectoryForTemplateLoading(new File(rootPath)) ;
				
				//创建目录
				exportPath = exportPath.replace("/", File.separator) ;
				File cf = new File(exportPath) ;
				if(!cf.exists()) {
					cf.mkdirs() ;
				}
				
				//加载模板文件
				Template tmp = cfg.getTemplate(filename,"UTF-8") ;
				File file = new File(exportPath + exportName) ;
				fos = new FileOutputStream(file) ;
				osw = new OutputStreamWriter(fos,"UTF-8") ;
				bw = new BufferedWriter(osw) ;
				
				//输出HTML
				tmp.process(rootMap, bw) ;
				
				flag = true ;
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				throw new Exception("无法找到模板文件，目标文件路径不正确："+e.getMessage()) ;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} catch (TemplateException e) {
				e.printStackTrace();
			} finally {
				try {
					if(null != bw) 
						bw.flush() ;
					if(null != bw) 
						osw.flush() ;
					if(null != bw) 
						fos.flush() ;
					
					if(null != bw) 
						bw.close() ;
					if(null != osw) 
						osw.close() ;
					if(null != fos) 
						fos.close() ;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		return flag ;
	}
}
