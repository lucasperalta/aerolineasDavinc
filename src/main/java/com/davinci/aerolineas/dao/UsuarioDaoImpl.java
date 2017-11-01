package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Employee;
import com.davinci.aerolineas.model.Usuario;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("usuarioDao")
public class UsuarioDaoImpl extends AbstractDao<Integer, Usuario> implements UsuarioDao {



	public Usuario findUser(String usuario, String password) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("usuario", usuario));
		criteria.add(Restrictions.eq("password", password));

		return (Usuario) criteria.uniqueResult();
	}
}
