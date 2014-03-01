package com.infox.common.freemarker;

import java.io.IOException;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

/**
 * <p>Title：freemarker统一异常接口</p>
 * <p>Description：</p>
 * @Author：杨浩泉
 * @Date：2010-4-3
 */
public class MyTemplateExceptionHandler implements TemplateExceptionHandler {
	
	public void handleTemplateException(TemplateException te,     
	        Environment env, java.io.Writer out)     
	        throws TemplateException {    
	        try {    
	            out.write("[错误信息: " + te.getMessage() + "]");    
	        } catch (IOException e) {    
	            throw new TemplateException(    
	                "Failed to print error message. Cause: " + e, env);    
	        }    
	    }    
}
