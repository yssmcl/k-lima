
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.CursoManager;

public class Main {

	public static void main(String[] args) {
//		Multimap<String, Object> condicaoAND = HashMultimap.create();
//		Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", "Ciência da Computação").get(0);
//		condicaoAND.put("", "");
//		condicaoAND.put("situacaoAtual", "Transferido");

//		Multimap<String, Object> condicaoOR = HashMultimap.create();
//		condicaoOR.put("situacaoAtual", "Cancelado Por Abandono");
//		condicaoOR.put("situacaoAtual", "Cancelado");
//		condicaoOR.put("situacaoAtual", "Transferido");
//		List<Aluno> alunos = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, null);
//		System.out.println("=========================== " + alunos.size());
		Curso curso = new CursoManager().recuperarCursosPorAtributo("id", 2).get(0);
		System.out.println(curso.getNome());

//		HashMap<String, Object> condicao = new HashMap<>();
//		Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", "Ciência da Computação").get(0);
//		condicao.put("curso", curso);
//
//		List<Aluno> alunos = new AlunoManager().recuperarAlunosPorAtributos(condicao);
//		System.out.println("=========================== " + alunos.size());
//		Campus campus = new Campus("campus1");
//		Centro centro = new Centro("centro1");
//		Curso curso = new Curso("curso1");
//		Aluno aluno = new Aluno("aluno1");
//		new CampusDAO().inserirCampus(campus);
//		new CentroDAO().inserirCentro(centro);
//		new CursoDAO().inserirCurso(curso);
//		new AlunoDAO().inserirAluno(aluno);
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
                
//                AnnotationConfiguration configuration = new AnnotationConfiguration();
//                        configuration.configure();
//                        StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
//                                configuration.getProperties()).build();
//			sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	}

}
