package service.impl;

import dao.impl.DaoImpl;
import dao.impl.UserDaoImpl;
import dao.inner.UserDao;
import service.inner.UserService;
import vo.Users;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao=new UserDaoImpl();
    @Override
    public List<Users> getPageByQuery(String sql, Class<?> clazz) throws Exception {
        return dao.getPageByQuery(sql,Users.class);
    }
}
