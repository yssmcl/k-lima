import aluno.Aluno;
import aluno.AlunoDAO;

import java.sql.SQLException;
import java.util.UUID;

public class Main {

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        /* JPA */
        AlunoDAO alunoDAO = new AlunoDAO();
        Aluno aluno = new Aluno("aluno" + UUID.randomUUID());
        alunoDAO.inserirAluno(aluno);
//        Aluno aluno = alunoDAO.buscarAlunoPorPK(3L);
//        alunoDAO.deletarAluno(aluno);

        /* teste de conexão */
//        Connection connection;
//        Class.forName("org.mariadb.jdbc.Driver");
//        connection = DriverManager.getConnection("jdbc:mysql://localhost/livros", "root", "");
//        String sql = "SELECT * FROM hibernate_sequence";
//        PreparedStatement statement = connection.prepareStatement(sql);
//        ResultSet resultSet = statement.executeQuery();
//        resultSet.next();
//        System.out.println(resultSet.getInt("next_val"));
    }
}
