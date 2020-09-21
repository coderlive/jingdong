package service.impl;

import dao.impl.CateDaoImpl;
import dao.inner.CategoryDao;
import page.PageInfo;
import service.inner.CategoryService;
import vo.Categorys;

import java.util.List;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao cd=new  CateDaoImpl();
    @Override
    public int addCategory(Categorys c) throws Exception {
        return cd.add(c);
    }
    @Override
    public Categorys selectById(int id) throws Exception {
        return cd.getOneById(id, Categorys.class);
    }

    @Override
    public List<Categorys> selectAll(String sql) throws Exception {
        return cd.getPageByQuery(sql,Categorys.class);
    }

    @Override
    public int delete(Categorys c) throws Exception {
        return cd.delete(c);
    }

    @Override
    public int updateCate(Categorys c) throws Exception {
        return cd.update(c);
    }

    @Override
    public int deleteNoId(Categorys c) throws Exception {
        return cd.deleteNoById(c);
    }

    @Override
    public int selectIsActive(String sql) throws Exception {
        return cd.getTotalRecordCount(sql);
    }

    @Override
    public int selectAllCount(String selectCount) throws Exception {
        return cd.getTotalRecordCount(selectCount);
    }

    @Override
    public int getPageQueryByCount(Categorys c) throws Exception {
        String sql="select count(1) from categorys where 1=1";
        String cname=c.getCname();
        String cdesc=c.getCdesc();
        if (cname!=null&&!cname.trim().equals(""))
        {
            sql+=" and cname='"+cname+"'";
        }
        if (cdesc!=null&&!cdesc.trim().equals(""))
        {
            sql+=" or cdesc like '%"+cdesc+"%'";
        }
//        System.out.println(sql);
        return cd.getTotalRecordCount(sql);
    }

    @Override
    public List<Categorys> getPageQuery(PageInfo pageInfo, Categorys c) throws Exception {
        String sql="select * from (select c.*,rownum r from categorys c where 1=1";
        String cname=c.getCname();
        String cdesc=c.getCdesc();
        if (cname!=null&&!cname.trim().equals(""))
        {
            sql+=" and cname='"+cname+"'";
        }
        if (cdesc!=null&&!cdesc.trim().equals(""))
        {
            sql+=" or cdesc like '%"+cdesc+"%'";
        }
        sql+=") where r>="+pageInfo.getBegin()+" and r<="+pageInfo.getEnd();
        return cd.getPageByQuery(sql,Categorys.class);
    }


}
