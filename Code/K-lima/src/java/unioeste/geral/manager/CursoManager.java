package unioeste.geral.manager;

import java.util.HashMap;
import java.util.List;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Curso;
import unioeste.geral.dao.AlunoDAO;
import unioeste.geral.dao.CentroDAO;
import unioeste.geral.dao.CursoDAO;

public class CursoManager {
	
	public List<Curso> recuperarCursosPorAtributo(String atributo, Object valor) {
		return new CursoDAO().buscarCursosPorAtributo(atributo, valor);
	}

}
