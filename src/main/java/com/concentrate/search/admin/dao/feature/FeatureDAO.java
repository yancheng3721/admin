package com.concentrate.search.admin.dao.feature;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;

import com.concentrate.search.admin.base.AbstractedBaseDAO;

@Repository
public class FeatureDAO extends AbstractedBaseDAO{
    @Autowired
    private JdbcTemplate jdbcTemplate;
    
    public String getTBName(){
    	return "EB_FEATURE";	
    }
    
    public String getQuerySql(){
    	return "SELECT A.ID,A.SHOW_NAME,A.DESCRIPTION,A.SORT,A.APP_SORT,A.FILTER,C.DEF_KEY,B.DOC_NAME AS TOPIC_NAME,A.TOPIC_CODE,A.SEO_CODE FROM EB_FEATURE AS A LEFT JOIN TF_DEFINITION_DOC AS B ON B.DOC_CODE=A.TOPIC_CODE LEFT JOIN TF_DEFINITION_DETAIL AS C ON C.ID=A.FILTER";	
    }
	
	public JdbcTemplate getJdbcTemplate(){
		return 	jdbcTemplate;
	}
    
    public String[] getUniqKeys(){
    	return "TOPIC_CODE".split(",");
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
