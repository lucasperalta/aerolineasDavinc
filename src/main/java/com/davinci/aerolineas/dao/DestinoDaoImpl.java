package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Usuario;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("destinoDAO")
public class DestinoDaoImpl extends AbstractDao<Integer, Destinos> implements DestinoDao {


    public void saveDestino(Destinos destinos) {
                 persist(destinos);
    }
}
