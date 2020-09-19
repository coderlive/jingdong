package service.inner;

import vo.Users;

import java.util.List;

public interface UserService {
    List<Users> getPageByQuery(String sql, Class<?> clazz) throws Exception;
}
