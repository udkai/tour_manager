package com.balance.test;

import ch.qos.logback.core.net.SyslogOutputStream;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Map;

/**
 * Created by liukai on 2017/9/20.
 */
public class TestDao {
    ApplicationContext ac=new ClassPathXmlApplicationContext("spring/applicationContext.xml");
    JdbcTemplate template=ac.getBean("jdbcTemplate",JdbcTemplate.class);
    @Test
    public void test(){
        String sql="select order_name from t_order_info where id=?";
        Object[]param=new Object[]{1};
        String name=(String)template.queryForObject(sql,param,String.class);
        System.out.println(name);
    }
}
