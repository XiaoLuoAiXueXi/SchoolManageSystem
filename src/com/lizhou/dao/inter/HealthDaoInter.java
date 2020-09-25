package com.lizhou.dao.inter;

import com.lizhou.bean.Exam;
import com.lizhou.bean.HealthRe;

import java.util.List;

public interface HealthDaoInter extends BaseDaoInter {
    public List<HealthRe> getHealList(String sql, List<Object> param);
}
