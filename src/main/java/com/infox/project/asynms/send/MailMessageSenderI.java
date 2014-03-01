package com.infox.project.asynms.send;

import com.infox.common.mail.MailVO;

public interface MailMessageSenderI {

	public void sendMail(MailVO mail) throws Exception ;
	
}
