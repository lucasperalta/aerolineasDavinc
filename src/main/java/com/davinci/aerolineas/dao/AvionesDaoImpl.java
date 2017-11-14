package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Destinos;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("avionesDao")
public class AvionesDaoImpl extends AbstractDao<Integer, Aviones> implements AvionesDao {


    public void saveAviones(Aviones aviones) {

            persist(aviones);

    }

    public List<Aviones> getAll() {

        return createEntityCriteria().setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list() ;

    }

    public Aviones getById(int avionId) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("idAvion", avionId));
        return (Aviones) criteria.uniqueResult();
    }

    public void deleteAvionById(int idAvion) {
        Query query = getSession().createSQLQuery("delete from Aviones where idAvion = :idAvion");
        query.setInteger("idAvion", idAvion);
        query.executeUpdate();
    }
}
