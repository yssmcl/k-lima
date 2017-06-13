package unioeste.geral.aluno.manager;

import java.util.HashMap;
import java.util.List;
import unioeste.geral.aluno.bo.Aluno;
import unioeste.geral.aluno.dao.AlunoDAO;

public class AlunoManager {

	public void salvarAluno(Aluno aluno) {
		new AlunoDAO().inserirAluno(aluno);
	}

	/* Exemplo de uso:
		// Retorna uma lista de objetos do tipo Aluno contendo os objetos que possuem o atributo "nome" igual a "João Silva"
		// e o atributo "centro" igual a "CECE".
		// Equivalente a: SELECT * FROM Aluno WHERE nome = "João Silva" AND centro = "CECE";
		HashMap<String, Object> condicoes = new HashMap<>();
		condicoes.put("nome", "João Silva");
		condicoes.put("centro", "CECE");
		List<Aluno> alunos = recuperarAlunosPorAtributos(condicoes);
	*/
	public List<Aluno> recuperarAlunosPorAtributos(HashMap<String, Object> condicao) {
		return new AlunoDAO().buscarAlunosPorAtributos(condicao);
	}
	
	/* Exemplo de uso:
		// Retorna a quantidade de objetos do tipo Aluno que possuem o atributo "nome" igual a "João Silva" e o atributo
		// "centro" igual a "CECE".
		// Equivalente a: SELECT * FROM Aluno WHERE nome = "João Silva" AND centro = "CECE";
		HashMap<String, Object> condicoes = new HashMap<>();
		condicoes.put("nome", "João Silva");
		condicoes.put("centro", "CECE");
		long qtdAlunos = recuperarAlunosPorAtributos(condicoes);
	*/
	public Long recuperarQtdAlunosPorAtributos(HashMap<String, Object> condicao) {
		return new AlunoDAO().buscarQtdAlunosPorAtributos(condicao);
	}

    public List<Aluno> recuperarTodosAlunos() {
		return new AlunoDAO().buscarTodosAlunos();
	}

    public void modificarAluno(Aluno aluno) {
		new AlunoDAO().atualizarAluno(aluno);
	}

    public void removerAluno(Aluno aluno) {
		new AlunoDAO().deletarAluno(aluno);
	}
	
	public void removerTabelaAluno() {
		new AlunoDAO().deletarTabelaAluno();
	}

}
