
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class Main {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        /* JPA */
      //  AlunoDAO alunoDAO = new AlunoDAO();
      //  Aluno aluno = new Aluno("aluno" + UUID.randomUUID());
       // alunoDAO.inserirAluno(aluno);
  //      Aluno aluno = alunoDAO.buscarAlunoPorPK(3L);
//        alunoDAO.deletarAluno(aluno);

        /* teste de conexão */
        Connection connection;
        //Class.forName("com.mysql.jdbc.Driver");
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost/db_klima", "root", "");
        String sql = "SELECT * FROM autenticacao";
        PreparedStatement statement = connection.prepareStatement(sql);
        ResultSet resultSet = statement.executeQuery();
        resultSet.next();
        System.out.println(resultSet.getString("login"));
    }
}
