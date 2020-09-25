package com.lizhou.service;

import com.lizhou.bean.Course;
import com.lizhou.bean.HealthRe;
import com.lizhou.dao.impl.BaseDaoImpl;
import com.lizhou.dao.inter.BaseDaoInter;
import com.lizhou.tools.StringTool;
import net.sf.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class HealthService {
    BaseDaoInter dao = new BaseDaoImpl();

    /**
     * 获取所有健康情况（或者今天的健康打卡状态）
     * @return
     */
    public String getHealthList(String date){
        List<Object> list;
        if(StringTool.isEmpty(date)){
            list = dao.getList(HealthRe.class, "SELECT * FROM health");
        } else{
            list = dao.getList(Course.class,
                    "SELECT * FROM health WHERE date=?",
                    new Object[]{date});
        }
        //json化
        String result = JSONArray.fromObject(list).toString();
        System.out.println(result);
        return result;
    }

    /**
     * 今日打卡
     * @param hr
     */
    public void addHealth(HealthRe hr) {
        dao.insert("INSERT INTO health(id,date,location,state) value(?)", new Object[]{hr.getId(),hr.getDate(),hr.getLocation(),hr.getState()});
    }


}
