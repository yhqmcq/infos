package com.infox.common.mail;

import java.io.IOException;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 说明：单例模式，加载配置信息
 * <br/>作者：杨浩泉
 * <br/>日期：2009-10-1
 */
public class MailConfiguraton {
	private static final Logger logger = Logger.getLogger(MailConfiguraton.class);
	private static Properties pros ;
	
	private String mailSMTPHost ;	/** 缺省的主机名称 */
	
	private String mailSMTPPort ;	/** 缺省的SMTP端口号 */
	
	private String mailPOP3Host ;	/** 缺省的主机名称 */
	
	private String mailPOP3Port ;	/** 缺省的POP3端口号 */
	
	private String mailPOP3Protocol ;	/** 邮箱连接协议 */
	
	private String mailAuth ;			/** 是否需要验证 */
	
	private String mailAliasName ;		/** 是否需要验证 */
	
	private String mailFromAdmin ;	/** 缺省为管理员发送人地址 */
	
	private String userNameAdmin ;	/** 缺省为管理员发送人的邮箱账号 */
	
	private String passWordAdmin ;	/** 缺省为管理员发送人的邮箱密码 */
	
	private static MailConfiguraton intance = null ; /** 加载属性文件中的SMTP信息 */
	
	static{
		pros = System.getProperties() ;
		try {
			pros.load(MailUtil.class.getClassLoader().getResourceAsStream("resources/mail.properties")) ;
		} catch (IOException e) {
			logger.info("加载mail.properites文件出错");
			e.printStackTrace();
		}
	} 
	
	public static MailConfiguraton getInstance() {
		if(null == intance) {
			intance = new MailConfiguraton() ;
			return intance ;
		} else {
			return intance ;
		}
	}
	
	private MailConfiguraton() {
		this.setMailSMTPHost(pros.getProperty("mail.smtp.host")) ;
		this.setMailSMTPPort(pros.getProperty("mail.smtp.port")) ;
		this.setMailPOP3Host( pros.getProperty("mail.pop3.host")) ;
		this.setMailPOP3Port(pros.getProperty("mail.pop3.port")) ;
		this.setMailPOP3Protocol(pros.getProperty("mail.pop3.protocol")) ;
		this.setMailAuth(pros.getProperty("mail.smtp.auth")) ;
		this.setMailAliasName(pros.getProperty("mail.aliasname")) ;
		this.setMailFromAdmin( pros.getProperty("mail.from")) ;
		this.setUserNameAdmin(pros.getProperty("mail.username")) ;
		this.setPassWordAdmin(pros.getProperty("mail.password")) ;
	}

	public String getMailSMTPHost() {
		return mailSMTPHost;
	}

	public void setMailSMTPHost(String mailSMTPHost) {
		this.mailSMTPHost = mailSMTPHost;
	}

	public String getMailSMTPPort() {
		return mailSMTPPort;
	}

	public String getMailAliasName() {
		return mailAliasName;
	}

	public void setMailAliasName(String mailAliasName) {
		this.mailAliasName = mailAliasName;
	}

	public void setMailSMTPPort(String mailSMTPPort) {
		this.mailSMTPPort = mailSMTPPort;
	}

	public String getMailPOP3Host() {
		return mailPOP3Host;
	}

	public void setMailPOP3Host(String mailPOP3Host) {
		this.mailPOP3Host = mailPOP3Host;
	}

	public String getMailPOP3Port() {
		return mailPOP3Port;
	}

	public void setMailPOP3Port(String mailPOP3Port) {
		this.mailPOP3Port = mailPOP3Port;
	}

	public String getMailPOP3Protocol() {
		return mailPOP3Protocol;
	}

	public void setMailPOP3Protocol(String mailPOP3Protocol) {
		this.mailPOP3Protocol = mailPOP3Protocol;
	}

	public String getMailAuth() {
		return mailAuth;
	}

	public void setMailAuth(String mailAuth) {
		this.mailAuth = mailAuth;
	}

	public String getMailFromAdmin() {
		return mailFromAdmin;
	}

	public void setMailFromAdmin(String mailFromAdmin) {
		this.mailFromAdmin = mailFromAdmin;
	}

	public String getUserNameAdmin() {
		return userNameAdmin;
	}

	public void setUserNameAdmin(String userNameAdmin) {
		this.userNameAdmin = userNameAdmin;
	}

	public String getPassWordAdmin() {
		return passWordAdmin;
	}

	public void setPassWordAdmin(String passWordAdmin) {
		this.passWordAdmin = passWordAdmin;
	}

}
