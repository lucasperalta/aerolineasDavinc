package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.VueloDao;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Vuelo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("vueloService")
@Transactional
public class VueloServiceImpl implements VueloService {

	@Autowired
	private VueloDao dao;


	public void saveVuelo(Vuelo vuelo) {

		dao.saveVuelo(vuelo);
	}

	public List<Vuelo> getAll() {
		return dao.getAll();
	}

	public Vuelo getById(int idVuelo) {
		return dao.getById(idVuelo);
	}

	public void updateVuelo(Vuelo vuelo) {
			Vuelo entity = dao.getById(vuelo.getIdVuelo());
			if(entity!=null){
				entity.setCostoVuelo(vuelo.getCostoVuelo());
				entity.setRuta(vuelo.getRuta());
				entity.setAvion(vuelo.getAvion());
                entity.setVueloHabilitado(vuelo.getVueloHabilitado());


            }

	}

    public void deleteVueloById(int idVuelo) {
     dao.deleteVueloById(idVuelo);
    }

    public List<Vuelo> getVuelosHabilitados() {
        return dao.getVuelosHabilitados();
    }

    @Override
    public List getByAvion(Aviones avion) {
        return dao.getByAvion( avion);
    }
}
