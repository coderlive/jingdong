package service.impl;

import dao.impl.AttributeDaoImpl;
import dao.inner.AttributeDao;
import page.PageInfo;
import service.inner.AttributeService;
import vo.Properties;


import java.util.List;

public class AttributeServiceImpl implements AttributeService {
    private AttributeDao ad = new AttributeDaoImpl();
    public int addAttribute(int cid,String pname)throws Exception{
        return ad.addAttributes(cid,pname);
    }

    @Override
    public int getTotalRecordCount(Properties properties) throws Exception {
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
        return ad.getTotalRecordCount(sql);
    }
    //查所有然后分页
    public List<Properties> getAllByPage(PageInfo pageInfo) throws Exception{
        List<Properties> list = null;
        int perPageRecordCount = 5;

        String sql = "select * from (select c.*,rownum r from properties c) where r>=" + pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
        System.out.println(sql);

        list = ad.getPageByQuery(sql, Properties.class);
        return list;
    }
    public List<Properties> getPageByQuery(Properties properties, PageInfo pageInfo)
            throws Exception {

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
        list = ad.getPageByQuery(sql,Properties.class);
        return list;
    }
    public int delete(int prp_id) throws Exception {
        Properties properties = new Properties();
        properties.setPrp_id(prp_id);
        return ad.delete(properties);
    }
    public int update(Properties properties) throws Exception{
        return ad.update(properties);
    }
    public Properties getPropertiesById(String prp_id) throws Exception{
        return ad.getOneById(Integer.parseInt(prp_id),Properties.class);
    }
    public List<Properties> getPropertiesByCid(int cid) throws Exception{
        String sql = "select * from properties where cid ="+cid;
        return ad.getPageByQuery(sql,Properties.class);
    }

}
