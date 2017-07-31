
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import unioeste.geral.bo.Disciplina;
import unioeste.geral.manager.AlunoManager;
import unioeste.geral.manager.DisciplinaManager;

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
                
                HashMultimap<String, Object> condicao = HashMultimap.create();
                condicao.put("situacaoAtual", "Cancelado Por Abandono");
                condicao.put("anoSaida", 1995);
                Long qtdAbandono = new AlunoManager().recuperarQtdAlunosPorAtributos(condicao, null);
                System.out.println(qtdAbandono);
                                
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

		/* Teste de conexão */ //		try {
		//			Connection connection;
		//			Class.forName("org.mariadb.jdbc.Driver");
		//			connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
		//			System.out.println(connection.isValid(0));
		//		} catch (ClassNotFoundException | SQLException ex) {
		//			System.out.println("Deu merda");
		//		}
	}

}
