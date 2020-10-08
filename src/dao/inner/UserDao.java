package dao.inner;

import vo.Users;

public interface UserDao extends Dao<Users> {
    int updateOrLower(Integer action, String userid);

    int upActive(Integer action,String userid);
}
