package com.yc.web.servlets;

import com.yc.bean.User;
import com.yc.utils.EncryptUtils;
import com.yc.web.servlets.model.JsonModel;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@WebServlet("/user.action")
public class UserServlet extends BaseServlet{

    /**
     * 获取登录状态
     * @param req
     * @param resp
     */
    protected void getLoginStatus(HttpServletRequest req,HttpServletResponse resp) throws Exception {
        JsonModel jm = new JsonModel();
        User user = (User) req.getSession().getAttribute("user");
        if (user == null){
            //未登录
            jm.setCode(0);
            writerJson(jm,resp);
            return;
        }
        jm.setCode(1);
        jm.setObj(user);
        writerJson(jm,resp);
    }

    /**
     * 登出
     * @param req
     * @param resp
     * @throws Exception
     */
    protected void logout(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        JsonModel jm = new JsonModel();
        req.getSession().removeAttribute("user");
        jm.setCode(1);
        writerJson(jm,resp);
    }

    /**
     * 登录
     * @param req
     * @param resp
     * @throws Exception
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        JsonModel jm = new JsonModel();
        String uname = req.getParameter("uname");
        String upwd = req.getParameter("upwd");
        String code = req.getParameter("code");
        upwd = EncryptUtils.encryptToMD5(EncryptUtils.encryptToMD5(upwd));
        HttpSession session = req.getSession();

        //先看验证码
        if (!code.equals(session.getAttribute("code"))){
            jm.setCode(0);
            jm.setError("验证码错误");
            writerJson(jm,resp);
            return;
        }

        String sql = "select * from testuser where uname=?";
        List<User> select = db.select(User.class, sql, uname);
        if (select == null || select.size()<=0){
            jm.setCode(0);
            jm.setError("用户不存在，请注册");
            writerJson(jm,resp);
            return;
        }

        User user = select.get(0);
        //验证密码
        if (!upwd.equals(user.getUpwd())){
            jm.setCode(0);
            jm.setError("密码错误");
            writerJson(jm,resp);
            return;
        }

        //都对了就返回成功状态，并把用户信息存入session，方便记录状态
        session.setAttribute("user",user);

        jm.setCode(1);
        jm.setObj(user);
        writerJson(jm,resp);
    }
    /**
     * 注册
     * @param req
     * @param resp
     * @throws Exception
     */
    protected void register(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        JsonModel jm = new JsonModel();
        String uname = req.getParameter("uname");
        String upwd = req.getParameter("upwd");
        upwd = EncryptUtils.encryptToMD5(EncryptUtils.encryptToMD5(upwd));//加密

        String code = req.getParameter("code");
        HttpSession session = req.getSession();

        //先看验证码
        if (!code.equals(session.getAttribute("code"))){
            jm.setCode(0);
            jm.setError("验证码错误");
            writerJson(jm,resp);
            return;
        }

        String sql = "select * from testuser where uname=?";
        List<User> select = db.select(User.class, sql, uname);
        if (select.size()>0){
            jm.setCode(0);
            jm.setError("用户已存在");
            writerJson(jm,resp);
            return;
        }
        sql = "insert into testuser(uname,upwd) values(?,?)";
        if (db.insert(sql, uname, upwd)){
            jm.setCode(0);
            jm.setError("注册失败");
            writerJson(jm,resp);
            return;
        }
        //sql = "select * from testuser where uname=?";
        //select = db.select(User.class, sql, uname);
        //jm.setCode(1);
        //jm.setObj(select.get(0));//用来注册后自动登录
        //writerJson(jm,resp);

        //算了，直接调登录方法吧
        login(req,resp);
    }
}
