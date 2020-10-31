package com.service.inner;


import com.page.PageInfo;
import com.vo.Properties_select;

import java.util.List;

public interface ProperselectService {

    List<Properties_select> getPropertiesByPrp_id(Integer prp_id);

    void addAttribute(Properties_select p);

    int getTotalRecordCount(Properties_select properties_select);

    List<Properties_select> getAllByPage(Properties_select properties_select, PageInfo pageInfo);

    void delete(Properties_select ps);

    Properties_select getPropertiesById(Properties_select ps);

    void update(Properties_select ps);
}
