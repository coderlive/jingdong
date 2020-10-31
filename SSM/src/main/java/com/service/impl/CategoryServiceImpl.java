package com.service.impl;

import com.dao.CategoryMapper;
import com.page.PageInfo;
import com.service.inner.CategoryService;
import com.vo.Categorys;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
@Service
public class  CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;


    @Override
    public List<Categorys> getLevelCategory(Integer cparent) {
        return categoryMapper.getLevelCategory(cparent);
    }

    @Override
    public List<Categorys> selectLevelByGroup(ArrayList arr) {
        return categoryMapper.selectLevelByGroup(arr);
    }

    @Override
    public List<Categorys> selectByName(String searchCondition) {
        return categoryMapper.selectByName(searchCondition);
    }

    @Override
    public Categorys selectById(Integer cid) {
        Categorys c=new Categorys();
        c.setCid(cid);
        return categoryMapper.selectByPrimaryKey(c);
    }

    @Override
    public int getPageQueryByCount(Categorys c) {
        String sql="select count(1) from categorys where 1=1";;
        String cname=c.getCname();
        String cdesc=c.getCdesc();
        int clevel=c.getClevel();
        if (clevel!=0)
        {
            sql+=" and clevel="+clevel;
        }
        if (cname!=null&&!cname.trim().equals(""))
        {
            sql+=" and cname='"+cname+"'";
        }
        if (cdesc!=null&&!cdesc.trim().equals(""))
        {
            sql+=" or cdesc like '%"+cdesc+"%'";
        }
        return categoryMapper.getPageQueryByCount(sql);
    }

    @Override
    public List<Categorys> getPageQuery(PageInfo pageInfo, Categorys c) {
        String sql="select * from (select c.*,rownum r from categorys c where 1=1";
        String cname=c.getCname();
        String cdesc=c.getCdesc();
        int clevel=c.getClevel();
        if (clevel!=0)
        {
            sql+=" and clevel="+clevel;
        }
        if (cname!=null&&!cname.trim().equals(""))
        {
            sql+=" and cname='"+cname+"'";
        }
        if (cdesc!=null&&!cdesc.trim().equals(""))
        {
            sql+=" or cdesc like '%"+cdesc+"%'";
        }
        sql+=") where r>="+pageInfo.getBegin()+" and r<="+pageInfo.getEnd();
        return categoryMapper.getPageByQuery(sql);
    }

    @Override
    public void addCategory(Categorys c) {
        categoryMapper.insertSelective(c);
    }

    @Override
    public void deleteById(Categorys c) {
        categoryMapper.deleteByPrimaryKey(c);
    }

    @Override
    public void updateCategory(Categorys c) {
        categoryMapper.updateByPrimaryKey(c);
    }
}
