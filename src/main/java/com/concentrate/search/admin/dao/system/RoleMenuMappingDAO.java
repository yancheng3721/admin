package com.concentrate.search.admin.dao.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.concentrate.search.admin.base.AbstractedBaseDAO;

@Repository
public class RoleMenuMappingDAO extends AbstractedBaseDAO{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public String getTBName(){
    	return "SHE_ROLE_MENU_MAPPING";	
    }
    
    public String getQuerySql(){
    	return "SELECT A.ROLE_ID,B.NAME AS ROLE_NAME,A.MENU_ID,C.NAME AS MENU_NAME FROM SHE_ROLE_MENU_MAPPING AS A LEFT JOIN SHE_ROLE AS B ON B.ID = A.ROLE_ID LEFT JOIN SHE_MENU AS C ON C.ID = A.MENU_ID";	
    }
	
	public JdbcTemplate getJdbcTemplate(){
		return 	jdbcTemplate;
	}
    
    public String[] getUniqKeys(){
    	return "ROLE_ID,MENU_ID".split(",");
    }
	
	public List<Map<String, Object>> queryByKeyword(String keyword, String id) {
		String sql = "SELECT START_TIME,END_TIME FROM " + getTBName()
				+ " WHERE KEYWORD = ?";
		if (StringUtils.isNotEmpty(id)) {
			sql = sql + " AND ID !=" + id;
		}
		return jdbcTemplate.queryForList(sql, new Object[] { keyword });
	}
}
