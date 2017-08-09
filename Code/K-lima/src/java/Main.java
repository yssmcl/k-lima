
import com.google.common.collect.HashMultimap;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import unioeste.geral.bo.Disciplina;
import unioeste.geral.bo.Formulario;
import unioeste.geral.manager.DisciplinaManager;
import unioeste.geral.manager.FormularioManager;

public class Main {

	public static void testeConexao() {
		try {
			Connection connection;
			Class.forName("org.mariadb.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
			System.out.println(connection.isValid(0));
		} catch (ClassNotFoundException | SQLException ex) {
			ex.printStackTrace();
		}
	}

	public static void testeCadastroFormulario() {
		HashMultimap<String, Object> condicao = HashMultimap.create();
		condicao.put("codigo", "FOZ1753");
		Disciplina disciplina = new DisciplinaManager().recuperarDisciplinas(condicao, null).get(0);
		Formulario formulario = new Formulario();
		formulario.setAno(2008);
		formulario.setNumeroAprovacoes(16);
		formulario.setNumeroReprovacoes(2);
		formulario.setDisciplina(disciplina);
		new FormularioManager().salvarFormulario(formulario);

		condicao.clear();
		condicao.put("codigo", "FOZ1754");
		disciplina = new DisciplinaManager().recuperarDisciplinas(condicao, null).get(0);
		formulario = new Formulario();
		formulario.setAno(2010);
		formulario.setNumeroAprovacoes(18);
		formulario.setNumeroReprovacoes(9);
		formulario.setDisciplina(disciplina);
		new FormularioManager().salvarFormulario(formulario);

		condicao.clear();
		condicao.put("codigo", "FOZ1755");
		disciplina = new DisciplinaManager().recuperarDisciplinas(condicao, null).get(0);
		formulario = new Formulario();
		formulario.setAno(2012);
		formulario.setNumeroAprovacoes(20);
		formulario.setNumeroReprovacoes(10);
		formulario.setDisciplina(disciplina);
		new FormularioManager().salvarFormulario(formulario);
	}

	public static void testeBuscaFormulario() {
//		HashMultimap<String, Object> condicao = HashMultimap.create();
//		condicao.put("codigo", "FOZ1755");
//		Disciplina disciplina = new DisciplinaManager().recuperarDisciplinas(condicao, null).get(0);
//
//		condicao.clear();
//		condicao.put("disciplina", disciplina);
//		List<Formulario> lista = new FormularioManager().recuperarFormularios(condicao, null);
//		System.out.println(lista.size());

		HashMultimap<String, Object> condicaoSerie = HashMultimap.create();
		condicaoSerie.put("serie", 1);
		List<Disciplina> disciplinas = new DisciplinaManager().recuperarDisciplinas(condicaoSerie, null);

		for (Disciplina disciplina : disciplinas) {

			for (int ano = 2008; ano < 2014; ano++) {
				HashMultimap<String, Object> condicaoNota = HashMultimap.create();
				condicaoNota.put("ano", ano);
				condicaoNota.put("disciplina", disciplina);
				List<Formulario> formularios = new FormularioManager().recuperarFormularios(condicaoNota, null);
				if (!formularios.isEmpty()) {
					System.out.println("============ " + disciplina.getNome());
					System.out.println("============ " + ano + "\t" + formularios.get(0).getNumeroAprovacoes());
				}

			}
		}
	}

	public static void testeGeral() {
//		HashMultimap<String, Object> condicaoAND = HashMultimap.create();
//		Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", "Ciência da Computação").get(0);
//		condicaoAND.put("curso", curso);
//
//		HashMultimap<String, Object> condicaoOR = HashMultimap.create();
//		condicaoOR.put("situacaoAtual", "Cancelado Por Abandono");
//		condicaoOR.put("situacaoAtual", "Cancelado");
//		condicaoOR.put("situacaoAtual", "Transferido");
//		Long qtdAlunos = new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
//		System.out.println("=========================== " + qtdAlunos);

//		condicao.clear();
//		condicao.put("disciplina", disciplina);
//		Formulario formulario = new FormularioManager().recuperarFormularios(condicao, null).get(0);
//		System.out.println(formulario.getAnoDisciplina().getAno());
	}

	public static void main(String[] args) {
//		Main.testeConexao();

		Main.testeCadastroFormulario();
//		Main.testeBuscaFormulario();
//		Main.testeGeral();
	}

}
