package dao.inner;


import vo.Properties_select;

public interface ProperselectDao extends Dao<Properties_select>{
    int add(Integer pid, String pvalues);
}
