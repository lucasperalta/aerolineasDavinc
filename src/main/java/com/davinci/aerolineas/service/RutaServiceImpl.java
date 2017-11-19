package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.dao.RutaDao;
import com.davinci.aerolineas.dto.RutaDto;
import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Ruta;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("rutaService")
@Transactional
public class RutaServiceImpl implements RutaService {

	@Autowired
	private RutaDao dao;

	@Autowired
	private DestinoDao destinoDao;
	public void saveRuta(Ruta ruta) {
		dao.saveRuta(ruta);
	}

	public List<Ruta> getAll() {
		return dao.getAll();
	}

	public Ruta getById(int rutaid) {
		return dao.getById(rutaid);
	}

	public void updateRuta(RutaDto rutas) {
		Ruta entity = dao.getById(rutas.getIdRuta());
		if(entity!=null){
			Destinos destinoOrigen= destinoDao.getById(rutas.getDestinoPartida());
			Destinos destinoLlegada= destinoDao.getById(rutas.getDestinoLlegada());
            entity.setDestinoPartida(destinoOrigen);
			entity.setDestinoLlegada(destinoLlegada);

		}
	}

    public void deleteRutaById(int idRuta) {
        dao.deleteRutaById( idRuta);
    }
}
