package com.infox.common.freemarker;

import java.io.File;
import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerToMailTemplateUtil {

	private static Configuration cfg ;
	
	public static Configuration getInstance() {
		if(null == cfg) {
			cfg = new Configuration() ;
		} 
		return cfg ;
	}
	
	public static String MailTemplateToString(ServletContext sc,String tplPath,Map<String,Object> model) {
		try {
			getInstance() ;
			
			cfg.setLocale(Locale.SIMPLIFIED_CHINESE) ;
			cfg.setEncoding(Locale.getDefault(), "UTF-8") ;
			
			cfg.setServletContextForTemplateLoading(sc, "/") ;
			
			cfg.setObjectWrapper(new DefaultObjectWrapper()) ;
			
			Template template = cfg.getTemplate(tplPath , "UTF-8") ;
			
			return FreeMarkerTemplateUtils.processTemplateIntoString(template, model) ;
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return "" ;
	}
	
	public static String MailTemplateToString(String rootPath, String filename, Map<String,Object> model) {
		try {
			getInstance() ;
			
			cfg.setLocale(Locale.SIMPLIFIED_CHINESE) ;
			cfg.setEncoding(Locale.getDefault(), "UTF-8") ;
			
			cfg.setDirectoryForTemplateLoading(new File(rootPath)) ;
			
			cfg.setObjectWrapper(new DefaultObjectWrapper()) ;
			
			Template template = cfg.getTemplate(filename , "UTF-8") ;
			
			return FreeMarkerTemplateUtils.processTemplateIntoString(template, model) ;
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return "" ;
	}
	
	public static void main(String[] args) {
		String mailTemplateToString = MailTemplateToString("F:/server/apache-tomcat-7.0.52/webapps/infos/WEB-INF/security_views/project/ftl", "project_delay_mail.ftl", null) ;
		System.out.println(mailTemplateToString);
	}
	
}
