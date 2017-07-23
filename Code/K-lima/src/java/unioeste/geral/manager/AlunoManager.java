package unioeste.geral.manager;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Campus;
import unioeste.geral.bo.Centro;
import unioeste.geral.bo.Curso;
import unioeste.geral.dao.AlunoDAO;
import unioeste.geral.util.PopularLocalizacaoThread;

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
		for (Map.Entry<String, Object> entry : condicao.entrySet()) {
			if (entry.getKey().equals("curso")) {
				condicao.remove("curso");
				Curso curso = (Curso) entry.getValue();
				condicao.put("curso.id", curso.getId());
			} else if (entry.getKey().equals("centro")) {
				condicao.remove("centro");	
				Centro centro = (Centro) entry.getValue();
				condicao.put("centro.id", centro.getId());
			} else if (entry.getKey().equals("campus")) {
				condicao.remove("campus");
				Campus campus = (Campus) entry.getValue();
				condicao.put("campus.id", campus.getId());
			}
		}
		return new AlunoDAO().buscarAlunosPorAtributos(condicao);
	}
	
	private Multimap<String, Object> substituirChaves(Multimap<String, Object> condicao) {		
		if (condicao != null) {			
			Multimap<String, Object> novaCondicao = HashMultimap.create();
			for (Map.Entry entry : condicao.entries()) {
				if (entry.getKey().equals("curso")) {
					Curso curso = (Curso) entry.getValue();
					novaCondicao.put(entry.getKey() + ".id", curso.getId());
				} else if (entry.getKey().equals("centro")) {
					Centro centro = (Centro) entry.getValue();
					novaCondicao.put(entry.getKey() + ".id", centro.getId());
				} else if (entry.getKey().equals("campus")) {
					Campus campus = (Campus) entry.getValue();
					novaCondicao.put(entry.getKey() + ".id", campus.getId());
				}
			}
			condicao.clear();
			return novaCondicao;
		}
		return null;
	}
	
	public List<Aluno> recuperarAlunosPorAtributosMultimap(Multimap<String, Object> condicaoAND,
														   Multimap<String, Object> condicaoOR) {
		condicaoAND = substituirChaves(condicaoAND);
		condicaoOR = substituirChaves(condicaoOR);
		return new AlunoDAO().buscarAlunosPorAtributosMultimap(condicaoAND, condicaoOR);
	}
	
	public Long recuperarQtdAlunosPorAtributos(HashMap<String, Object> condicao) {
		for (Map.Entry<String, Object> entry : condicao.entrySet()) {
			if (entry.getKey().equals("curso")) {
				condicao.remove("curso");
				Curso curso = (Curso) entry.getValue();
				condicao.put("curso.id", curso.getId());
			} else if (entry.getKey().equals("centro")) {
				condicao.remove("centro");	
				Centro centro = (Centro) entry.getValue();
				condicao.put("centro.id", centro.getId());
			} else if (entry.getKey().equals("campus")) {
				condicao.remove("campus");
				Campus campus = (Campus) entry.getValue();
				condicao.put("campus.id", campus.getId());
			}
		}
		return new AlunoDAO().buscarQtdAlunosPorAtributos(condicao);
	}

	public List<Aluno> recuperarTodosAlunos() {
		return new AlunoDAO().buscarTodosAlunos();
	}
    
    public int quantidadeAlunosCurso(Object curso,List<Aluno> alunos){
        int totalCurso=0;
        for(int i=0;i<alunos.size();i++ ){
            if(alunos.get(i).getCurso().getNome().equals(curso)) totalCurso++;
        }
        return totalCurso;
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
            Scanner scanner = new Scanner(new InputStreamReader(new FileInputStream("/home/nardi/Projetos/k-lima/Code/K-lima/build/web/data/template_klima.csv"), StandardCharsets.ISO_8859_1));
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
                
                //recupera a IDs de curso, centro e campus
                Campus campus = campusMana.recuperarCampiPorAtributo("nome", campos[3]).get(0);
                Centro centro = centroMana.recuperarCentrosPorAtributo("nome", campos[2]).get(0);
                Curso curso = cursoMana.recuperarCursosPorAtributo("nome", campos[1]).get(0);
               
                aluno.setCampus(campus);
                aluno.setCentro(centro);
                aluno.setCurso(curso);
                
                //Curso curso = cursoMana.recuperarCursosPorAtributo("", aluno);
                salvarAluno(aluno);
            }
            
            scanner.close();
        
            new PopularLocalizacaoThread(this).start();
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
