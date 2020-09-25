package com.lizhou.servlet;

import com.lizhou.bean.HealthRe;
import com.lizhou.service.CourseService;
import com.lizhou.service.HealthService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

public class HealthServlet extends HttpServlet {
    private HealthService service = new HealthService();
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("at line18");
        String method = req.getParameter("method");
        if("assign".equals(method)){ //验证登录
            assign(req, resp);
        }else if("PersonList".equals(method))
            PersonList(req, resp);
        else if("todayHeal".equals((method)))
            TodayHealth(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("at line31");
        String method = req.getParameter("method");
        if("assign".equals(method)){ //验证登录
            assign(req, resp);
        }else if("PersonList".equals(method))
            PersonList(req, resp);
        else if("todayHeal".equals((method)))
            TodayHealth(req,resp);


    }

    private void TodayHealth(HttpServletRequest req, HttpServletResponse resp) {

    }

    protected  void assign(HttpServletRequest req, HttpServletResponse resp){
        System.out.println("into func assign");
        System.out.println(req.getParameter("userName"));
        System.out.println(req.getParameter("HealthState"));
        System.out.println(req.getParameter("tolocal"));
        System.out.println(req.getParameter("date"));

        int id= Integer.parseInt(req.getParameter("userName"));
        String state=req.getParameter("HealthState");
        String local=req.getParameter("tolocal");
        //得到的是毫秒数
        String date=req.getParameter("date");
        HealthRe he=new HealthRe();
        he.setDate(date);he.setLocation(local);he.setId(id);he.setState(state);
        service.addHealth(he);
    }
    private void PersonList(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String date=req.getParameter("name");
        String result=service.getHealthList(date);
        resp.getWriter().write(result);//这里将resp的参数传到ajax中，作为输出
        System.out.println("at this");
    }

}
