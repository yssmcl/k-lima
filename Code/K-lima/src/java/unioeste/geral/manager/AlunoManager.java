package unioeste.geral.manager;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Campus;
import unioeste.geral.dao.AlunoDAO;

public class AlunoManager {

	public void salvarAluno(Aluno aluno) {
		new AlunoDAO().inserirAluno(aluno);
	}

	/* Exemplo de uso:
		// Retorna uma lista de objetos do tipo Aluno contendo os objetos que possuem o atributo "nome" igual a "João Silva"
		// e o atributo "centro" igual a "CECE".
		// Equivalente a: SELECT * FROM Aluno WHERE nome = "João Silva" AND centro = "CECE";
		HashMap<String, Object> condicao = new HashMap<>();
		condicao.put("nome", "João Silva");
		condicao.put("centro", "CECE");
		List<Aluno> alunos = recuperarAlunosPorAtributos(condicao);
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
	
	public void removerAlunosPorAtributo(String atributo, Object valor) {
		new AlunoDAO().deletarAlunosPorAtributo(atributo, valor);
	}
    
    public void carregarCSV() throws IOException{
         
        try {            
                    
            // removerTodosAlunos(); //remove todos os alunos do banco antes de inserir os novos dados do arquivo CSV
            
            CampusManager campusMana = new CampusManager();
            CentroManager centroMana = new CentroManager();
            CursoManager cursoMana = new CursoManager();
            Scanner scanner = new Scanner(new FileReader("C:/Users/Leandro Ensina/Documents/Unioeste/4 ano/Sistemas de Informação/template_klima.csv"));
            scanner.nextLine(); //junto com a linha abaixo, elimina as duas primeiras linhas do arquivo que não são importantes
                                             
            while(scanner.hasNext()){
                
                //lê uma linha do arquivo que não será utilizada (a primeira do arquivo)
                String linha = scanner.nextLine();
                
                //Verifica a linha para evitar que não tenha valores faltantes
               // linha = padronizarLinhaCSV(linha);
                
               // separa cada campo do arquivo em vetores de string
                String campos[] = linha.split(";");
                                
                Aluno aluno = new Aluno();
                aluno.setNome(campos[0]);
                aluno.setAnoEntrada(campos[5]);
                aluno.setAnoAtual(campos[6]);
                aluno.setSituacaoAtual(campos[7]);
                aluno.setCep(campos[8]);
                aluno.setRua(campos[9]);
                aluno.setNumero(campos[10]);
                aluno.setBairro(campos[11]);
                aluno.setCidade(campos[12]);
                aluno.setUnidadeFederativa(campos[13]);
                
                //recupera a ID de curso
                
               // aluno.setCurso(curso.);
                //Campus campus = campusMana.recuperarCampiPorAtributo("nome", campos[3]);
                salvarAluno(aluno);
            }
            
            scanner.close();
        
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AlunoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
                
    }
    
    //Verifica a linha para evitar que não tenha valores faltantes
    public String padronizarLinhaCSV(String linha){
        
        char pontoVirgula = ';';
        
        while(linha.contains("  ")){
            linha = linha.replaceAll("  ", " ");
        }
        
        while(linha.contains("; ;")){
            linha = linha.replaceAll("; ;", ";0;");
        }
        
        while(linha.contains(";;")){
            linha = linha.replaceAll(";;", ";0;");
        }
        
        char ultimo_char = linha.charAt(linha.length()-1);
        if(ultimo_char == pontoVirgula){
            linha = linha + "0";
        }
        
        return linha;
    }

}
