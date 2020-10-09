package service.inner;

import page.PageInfo;
import vo.Properties;

import java.util.List;

public interface AttributeService {
    public int addAttribute(int cid, String pname)throws Exception;
    int getTotalRecordCount(Properties properties) throws Exception;//查商品属性总量
    public List<Properties> getAllByPage(PageInfo pageInfo) throws Exception;//查询所有属性然后分页
    public List<Properties> getPageByQuery(Properties properties, PageInfo pageInfo) throws Exception;
    int delete(int prp_id) throws Exception;
    int update(Properties properties) throws Exception;
    public Properties getPropertiesById(String prp_id) throws Exception;
    List<Properties> getPropertiesByCid(int cid) throws Exception;
}
