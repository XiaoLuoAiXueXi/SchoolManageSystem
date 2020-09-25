package com.lizhou.dao.impl;

import com.lizhou.bean.Clazz;
import com.lizhou.bean.Grade;
import com.lizhou.bean.HealthRe;
import com.lizhou.bean.Student;
import com.lizhou.dao.inter.BaseDaoInter;
import com.lizhou.dao.inter.HealthDaoInter;
import com.lizhou.tools.MysqlTool;
import org.apache.commons.beanutils.BeanUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.LinkedList;
import java.util.List;

public class HealDaoImpl extends BaseDaoImpl implements HealthDaoInter {
    @Override
    public List<HealthRe> getHealList(String sql, List<Object> param) {
        List<HealthRe> list = new LinkedList<>();
        try {
            //获取数据库连接
            Connection conn = MysqlTool.getConnection();
            //预编译
            PreparedStatement ps = conn.prepareStatement(sql);
            //设置参数
            if(param != null && param.size() > 0){
                for(int i = 0;i < param.size();i++){
                    ps.setObject(i+1, param.get(i));
                }
            }
            //执行sql语句
            ResultSet rs = ps.executeQuery();
            //获取元数据
            ResultSetMetaData meta = rs.getMetaData();
            //遍历结果集
            while(rs.next()){
                //创建对象
                HealthRe he = new HealthRe();
                //遍历每个字段,将每一行赋值给每一个对象
                for(int i=1;i <= meta.getColumnCount();i++){
                    String field = meta.getColumnName(i);
                    BeanUtils.setProperty(he, field, rs.getObject(field));
                }
//                //查询班级
//                HealthRe h = (Clazz) getObject(HealthRe.class, "SELECT * FROM health WHERE id=?", new Object[]{stu.getClazzid()});
//                //查询年级
//                Grade grade = (Grade) getObject(Grade.class, "SELECT * FROM grade WHERE id=?", new Object[]{stu.getGradeid()});
//                //添加
//                stu.setClazz(clazz);
//                stu.setGrade(grade);
                //添加到集合
                list.add(he);
            }
            //关闭连接
            MysqlTool.closeConnection();
            MysqlTool.close(ps);
            MysqlTool.close(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}

