package com.infox.common.web.springmvc;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

@Component
public class ServletContextRealPathResolver implements RealPathResolver,
		ServletContextAware {
	public String get(String path) {
		String realpath=context.getRealPath(path);
		//tomcat8.0获取不到真实路径，通过/获取路径
		if(realpath==null){
			realpath=context.getRealPath("/")+path;
		}
		return realpath;
	}
	
	public String getContextPath() {
		return context.getContextPath() ;
	}
	
	public String getParentDir() {
		return new File(context.getRealPath("/").toString()).getParent() ;
	}

	public void setServletContext(ServletContext servletContext) {
		this.context = servletContext;
	}

	private ServletContext context;
}
