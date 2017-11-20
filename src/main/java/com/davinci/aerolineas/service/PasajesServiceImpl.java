package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.PasajeDao;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Butacas;
import com.davinci.aerolineas.model.Pasaje;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service("pasajesService")
@Transactional
public class PasajesServiceImpl implements PasajesService {

	@Autowired
	private PasajeDao dao;

    @Autowired
    private AvionesDao avionDao;

    public void savePasaje(Pasaje pasaje) {
        Aviones avion=avionDao.getById(pasaje.getVuelo().getAvion().getIdAvion());
      List<Butacas> butacas=avion.getButacas();
        for (Butacas butaca: butacas) {
            if(butaca.getNumeroButaca()==pasaje.getButaca()){
                butaca.setDisponibilidad("NO");
            }

        }

        dao.savePasaje(pasaje);
    }
}
