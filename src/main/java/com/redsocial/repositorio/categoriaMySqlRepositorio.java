package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.categoria;

@Repository
public class categoriaMySqlRepositorio implements categoriaRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<categoria> mappercategoria = new RowMapper<categoria>() {
		@Override
		public categoria mapRow(ResultSet rs, int rowNum) throws SQLException {
			categoria obj = new categoria();
			obj.setIdcategoria(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			return obj;
		}
	};
	
	@Override
	public List<categoria> listacategoria() {
		List<categoria> lista = jdbcTemplate.query("select * from categoria", new Object[] {} ,mappercategoria);
		return lista;
	}

}
