package com.davinci.aerolineas.dao;

import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Vuelo;
import org.hibernate.Criteria;
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

}
