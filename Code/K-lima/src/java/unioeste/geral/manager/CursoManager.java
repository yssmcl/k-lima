package unioeste.geral.manager;

import java.util.List;
import unioeste.geral.bo.Curso;
import unioeste.geral.dao.CursoDAO;

public class CursoManager {
	
	public List<Curso> recuperarCursosPorAtributo(String atributo, Object valor) {
		return new CursoDAO().buscarCursosPorAtributo(atributo, valor);
	}

}
