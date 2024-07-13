package com.yc.web.servlets;

import com.yc.web.servlets.model.JsonModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.*;
import java.util.Date;
import java.util.LinkedList;

@WebServlet("/message.action")
public class MessageServlet extends BaseServlet{

    protected void getAllMessages(HttpServletRequest req,HttpServletResponse resp) throws Exception {
        LinkedList<String> messages = (LinkedList<String>) req.getSession().getServletContext().getAttribute("messages");
        if (messages == null){
            messages = new LinkedList<>();
        }
        JsonModel jm = new JsonModel();
        jm.setCode(1);
        jm.setObj(messages);
        writerJson(jm,resp);
    }

    protected void sendMessage(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        String message = req.getParameter("message");
        String uname = req.getParameter("uname");
        HttpSession session = req.getSession();

        LinkedList<String> linkedList = new LinkedList<>();
        if (session.getServletContext().getAttribute("messages") != null){
            linkedList = (LinkedList<String>) session.getServletContext().getAttribute("messages");
        }
        String m = new Date()+"<br/>"+uname + "说了:"+message+"<hr/>";
        linkedList.addFirst(m);
        session.getServletContext().setAttribute("messages",linkedList);
        JsonModel jm = new JsonModel();
        jm.setCode(1);
        writerJson(jm,resp);
    }
}
