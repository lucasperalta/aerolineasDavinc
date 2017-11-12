package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Usuario;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("destinoDAO")
public class DestinoDaoImpl extends AbstractDao<Integer, Destinos> implements DestinoDao {


    public void saveDestino(Destinos destinos) {
                 persist(destinos);
    }

    public List<Destinos> getAll() {

        return createEntityCriteria().list();

    }

    public Destinos getById(int origenId) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("idDestino", origenId));
        return (Destinos) criteria.uniqueResult();
    }


}
