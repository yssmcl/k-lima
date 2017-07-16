package unioeste.geral.manager;

import java.util.List;
import unioeste.geral.bo.Centro;
import unioeste.geral.dao.CentroDAO;

public class CentroManager {
	
	public List<Centro> recuperarCentrosPorAtributo(String atributo, Object valor) {
		return new CentroDAO().buscarCentrosPorAtributo(atributo, valor);
	}

}
