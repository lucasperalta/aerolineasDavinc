package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Vuelo;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("vueloDAO")
public class VueloDaoImpl extends AbstractDao<Integer, Vuelo> implements VueloDao {

    public void saveVuelo(Vuelo vuelo){
        persist(vuelo);
    }

    public List<Vuelo> getAll() {
        return createEntityCriteria().setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
    }

    public Vuelo getById(int idVuelo) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("idVuelo", idVuelo));
        return (Vuelo) criteria.uniqueResult();
    }

    public void deleteVueloById(int idVuelo) {
        Query query = getSession().createSQLQuery("delete from vuelos where idVuelo = :idVuelo");
        query.setInteger("idVuelo", idVuelo);
        query.executeUpdate();
    }

    public List<Vuelo> getVuelosHabilitados() {
        Criteria criteria =createEntityCriteria();
        criteria.add(Restrictions.eq("vueloHabilitado", true));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();

    }

    @Override
    public List getByAvion(Aviones avion) {
        Criteria criteria =createEntityCriteria();
        criteria.add(Restrictions.eq("avion", avion));
        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        return criteria.list();
    }


}
