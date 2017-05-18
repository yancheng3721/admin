package com.concentrate.search.admin.dao.system;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.concentrate.search.admin.base.AbstractedBaseDAO;

@Repository
public class ModuleRoleMappingDAO extends AbstractedBaseDAO{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public String getTBName(){
    	return "T_MODULE_ROLE_MAPPING";	
    }
    
    public String getQuerySql(){
    	return "SELECT A.MODULE_ID,B.NAME AS MODULE_NAME,A.ROLE_ID,C.NAME AS ROLE_NAME FROM T_MODULE_ROLE_MAPPING AS A LEFT JOIN T_MODULE AS B ON A.MODULE_ID = B.ID LEFT JOIN T_ROLE AS C ON C.ID = A.ROLE_ID;";	
    }
	
	public JdbcTemplate getJdbcTemplate(){
		return 	jdbcTemplate;
	}
    
    public String[] getUniqKeys(){
    	return "MODULE_ID,ROLE_ID".split(",");
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
