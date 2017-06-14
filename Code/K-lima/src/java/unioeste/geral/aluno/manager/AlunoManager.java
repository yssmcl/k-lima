package unioeste.geral.aluno.manager;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.geral.aluno.bo.Aluno;
import unioeste.geral.aluno.dao.AlunoDAO;

public class AlunoManager {

	public void salvarAluno(Aluno aluno) {
		new AlunoDAO().inserirAluno(aluno);
	}

	/* Exemplo de uso:
		// Retorna uma lista de objetos do tipo Aluno contendo os objetos que possuem o atributo "nome" igual a "João Silva"
		// e o atributo "centro" igual a "CECE".
		// Equivalente a: SELECT * FROM Aluno WHERE nome = "João Silva" AND centro = "CECE";
		HashMap<String, Object> condicoes = new HashMap<>();
		condicoes.put("nome", "João Silva");
		condicoes.put("centro", "CECE");
		List<Aluno> alunos = recuperarAlunosPorAtributos(condicoes);
	*/
	public List<Aluno> recuperarAlunosPorAtributos(HashMap<String, Object> condicao) {
		return new AlunoDAO().buscarAlunosPorAtributos(condicao);
	}
	
	/* Exemplo de uso:
		// Retorna a quantidade de objetos do tipo Aluno que possuem o atributo "nome" igual a "João Silva" e o atributo
		// "centro" igual a "CECE".
		// Equivalente a: SELECT * FROM Aluno WHERE nome = "João Silva" AND centro = "CECE";
		HashMap<String, Object> condicoes = new HashMap<>();
		condicoes.put("nome", "João Silva");
		condicoes.put("centro", "CECE");
		long qtdAlunos = recuperarAlunosPorAtributos(condicoes);
	*/
	public Long recuperarQtdAlunosPorAtributos(HashMap<String, Object> condicao) {
		return new AlunoDAO().buscarQtdAlunosPorAtributos(condicao);
	}

    public List<Aluno> recuperarTodosAlunos() {
	return new AlunoDAO().buscarTodosAlunos();
    }

    public void modificarAluno(Aluno aluno) {
		new AlunoDAO().atualizarAluno(aluno);
	}

    public void removerAluno(Aluno aluno) {
		new AlunoDAO().deletarAluno(aluno);
	}
	
    public void removerTodosAlunos() {
	new AlunoDAO().deletarTodosAlunos();
    }
    
    public void carregarCSV() throws IOException{
        
        BufferedReader br;
        List<Aluno> alunos = new ArrayList<Aluno>();
        
        try {
            br = new BufferedReader(new FileReader("C:/Users/Leandro Ensina/Documents/Unioeste/4 ano/Sistemas de Informação/export.csv"));
            br.readLine(); //elimina a primeira linha, que não é importante
                        
            while(br.ready()){
                
                String linha = br.readLine(); //lê uma linha do arquivo
                String campos[] = linha.split(";"); // separa cada campo do arquivo em vetores de string
                                
                Aluno aluno = new Aluno();
                aluno.setCurso(campos[0]);
                aluno.setCentro(campos[1]);
                aluno.setModalidade(campos[2]);
                aluno.setTurno(campos[3]);
                aluno.setAnoAtual(Integer.parseInt(campos[4]));
                aluno.setNome(campos[5]);
                aluno.setUnidadeFederativa(campos[6]);
                aluno.setSituacaoAtual(campos[7]);
                aluno.setCep(campos[8]);
                aluno.setRua(campos[9]);
                aluno.setNumero(Integer.parseInt(campos[10]));
                aluno.setBairro(campos[11]);
                aluno.setCidade(campos[12]);
                
                alunos.add(aluno);
            }
            
            br.close();
        
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        
//        return alunos;
        
    }

}
