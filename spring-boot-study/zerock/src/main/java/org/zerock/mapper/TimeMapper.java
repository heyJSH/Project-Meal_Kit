package org.zerock.mapper;

import org.apache.ibatis.annotations.Select;

public interface TimeMapper {
    //@Select("SELECT sysdate FROM dual")
    @Select("""
            SELECT sysdate FROM dual
            """)
    public String getTime();

    public String getTime2();

    public String getTestCode();

    String getBoFreeNum();

    @Select("""
        SELECT
            NAME
        FROM
            BO_FREE
        ORDER BY NUM DESC fetch first 1 rows only            
            """)
    String getBoFreeNum2();
}

