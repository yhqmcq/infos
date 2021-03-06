package com.infox.project.asynms.send;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import com.infox.common.mail.MailVO;

public class MailMessageSenderImpl implements MailMessageSenderI {

	private JmsTemplate jmsTemplate;
	
	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	@Override
	public void sendMail(final MailVO mail) throws Exception {
		//创建消息
		MessageCreator messageCreator = new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				ObjectMessage message = session.createObjectMessage();
				message.setObject(mail) ;
				return message;
			}
		};
		
		try {
			//发送消息
			this.jmsTemplate.send(messageCreator) ;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
