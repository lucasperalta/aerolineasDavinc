package com.davinci.aerolineas.service;

import com.davinci.aerolineas.dao.AvionesDao;
import com.davinci.aerolineas.dao.DestinoDao;
import com.davinci.aerolineas.dto.AvionDto;
import com.davinci.aerolineas.model.Aviones;
import com.davinci.aerolineas.model.Butacas;
import com.davinci.aerolineas.model.Destinos;
import com.davinci.aerolineas.model.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("avionesService")
@Transactional
public class AvionesServiceImpl implements AvionesService {

	@Autowired
	private AvionesDao dao;


	public void saveAviones(Aviones aviones) {

		dao.saveAviones(aviones);
	}

    public List<Aviones> getAll() {
        return dao.getAll();
    }

    public Aviones getById(int avionId) {
        return dao.getById(avionId);
    }

    public void deleteAvionById(int idAvion){
	    dao.deleteAvionById(idAvion);
    }

    public void updateAvion(AvionDto aviones) {
        Aviones entity = dao.getById(aviones.getIdAvion());
        if(entity!=null){
            entity.setMarca(aviones.getMarca());
            entity.setMatricula(aviones.getMatricula());
            entity.setModelo(aviones.getModelo());
            List<Butacas> butacas = new ArrayList<Butacas>();


            for (int i = 1; i <= aviones.getButacas(); i++) {
                Butacas butaca = new Butacas();
                butaca.setDisponibilidad("SI");
                butaca.setNumeroButaca(i);
                butaca.setAvion(entity);
                butacas.add(butaca);


            }
            entity.getButacas().clear();
            entity.getButacas().addAll(butacas);

        }
    }

}
