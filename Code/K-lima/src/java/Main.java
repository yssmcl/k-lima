
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import unioeste.geral.aluno.bo.Aluno;
import unioeste.geral.aluno.dao.AlunoDAO;
import unioeste.geral.aluno.manager.AlunoManager;

public class Main {

    public static void main(String[] args) {
		AlunoDAO alunoDAO = new AlunoDAO();
		
		for (int i = 0; i < 50; i++) {
			Aluno aluno = new Aluno();
			aluno.setNome("asd");
			aluno.setCentro("CECE");
			alunoDAO.inserirAluno(aluno);
		}
		
		HashMap<String, Object> condicao = new HashMap<>();
		condicao.put("nome", "asd");
		condicao.put("centro", "CECE");
		
		List<Aluno> alunos = new AlunoManager().recuperarAlunosPorAtributos(condicao);
		System.out.println(alunos.size());
		
		long qtdAlunos = new AlunoManager().recuperarQtdAlunosPorAtributos(condicao);
		System.out.println(qtdAlunos);
		
//		long qtd = alunoDAO.buscarQtdAlunosPorAtributo("nome", "asd");
//		System.out.println(qtd);
		
//		List<Aluno> alunos = alunoDAO.buscarAlunoPorAtributo("nome", "aluno1239812");
//		Aluno aluno = alunos.get(0);
//		alunoDAO.deletarAluno(aluno);
//		alunos = alunoDAO.buscarTodosAlunos();
//		for (Aluno aluno1 : alunos) {
//			System.out.println(aluno1.getNome());
//		}
		
		/* JPA */	
		// AlunoDAO alunoDAO = new AlunoDAO();
		// Aluno aluno = new Aluno("aluno" + UUID.randomUUID());
		// alunoDAO.inserirAluno(aluno);
//      Aluno aluno = alunoDAO.buscarAlunoPorPK(3L);
//         alunoDAO.deletarAluno(aluno);

        /* teste de conexão */
        // Connection connection;
        // //Class.forName("com.mysql.jdbc.Driver");
        // Class.forName("org.mariadb.jdbc.Driver");
        // connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
        // String sql = "SELECT * FROM autenticacao";c
        // PreparedStatement statement = connection.prepareStatement(sql);
        // ResultSet resultSet = statement.executeQuery();
        // resultSet.next();
        // System.out.println(resultSet.getString("login"));
    }
	
}
