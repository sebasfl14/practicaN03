package com.redsocial.repositorio;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.redsocial.entidad.categoria;
import com.redsocial.entidad.cliente;

@Repository
public class clienteMySqlRepositorio implements clienteRepositorio{

	@Autowired
    private JdbcTemplate jdbcTemplate ;
	
	RowMapper<cliente> mappercliente = new RowMapper<cliente>() {
		@Override
		public cliente mapRow(ResultSet rs, int rowNum) throws SQLException {
			cliente obj = new cliente();
			obj.setIdcliente(rs.getInt(1));
			obj.setNombre(rs.getString(2));
			obj.setApellido(rs.getString(3));
			obj.setFechaNacimiento(rs.getDate(4));
			obj.setTelefono(rs.getString(5));
			obj.setEmail(rs.getString(6));
			obj.setDireccion(rs.getString(7));
			
			categoria objDep = new categoria();
			objDep.setIdcategoria(rs.getInt(8));
			objDep.setNombre(rs.getString(9));
		
			obj.setCategoria(objDep);
			
			return obj;
		}
	};
	
	@Override
	public cliente insertaActualizacliente(cliente obj) {
		cliente salida = null;
		if (obj.getIdcliente() == 0) {
			jdbcTemplate.update("insert into cliente values(null,?,?,?,?,?,?,?)",
			new Object[] {obj.getNombre(), obj.getApellido(), obj.getFechaNacimiento(), obj.getTelefono(),obj.getEmail(),obj.getDireccion(),obj.getCategoria().getIdcategoria()});	
			List<cliente> lista = jdbcTemplate.query("select m.*,d.nombre from cliente cl inner join categoria c on cl.idcategoria = c.idcategoria order by m.idcliente desc limit 0, 1",new Object[] {} ,mappercliente);
			salida = lista.get(0);
		}else {
			jdbcTemplate.update("update cliente set nombre=?,apellido=?,fechaNacimiento=?,telefono=?,email =?,direccion =?, idcategoria = ? where idcliente=?", new Object[] {obj.getNombre(), obj.getApellido(), obj.getFechaNacimiento(), obj.getTelefono(),obj.getEmail(),obj.getDireccion(), obj.getCategoria().getIdcategoria(), obj.getIdcliente()});
			List<cliente> lista = jdbcTemplate.query("select m.*,d.nombre from cliente cl inner join categoria c on cl.idcategoria = c.idcategoria where cl.idcliente =?",new Object[] {obj.getIdcliente()} ,mappercliente);
			salida = lista.get(0);
		}
		return salida;
	}

	@Override
	public void eliminacliente(int idcliente) {
		jdbcTemplate.update("delete from cliente where idcliente = ?",new Object[] {idcliente});		
	}

	@Override
	public List<cliente> listacliente() {
		List<cliente> lista = jdbcTemplate.query("select m.*,d.nombre from cliente cl inner join categoria c on cl.idcategoria = cl.idcategoria", new Object[] {} ,mappercliente);
		return lista;
	}

	@Override
	public List<cliente> listaclientePorNombre(String nom) {
		List<cliente> lista = jdbcTemplate.query("select m.*,d.nombre from cliente cl inner join categoria c on cl.idcategoria = c.idcategoria where m.nombre like ?", new Object[] {nom} ,mappercliente);
		return lista;
	}

	@Override
	public List<cliente> listacliente(int idcategoria, String nombre) {
		List<cliente> lista = jdbcTemplate.query("select m.*,d.nombre from cliente cl inner join categoria c on cl.idcategoria = c.idcategoria where cl.idcategoria =? and cl.nombre like ? and cl.telefono>= ? ", new Object[] {idcategoria, nombre} ,mappercliente);
		return lista;
	}

}
