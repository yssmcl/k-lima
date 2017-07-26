
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.AlunoManager;
import unioeste.geral.manager.CursoManager;

public class Main {

	public static void main(String[] args) {
		Multimap<String, Object> condicaoAND = HashMultimap.create();
		Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", "Ciência da Computação").get(0);
		condicaoAND.put("curso", curso);

		Multimap<String, Object> condicaoOR = HashMultimap.create();
		condicaoOR.put("situacaoAtual", "Cancelado Por Abandono");
		condicaoOR.put("situacaoAtual", "Cancelado");
		condicaoOR.put("situacaoAtual", "Transferido");
		Long qtdAlunos = new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
		System.out.println("=========================== " + qtdAlunos);

		/* Teste de conexão */
//		try {
//			Connection connection;
//			Class.forName("org.mariadb.jdbc.Driver");
//			connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
//			System.out.println(connection.isValid(0));
//		} catch (ClassNotFoundException | SQLException ex) {
//			Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
//		}
	}

}
