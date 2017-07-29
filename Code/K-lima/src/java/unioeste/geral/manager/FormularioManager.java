package unioeste.geral.manager;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.util.List;
import java.util.Map;
import unioeste.geral.bo.Disciplina;
import unioeste.geral.bo.Formulario;
import unioeste.geral.dao.FormularioDAO;

public class FormularioManager {

	private Multimap<String, Object> substituirChaves(Multimap<String, Object> condicao) {
		if (condicao != null) {
			Multimap<String, Object> novaCondicao = HashMultimap.create();

			for (Map.Entry entry : condicao.entries()) {
				if (entry.getKey().equals("disciplina")) {
					Disciplina disciplina = (Disciplina) entry.getValue();
					novaCondicao.put(entry.getKey() + ".id", 1);
				} else if (!entry.getKey().equals("")) {
					novaCondicao.put((String) entry.getKey(), entry.getValue());
				}
			}

			condicao.clear();
			return novaCondicao;
		}
		return null;
	}

	public List<Formulario> recuperarFormularios(Multimap<String, Object> condicaoAND,
												 Multimap<String, Object> condicaoOR) {
		condicaoAND = substituirChaves(condicaoAND);
		condicaoOR = substituirChaves(condicaoOR);
		return new FormularioDAO().buscarFormularios(condicaoAND, condicaoOR);
	}
}
