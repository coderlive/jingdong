package service.impl;

import dao.impl.ProperselectDaoImpl;
import dao.inner.ProperselectDao;
import page.PageInfo;
import service.inner.ProperselectService;
import vo.Properties_select;

import java.util.List;

public class ProperselectServiceImpl implements ProperselectService {
    private ProperselectDao pd = new ProperselectDaoImpl();
    @Override
    public int add(int pid, String pvalues) throws Exception {
        return pd.add(pid,pvalues);
    }

    @Override
    public int getTotalRecordCount(Properties_select properties_select) throws Exception {
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
    public List<Properties_select> getAllByPage(PageInfo pageInfo) throws Exception {
        List<Properties_select> list = null;
        int perPageRecordCount = 5;

        String sql = "select * from (select c.*,rownum r from properties_select c) where r>=" + pageInfo.getBegin() + " and r<=" + pageInfo.getEnd();
        System.out.println(sql);

        list = pd.getPageByQuery(sql,Properties_select.class);
        return list;
    }
    public List<Properties_select> getPageByQuery(Properties_select properties_select, PageInfo pageInfo) throws Exception{
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
        list = pd.getPageByQuery(sql,Properties_select.class);
        return list;
    }

    @Override
    public int delete(int psid) throws Exception {
        Properties_select properties_select = new Properties_select();
        properties_select.setPsid(psid);
        return pd.delete(properties_select);
    }

    @Override
    public int update(Properties_select properties_select) throws Exception {
        return pd.update(properties_select);
    }

    @Override
    public Properties_select getPropertiesById(String psid) throws Exception {
        return pd.getOneById(Integer.parseInt(psid),Properties_select.class);
    }
    public List<Properties_select> getPropertiesByPrp_id(int prp_id) throws Exception{
        String sql = "select * from properties_select where pid = "+prp_id;
        return pd.getPageByQuery(sql,Properties_select.class);
    }
}
