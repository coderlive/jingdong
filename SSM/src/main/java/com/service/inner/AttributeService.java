package com.service.inner;

import com.page.PageInfo;
import com.vo.Properties;

import java.util.List;

public interface AttributeService {
    int addAttribute(int cid, String pname)throws Exception;
    int getTotalRecordCount(Properties properties) throws Exception;//查商品属性总量
    List<Properties> getAllByPage(PageInfo pageInfo,Properties properties) throws Exception;//查询所有属性然后分页
    List<Properties> getPageByQuery(Properties properties, PageInfo pageInfo) throws Exception;
    int delete(int prp_id) throws Exception;
    int update(Properties properties);
    Properties getPropertiesById(String prp_id) throws Exception;
    List<Properties> getPropertiesByCid(int cid) throws Exception;

    void addAttribute(Properties p);

    void deletePropertiesById(Properties p);

    Properties selectOne(Properties p);
}
