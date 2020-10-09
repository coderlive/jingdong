package service.inner;

import page.PageInfo;
import vo.Properties_select;

import java.util.List;

public interface ProperselectService {
    public int add(int pid, String pname)throws Exception;
    int getTotalRecordCount(Properties_select properties_select) throws Exception;
    public List<Properties_select> getAllByPage(PageInfo pageInfo) throws Exception;
    public List<Properties_select> getPageByQuery(Properties_select properties_select, PageInfo pageInfo) throws Exception;
    int delete(int psid) throws Exception;
    int update(Properties_select properties_select) throws Exception;
    public Properties_select getPropertiesById(String psid) throws Exception;
    public List<Properties_select> getPropertiesByPrp_id(int prp_id) throws Exception;
}
