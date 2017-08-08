
import com.google.common.collect.HashMultimap;
import java.util.List;
import unioeste.geral.bo.Formulario;
import unioeste.geral.manager.FormularioManager;

public class Main {

	public static void main(String[] args) {
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
//		AnoDisciplina anoDisciplina = new AnoDisciplina();
//		anoDisciplina.setAno(2003);
//		anoDisciplina.setDisciplina(disciplina);
//		Formulario formulario = new Formulario();
//		formulario.setAnoDisciplina(anoDisciplina);
//		formulario.setNumeroAprovacoes(12);
//		formulario.setNumeroReprovacoes(13);
//		new FormularioDAO().inserirFormulario(formulario);
		HashMultimap<String, Object> condicaoAND = HashMultimap.create();
		HashMultimap<String, Object> condicaoOR = HashMultimap.create();
		condicaoAND.put("numeroAprovacoes", 12);
		condicaoOR.put("numeroReprovacoes", 23);
		List<Formulario> lista = new FormularioManager().recuperarFormularios(condicaoAND, condicaoOR);
		System.out.println(lista.size());

		/* Teste de conexão */
		//		try {
		//			Connection connection;
		//			Class.forName("org.mariadb.jdbc.Driver");
		//			connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
		//			System.out.println(connection.isValid(0));
		//		} catch (ClassNotFoundException | SQLException ex) {
		//			ex.printStackTrace();
		//		}
	}

}
