
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Campus;
import unioeste.geral.bo.Centro;
import unioeste.geral.bo.Curso;
import unioeste.geral.dao.AlunoDAO;
import unioeste.geral.dao.CampusDAO;
import unioeste.geral.dao.CentroDAO;
import unioeste.geral.dao.CursoDAO;
import unioeste.geral.manager.AlunoManager;
import unioeste.geral.manager.CampusManager;
import unioeste.geral.manager.CentroManager;
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
		
		List<Aluno> alunos = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, condicaoOR);
		System.out.println("=========================== " + alunos.size());
		
//		Campus campus = new Campus("campus1");
//		Centro centro = new Centro("centro1");
//		Curso curso = new Curso("curso1");
//		Aluno aluno = new Aluno("aluno1");
//		Aluno aluno2 = new Aluno("aluno2");
//		Aluno aluno3 = new Aluno("aluno3");
//		new CampusDAO().inserirCampus(campus);
//		new CentroDAO().inserirCentro(centro);
//		new CursoDAO().inserirCurso(curso);
//		new AlunoDAO().inserirAluno(aluno);
//		new AlunoDAO().inserirAluno(aluno);
//		new AlunoDAO().inserirAluno(aluno);
//		new AlunoDAO().inserirAluno(aluno2);
//		new AlunoDAO().inserirAluno(aluno3);
//		new AlunoDAO().deletarAlunosPorAtributo("nome", "aluno1");
	
		/* teste de conexão */
        // Connection connection;
        // // Class.forName("com.mysql.jdbc.Driver");
        // Class.forName("org.mariadb.jdbc.Driver");
        // connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
        // String sql = "SELECT * FROM autenticacao";c
        // PreparedStatement statement = connection.prepareStatement(sql);
        // ResultSet resultSet = statement.executeQuery();
        // resultSet.next();
        // System.out.println(resultSet.getString("login"));
    }
	
}
