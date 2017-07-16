package unioeste.geral.manager;

import java.util.List;
import unioeste.geral.bo.Campus;
import unioeste.geral.dao.CampusDAO;

public class CampusManager {
	
	public List<Campus> recuperarCampiPorAtributo(String atributo, Object valor) {
		return new CampusDAO().buscarCampiPorAtributo(atributo, valor);
	}

}
