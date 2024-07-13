package com.yc.web.filters;

import com.yc.utils.WriterJson;
import com.yc.web.servlets.model.JsonModel;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/message.action")
public class RightFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        JsonModel jm = new JsonModel();
        if (req.getParameter("op")==null){
            jm.setCode(0);
            jm.setError("未知操作");
            try {
                WriterJson.writerJson(jm,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }
        if (req.getParameter("op").equals("sendMessage") && req.getSession().getAttribute("user")==null){
            jm.setCode(0);
            jm.setError("未登录");
            try {
                WriterJson.writerJson(jm,resp);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return;
        }

        chain.doFilter(request, response);
    }
}
