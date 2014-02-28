package com.infox.sysmgr.service.impl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.infox.common.dao.BaseDaoI;
import com.infox.common.dao.JdbcDaoSupportUtil;
import com.infox.common.util.Constants;
import com.infox.sysmgr.entity.base.BaseField;
import com.infox.sysmgr.entity.base.BaseTable;
import com.infox.sysmgr.service.BaseDataBackServiceI;

@Repository
@Transactional
public class BaseDataBackServiceImpl implements BaseDataBackServiceI {
	
	@Autowired
	private BaseDaoI<BaseTable> basedaoBDB ; 

	@Autowired
	private JdbcDaoSupportUtil jdsu;

	public JdbcTemplate getJdbcTemplate() {
		return jdsu.getJdbcTemplate();
	}

	public String createTableDDL(String tablename) {
		String sql = " show create table " + tablename;
		List<Object[]> findBySql = this.basedaoBDB.findBySql(sql) ;
		return findBySql.get(0)[1].toString();
	}

	public List<Object[]> createTableData(String tablename) {
		String sql = " select * from   " + tablename;
		List<Object[]> findBySql = this.basedaoBDB.findBySql(sql) ;
		return findBySql;
	}

	public List<BaseField> listFields(String tablename) {
		String sql = " desc  " + tablename;
		List<BaseField> fields = new ArrayList<BaseField>();
		
		List<Object[]> findBySql = this.basedaoBDB.findBySql(sql) ;
		for (Object[] o : findBySql) {
			BaseField field = new BaseField();
			field.setName(o[0].toString());
			field.setFieldType(o[1].toString());
			field.setNullable(o[2].toString());
			field.setFieldProperty(o[3].toString());
			field.setFieldDefault(o[4]!=null?o[4].toString():"");
			field.setExtra(o[5].toString());
			fields.add(field);
		}
		return fields;
	}

	public List<Map<String, String>> listTables(String catalog) {
		String sql = " SELECT TABLE_NAME,ENGINE,TABLE_ROWS,CREATE_TIME,TABLE_COLLATION FROM information_schema.TABLES WHERE TABLE_SCHEMA='" + catalog + "' ";
		List<Map<String, String>> tables = new ArrayList<Map<String, String>>();
		
		List<Object[]> findBySql = this.basedaoBDB.findBySql(sql) ;
		for (Object[] o : findBySql) {
			Map<String, String> field = new HashMap<String, String>();
			field.put("table_name", o[0].toString());
			field.put("engine", o[1].toString());
			field.put("table_rows", o[2].toString());
			field.put("create_time", o[3].toString());
			field.put("table_collation", o[4].toString());
			tables.add(field);
		}
		return tables;
	}

	public List<Map<String, String>> listDataBases() {
		String sql = " show  databases ";
		List<Map<String, String>> tables = new ArrayList<Map<String, String>>();
		
		List<String> findBySql = this.basedaoBDB.findBySqlList(sql) ;
		for (String s : findBySql) {
			Map<String, String> dbName = new HashMap<String, String>();
			dbName.put("database", s);
			tables.add(dbName);
		}
		return tables;
	}

	public String getDefaultCatalog() throws SQLException {
		return getJdbcTemplate().getDataSource().getConnection().getCatalog();
	}

	public Boolean executeSQL(String sql) {
		try {
			String[] s = sql.split(Constants.ONESQL_PREFIX);
			for (String sqls : s) {
				System.out.println(sqls);
				if (StringUtils.isNotBlank(sqls)) {
					getJdbcTemplate().execute(sqls.trim());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}