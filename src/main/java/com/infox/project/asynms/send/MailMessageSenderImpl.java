package com.infox.project.asynms.send;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.ObjectMessage;
import javax.jms.Session;

import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

public class MailMessageSenderImpl implements MailMessageSenderI {

	private JmsTemplate jmsTemplate;
	
	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}

	@Override
	public void sendMail() {
		System.out.println("发送异步消息...");
		
		//创建消息
		MessageCreator messageCreator = new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				ObjectMessage message = session.createObjectMessage();
				
				System.out.println("消息内容...");
				
				return message;
			}
		};
		
		//发送消息
		this.jmsTemplate.send(messageCreator) ;
	}

}
