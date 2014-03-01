package com.infox.project.asynms.send;

import com.infox.project.web.form.ProjectMainForm;

public interface MailMessageSenderI {

	public void sendMail(ProjectMainForm project) throws Exception ;
	
}
