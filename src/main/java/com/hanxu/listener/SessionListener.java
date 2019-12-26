package com.hanxu.listener;


import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
public class SessionListener implements HttpSessionListener {
	public static Map<String, HttpSession> map = new HashMap<>();
    /**
     * Default constructor. 
     */
    public SessionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    @Override
    public void sessionCreated(HttpSessionEvent event)  {
        ServletContext servletContext = event.getSession().getServletContext();
        Map<String,String> userMap = (Map<String, String>) servletContext.getAttribute("userMap");
        if(userMap == null){
            System.out.println("userMap为空,正在创建userMap");
            userMap = new HashMap<>();
            System.out.println("userMap创建完成");
        }
        servletContext.setAttribute("userMap",userMap);
    	String id = event.getSession().getId();
        System.out.println("session创建"+id);


    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    @Override
    public void sessionDestroyed(HttpSessionEvent event)  {
        HttpSession session = event.getSession();
        Map<String,String> userMap = (Map<String, String>) session.getServletContext().getAttribute("userMap");
        Set<Map.Entry<String,String>> entries = userMap.entrySet();
        for(Map.Entry<String,String> entry:entries){
            if(entry.getValue().equals(session.getId())){
                userMap.put(entry.getKey(),"");
                System.out.println(entry.getKey()+"由于长时间为操作而退出了登录状态");
            }
        }

        session.getServletContext().setAttribute("userMap",userMap);
    	System.out.println("session被销毁"+event.getSession().getId());
    }
	
}
