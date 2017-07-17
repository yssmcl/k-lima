
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Campus;
import unioeste.geral.bo.Centro;
import unioeste.geral.bo.Curso;
import unioeste.geral.dao.AlunoDAO;
import unioeste.geral.dao.CampusDAO;
import unioeste.geral.dao.CentroDAO;
import unioeste.geral.dao.CursoDAO;

public class Main {

    public static void main(String[] args) {
//		AlunoManager alunoManager = new AlunoManager();
	
//		for (int i = 0; i < 50; i++) {
//			Aluno aluno = new Aluno();
//			aluno.setNome("asd");
//			aluno.setCentro("CECE");
//			alunoManager.salvarAluno(aluno);
//		}

//		alunoManager.removerTodosAlunos();
//		
//		HashMap<String, Object> condicao = new HashMap<>();
//		condicao.put("nome", "asd");
//		condicao.put("centro", "CECE");
//		
//		List<Aluno> alunos = alunoManager.recuperarAlunosPorAtributos(condicao);
//		System.out.println(alunos.size());
//		
//		long qtdAlunos = alunoManager.recuperarQtdAlunosPorAtributos(condicao);
//		System.out.println(qtdAlunos);
		
//		long qtd = alunoDAO.buscarQtdAlunosPorAtributo("nome", "asd");
//		System.out.println(qtd);
		
//		alunoDAO.deletarTabelaAluno();
		
		Campus campus = new Campus("campus1");
		Centro centro = new Centro("centro1");
		Curso curso = new Curso("curso1");
		Aluno aluno = new Aluno("aluno1");
//		Aluno aluno2 = new Aluno("aluno2");
//		Aluno aluno3 = new Aluno("aluno3");
		new CampusDAO().inserirCampus(campus);
		new CentroDAO().inserirCentro(centro);
		new CursoDAO().inserirCurso(curso);
		new AlunoDAO().inserirAluno(aluno);
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
