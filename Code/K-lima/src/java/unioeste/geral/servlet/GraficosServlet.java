/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.servlet;
import java.util.HashMap;
import java.util.List;
import unioeste.geral.bo.Aluno;
import unioeste.geral.manager.AlunoManager;


/**
 *
 * @author Paulo
 */
public class GraficosServlet {
    public int achaPorCurso(HashMap<String, Object> condicao){        
        AlunoManager aluno = new AlunoManager();
        List<Aluno> alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int a =aluno.quantidadeAlunosCurso("Ciência da Computação", alunos);
        return a;
    }
}
