package org.zerock.persistence;

import lombok.Setter;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.config.RootConfig;

import javax.sql.DataSource;
import java.sql.Connection;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
public class DataSourceTests {
    @Setter(onMethod_ = { @Autowired })
    private DataSource dataSource;

    @Setter(onMethod_ = { @Autowired })
    private SqlSessionFactory sqlSessionFactory;

    @Test
    public void testConnection() {
        try(Connection con = dataSource.getConnection()) {
            System.out.println(con);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    @Test
    public void testMyBatis() {
        try(SqlSession session = sqlSessionFactory.openSession(); Connection con = session.getConnection()) {
            System.out.println("session: " + session);
            System.out.println("con: " + con);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
