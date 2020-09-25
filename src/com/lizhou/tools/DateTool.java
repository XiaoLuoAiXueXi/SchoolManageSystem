package com.lizhou.tools;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class DateTool {
    public  static String getToday(){
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DATE, 1);
        String today = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
        return today;
    }


}
