package com.service.inner;

import com.page.PageInfo;
import com.vo.Categorys;
import com.vo.Products;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;

public interface CategoryService {

    List<Categorys> getLevelCategory(Integer cparent);

    List<Categorys> selectLevelByGroup(ArrayList arr);

    List<Categorys> selectByName(String searchCondition);

    Categorys selectById(Integer cid);

    int getPageQueryByCount(Categorys c);

    List<Categorys> getPageQuery(PageInfo pageInfo, Categorys c);

    void addCategory(Categorys c);

    void deleteById(Categorys c);

    void updateCategory(Categorys c);
}
