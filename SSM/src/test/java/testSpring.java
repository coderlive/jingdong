import com.dao.CategoryMapper;
import com.vo.Categorys;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring/spring.xml")
public class testSpring {
    @Autowired
    private CategoryMapper categoryMapper;
    @Test
    public void test()
    {
        Categorys c=new Categorys();
        c.setCid(142);
//        c.setCdesc("测试111111");
//        c.setClevel(1);
        c.setCparent(141);
        System.out.println(categoryMapper.deleteByPrimaryKey(c));
    }
}
