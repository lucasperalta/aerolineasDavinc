package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Ruta;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("rutaDao")
public class RutaDaoImpl extends AbstractDao<Integer, Ruta> implements RutaDao {


    public void saveRuta(Ruta ruta) {
        persist(ruta);
    }

    public List<Ruta> getAll() {
        return createEntityCriteria().list();
    }




    public Ruta getById(int rutaId) {
        Criteria criteria = createEntityCriteria();
        criteria.add(Restrictions.eq("idRuta", rutaId));
        return (Ruta) criteria.uniqueResult();
    }

}
