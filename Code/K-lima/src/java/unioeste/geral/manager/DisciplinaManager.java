package unioeste.geral.manager;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.util.List;
import java.util.Map;
import unioeste.geral.bo.Curso;
import unioeste.geral.bo.Disciplina;
import unioeste.geral.dao.DisciplinaDAO;

public class DisciplinaManager {

	public void salvarDisciplina(Disciplina disciplina) {
		new DisciplinaDAO().inserirDisciplina(disciplina);
	}

	private Multimap<String, Object> substituirChaves(Multimap<String, Object> condicao) {
		if (condicao != null) {
			Multimap<String, Object> novaCondicao = HashMultimap.create();

			for (Map.Entry entry : condicao.entries()) {
				if (entry.getKey().equals("curso")) {
					Curso curso = (Curso) entry.getValue();
					novaCondicao.put(entry.getKey() + ".id", curso.getId());
				} else if (!entry.getKey().equals("")) {
					novaCondicao.put((String) entry.getKey(), entry.getValue());
				}
			}

			condicao.clear();
			return novaCondicao;
		}
		return null;
	}

	public List<Disciplina> recuperarDisciplinas(Multimap<String, Object> condicaoAND,
												 Multimap<String, Object> condicaoOR) {
		condicaoAND = substituirChaves(condicaoAND);
		condicaoOR = substituirChaves(condicaoOR);
		return new DisciplinaDAO().buscarDisciplinas(condicaoAND, condicaoOR);
	}

}
