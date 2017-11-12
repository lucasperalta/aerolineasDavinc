package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Destinos;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("avionesDao")
public class AvionesDaoImpl extends AbstractDao<Integer, Aviones> implements AvionesDao {


    public void saveAviones(Aviones aviones) {

            persist(aviones);

    }

    public List<Aviones> getAll() {
        return createEntityCriteria().list();
    }

    public Aviones getById(int avionId) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("idAvion", avionId));
        return (Aviones) criteria.uniqueResult();
    }
}
