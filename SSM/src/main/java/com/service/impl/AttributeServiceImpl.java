package com.service.impl;




import com.dao.ProperselectMapper;
import com.page.PageInfo;
import com.dao.AttributeMapper;
import com.service.inner.AttributeService;
import com.vo.Properties;
import com.vo.Properties_select;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;
@Service
@Transactional
public class AttributeServiceImpl implements AttributeService {
    @Autowired
    private AttributeMapper attributeMapper ;

    @Autowired
    private ProperselectMapper properselectMapper;
    @Override
    public int addAttribute(int cid, String pname) throws Exception {
        return 0;
    }

    @Override
    public int getTotalRecordCount(Properties properties) {
        String sql = "select count(*) from properties  where 1=1";
        Integer cid = properties.getCid();
        Integer prp_id = properties.getPrp_id();
        System.out.println("获取的cid为："+cid);
        if (cid !=null) {
            sql+=" and cid='";
            sql+=cid;
            sql+="'";
        }
        if (prp_id !=null) {
            sql+=" or prp_id='";
            sql+=prp_id;
            sql+="'";
        }
        return attributeMapper.getTotalRecordCount(sql);
    }

    @Override
    public List<Properties> getAllByPage(PageInfo pageInfo,Properties properties) throws Exception {
        List<Properties> list = null;

        // String sql = "select * from (select c.*,rownum r from category c where 1=1 and cid=? where r>=21 and r<=25";
        StringBuffer sb = new StringBuffer(
                "select * from (select c.*,rownum r from properties c where 1=1");
        Integer cid = properties.getCid();
        Integer prp_id = properties.getPrp_id();
        System.out.println("获取的cid为："+cid);
        if (cid !=null) {
            sb.append(" and cid='");
            sb.append(cid);
            sb.append("'");
        }
        if (prp_id !=null) {
            sb.append(" or prp_id='");
            sb.append(prp_id);
            sb.append("'");
        }
        sb.append(") where r>=");
        sb.append(pageInfo.getBegin());
        sb.append(" and r<=");
        sb.append(pageInfo.getEnd());

        String sql = sb.toString();
        System.out.println(sql);
        list = attributeMapper.getPageByQuery(sql);
        return list;
    }

    @Override
    public List<Properties> getPageByQuery(Properties properties, PageInfo pageInfo) throws Exception {
        return null;
    }

    @Override
    public int delete(int prp_id) throws Exception {
        return 0;
    }

    @Override
    public int update(Properties properties) {
        return attributeMapper.updateByPrimaryKeySelective(properties);
    }

    @Override
    public Properties getPropertiesById(String prp_id){
        return null;
    }

    @Override
    public List<Properties> getPropertiesByCid(int cid)  {
        Properties p=new Properties();
        p.setCid(cid);
        return attributeMapper.select(p);
    }

    @Override
    public void addAttribute(Properties p) {
        attributeMapper.insertSelective(p);
    }

    @Override
    public void deletePropertiesById(Properties p) {
        Example e=new Example(Properties_select.class);
        Example.Criteria c=e.createCriteria();
        c.andEqualTo("pid",p.getPrp_id());
        properselectMapper.deleteByExample(e);
        attributeMapper.deleteByPrimaryKey(p);
    }

    @Override
    public Properties selectOne(Properties p) {
        return attributeMapper.selectByPrimaryKey(p);
    }
}
