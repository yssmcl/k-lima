package unioeste.geral.aluno.manager;

import java.util.List;
import unioeste.geral.aluno.bo.Aluno;
import unioeste.geral.aluno.dao.AlunoDAO;

public class AlunoManager {

	public void salvarAluno(Aluno aluno) {
		new AlunoDAO().inserirAluno(aluno);
	}

	public List<Aluno> recuperarAlunoPorAtributo(String atributo, Object valor) {
		return new AlunoDAO().buscarAlunoPorAtributo(atributo, valor);
	}

    public List<Aluno> recuperarTodosAlunos() {
		return new AlunoDAO().buscarTodosAlunos();
	}

    public void modificarAluno(Aluno aluno) throws Exception {
		new AlunoDAO().atualizarAluno(aluno);
	}

    public void removerAluno(Aluno aluno) {
		new AlunoDAO().deletarAluno(aluno);
	}

}
