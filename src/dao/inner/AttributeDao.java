package dao.inner;

import vo.Properties;

public interface AttributeDao extends Dao<Properties> {
    int addAttributes(Integer cid, String pname);
}
