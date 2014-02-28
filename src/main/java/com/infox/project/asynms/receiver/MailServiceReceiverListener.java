package com.infox.project.asynms.receiver;

import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

/**
 * 邮件发送
 * 异步消息服务监听
 * 类描述： 
 * 创建者： 杨浩泉
 * 项目名称： infos
 * 创建时间： 2014-2-28 下午10:54:03
 * 版本号： v1.0
 */
public class MailServiceReceiverListener implements MessageListener {

	@Override
	public void onMessage(Message message) {
		if (message instanceof ObjectMessage) {
			ObjectMessage msg = (ObjectMessage) message;
			
			System.out.println("发送邮件..." + msg);
			
		}
	}

}
