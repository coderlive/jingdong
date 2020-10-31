package com.service.impl;


import com.dao.UserMapper;
import com.page.PageInfo;
import com.service.inner.UserService;
import com.util.AlipayConfig;
import com.vo.Categorys;
import com.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper dao;

    @Override
    public List<Users> selectByUsernameAndPassword(Users u) {
        return dao.selectByUsernameAndPassword(u);
    }

    @Override
    public int getPageQueryByCount(Users users) {
        return dao.getPageQueryByCount(users);
    }

    @Override
    public List<Users> getPageQuery(PageInfo pageInfo, Users users) {
        return dao.getPageQuery(pageInfo,users);
    }

    @Override
    public int updateActive(Users u) {
        return dao.updateById(u);
    }

    @Override
    public List selectUserBySql(String sql) {
        return  dao.selectListBySql(sql);
    }

    @Override
    public void lockUser(String username) {
        Users u=new Users();
        u.setUenable(1);
        Example e=new Example(Users.class);
        Example.Criteria c=e.createCriteria();
        c.andEqualTo("username",username);
        dao.updateByExampleSelective(u,e);
    }

    @Override
    public String sendEmail(String email) {
        JavaMailServiceImpl jms=new JavaMailServiceImpl();
        String subject="京东商城注册";
        String code= String.valueOf(AlipayConfig.getNumber(6));
        String content="欢迎注册京东商城账户，您的验证码为:"+code+"，请谨慎保管好您的验证码，不要告诉其他人";
        jms.sendTextMail("1029589750@qq.com", email, subject, content);
        return code;
    }

    @Override
    public void registerUser(Users u) {
        dao.insertSelective(u);
    }


}
