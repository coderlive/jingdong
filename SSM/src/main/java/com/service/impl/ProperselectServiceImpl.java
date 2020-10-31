package com.service.impl;


import com.dao.ProperselectMapper;
import com.page.PageInfo;
import com.service.inner.ProperselectService;
import com.vo.Properties_select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class ProperselectServiceImpl implements ProperselectService {
    @Autowired
    private ProperselectMapper pd;

    @Override
    public List<Properties_select> getPropertiesByPrp_id(Integer pid) {
        Properties_select properties_select=new Properties_select();
        properties_select.setPid(pid);
        return pd.select(properties_select);
    }

    @Override
    public void addAttribute(Properties_select p) {
        pd.insertSelective(p);
    }

    @Override
    public int getTotalRecordCount(Properties_select properties_select) {
        String sql ="select count(*) from properties_select where 1=1";
        Integer pid = properties_select.getPid();
        Integer psid = properties_select.getPsid();
        System.out.println("获取的pid为："+pid);
        if (pid !=null&&pid!=0) {
            sql+=" and pid='";
            sql+=pid;
            sql+="'";
        }
        if (psid !=null&&psid!=0) {
            sql+=" or psid='";
            sql+=psid;
            sql+="'";
        }
        return pd.getTotalRecordCount(sql);
    }

    @Override
    public List<Properties_select> getAllByPage(Properties_select properties_select, PageInfo pageInfo) {
        List<Properties_select> list = null;

        // String sql = "select * from (select c.*,rownum r from Properties_select c where 1=1 and pid=? where r>=21 and r<=25";
        StringBuffer sb = new StringBuffer(
                "select * from (select c.*,rownum r from properties_select c where 1=1");

        Integer pid = properties_select.getPid();
        Integer psid = properties_select.getPsid();
        System.out.println("获取的pid为："+pid);
        if (pid !=null&&pid!=0) {
            sb.append(" and pid='");
            sb.append(pid);
            sb.append("'");
        }
        if (psid !=null&&psid!=0) {
            sb.append(" or psid='");
            sb.append(psid);
            sb.append("'");
        }
        sb.append(") where r>=");
        sb.append(pageInfo.getBegin());
        sb.append(" and r<=");
        sb.append(pageInfo.getEnd());

        String sql = sb.toString();
        System.out.println(sql);
        return list = pd.getPageByQuery(sql);
    }

    @Override
    public void delete(Properties_select ps) {
        pd.deleteByPrimaryKey(ps);
    }

    @Override
    public Properties_select getPropertiesById(Properties_select ps) {
        return pd.selectByPrimaryKey(ps);
    }

    @Override
    public void update(Properties_select ps) {
        pd.updateByPrimaryKeySelective(ps);
    }
}
