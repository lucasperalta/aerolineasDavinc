package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Pasaje;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("pasajesDao")
public class PasajesDaoImpl extends AbstractDao<Integer, Pasaje> implements PasajeDao {


    public void savePasaje(Pasaje pasaje) {
        persist(pasaje);
    }
}
