package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Usuario;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("usuarioDao")
public class UsuarioDaoImpl extends AbstractDao<Integer, Usuario> implements UsuarioDao {



	public Usuario findUser(String usuario, String password) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("nombreUsuario", usuario));
		criteria.add(Restrictions.eq("password", password));

		return (Usuario) criteria.uniqueResult();
	}
}
