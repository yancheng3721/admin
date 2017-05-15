package com.concentrate.search.admin.service.selector;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.concentrate.search.admin.base.PageCond;
import com.concentrate.search.admin.dao.selector.SelectorDAO;

@Service
public class SelectorService {

	@Autowired
	private SelectorDAO dao;
	
	public List<Map<String,Object>> query(String sql,Map<String,String> param ,PageCond page){
		return dao.query(sql, param, page);
	}
	
}
