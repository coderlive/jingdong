package service.impl;

import dao.impl.DaoImpl;
import dao.impl.UserDaoImpl;
import dao.inner.UserDao;
import page.PageInfo;
import service.inner.UserService;
import vo.Users;

import java.util.List;

public class UserServiceImpl implements UserService {
    private UserDao dao=new UserDaoImpl();
    @Override
    public List<Users> getPageByQuery(String sql, Class<?> clazz) throws Exception {
        return dao.getPageByQuery(sql,Users.class);
    }

    @Override
    public void add(Users u) throws Exception {
        dao.add(u);
    }

    @Override
    public int getPageQueryByCount(Users users) throws Exception {
        String sql="select count(1) from users where 1=1";
        String username=users.getUsername();
        String address = users.getAddress();
        Integer lock=users.getUenable();
        Integer active = users.getActive();
        if (username!=null&&!username.trim().equals(""))
        {
            sql+=" and username='"+username+"'";
        }
        if (address!=null&&!address.trim().equals(""))
        {
            sql+=" or address like '%"+address+"%'";
        }

        if (lock!=null)
        {
            sql+=" or uenable="+lock;
        }
        if (active!=null) {
            sql += "or active=" +active;
        }

        System.out.println(sql);
        return dao.getTotalRecordCount(sql);
    }

    @Override
    public List<Users> getPageQuery(PageInfo pageInfo, Users users) throws Exception {
        //select * from (select c.*,rownum r from users c where 1=1 and rownum<=8 ) where r>=1 ;
        String sql="select * from (select c.*,rownum r from users c where 1=1";

        sql+=" and rownum<="+pageInfo.getEnd();
//        String username=users.getUsername();
//        Integer lock=users.getUenable();
//
//        if (username!=null&&!username.trim().equals(""))
//        {
//            sql+=" and username='"+username+"'";
//        }
//        if (lock!=null)
//        {
//            sql+=" or lock="+lock;
//        }
        sql+=") where r>="+pageInfo.getBegin();
        System.out.println(sql);
        return dao.getPageByQuery(sql,Users.class);
    }

    @Override
    public int upperOrLower(Integer action, String userid) {
        return dao.updateOrLower(action,userid);
    }

    @Override
    public int updateActive(Integer action, String userid) {
        return dao.upActive(action,userid);
    }

    @Override
    public List<Users> getAllByPage(PageInfo pageInfo) throws Exception {
        List<Users> list = null;
        int perPageRecordCount = 5;

        String sql = "select * from (select c.*,rownum r from users c) where r>=" + pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
        System.out.println(sql);

        list = dao.getPageByQuery(sql, Users.class);
        return list;
    }

    @Override
    public int getTotalRecordCount() throws Exception {
        String sql = "select count(*) from users";
        return dao.getTotalRecordCount(sql);
    }
}
