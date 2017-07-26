/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.servlet;
import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.AlunoManager;
import unioeste.geral.manager.CursoManager;

@WebServlet(name = "GraficosServlet", urlPatterns = {"/GraficosServlet"})
public class GraficosServlet extends HttpServlet{

    private HashMap<String, Object> condicao;
    private AlunoManager aluno = new AlunoManager();
    private List<Aluno> alunos;
    private String cursoEscolhido;
    
    public Long carregaDadosSituacaoAnoAtual(Object ano, Object situacao){        
                 
        Multimap<String, Object> condicaoAND = HashMultimap.create();
		Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", cursoEscolhido).get(0);
		condicaoAND.put("curso", curso);
		condicaoAND.put("situacaoAtual" , situacao);
		condicaoAND.put("anoAtual" , ano);
                Multimap<String, Object> condicaoOR = HashMultimap.create();
         return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
        
    }
    
     public Long carregaDadosAnoAtual(Object ano){                         
        
        Multimap<String, Object> condicaoAND = HashMultimap.create();
            Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", cursoEscolhido).get(0);
            condicaoAND.put("curso", curso);		
            condicaoAND.put("anoAtual" , ano);
            Multimap<String, Object> condicaoOR = HashMultimap.create();
        return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
        
    }
     
    public Long carregaDadosSituacaoAtual( Object situacao){        
        Multimap<String, Object> condicaoAND = HashMultimap.create();
        Multimap<String, Object> condicaoOR = HashMultimap.create();
        
            Curso curso = new CursoManager().recuperarCursosPorAtributo("nome", cursoEscolhido).get(0);
            condicaoAND.put("curso", curso);
            if(situacao.equals("All")){
                condicaoOR.put("situacaoAtual" , "Cancelado");               
                condicaoOR.put("situacaoAtual", "Cancelado Por Abandono");		
		condicaoOR.put("situacaoAtual", "Transferido");
            }else condicaoAND.put("situacaoAtual" , situacao);
           
        return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        AlunoManager alunoMana = new AlunoManager();
        CursoManager cursoMana = new CursoManager();
        List<Aluno> alunos = new ArrayList<>();
        List<Aluno> alunos_total = new ArrayList<>();
        List<Curso> cursos = new ArrayList<>();
        List<Long> totais = new ArrayList<>();
        
        Long alunosCancelados = null;
        Long alunosCanceladosAbandono = null;
        Long alunosTransferidos = null;
        Long alunosFormados = null;
        Long alunosCursando = null;
       
        //List<Integer> alunosCursando= new ArrayList<>();
        List<Integer> alunosCursandoAnoCancelados= new ArrayList<>();
        List<Integer> alunosCursandoAnoCanceladosAbandono= new ArrayList<>();
        
        try{            
            String curso = request.getParameter("cursoSelecionado");            
            //String anoEntrada = request.getParameter("anoEntrada");
            String anoAtual = request.getParameter("anoSelecionado");
            String situacaoAtual = request.getParameter("situacaoSelecionada");
            System.out.println(curso+" asdasd"+anoAtual+" "+situacaoAtual);
            Multimap<String, Object> condicaoAND = null;
            Multimap<String, Object> condicaoOR = null;
            
            if(curso.equals("All")){
                cursos = cursoMana.recuperarCursosPorAtributo("nome", "%%");
                cursoEscolhido = "Engenharia Elétrica";
            } else {
                cursos = cursoMana.recuperarCursosPorAtributo("nome", "%"+curso+"%");
                cursoEscolhido = cursos.get(0).getNome();
            }System.out.println("Curso: "+cursoEscolhido);
            if(curso.equals("All")){ // se não faz diferença o curso
                if(anoAtual.equals("All")){               
                    if(situacaoAtual.equals("All")){               
                        alunosCancelados= carregaDadosSituacaoAtual(situacaoAtual);
                         System.out.println(alunosCancelados+" alunos cancelados");
                    } else if (situacaoAtual.equals("Formado")){
                        alunosFormados= carregaDadosSituacaoAtual(situacaoAtual);
                         System.out.println(alunosFormados);
                    } else if (situacaoAtual.equals("Cancelado")){
                        alunosCancelados= carregaDadosSituacaoAtual(situacaoAtual);
                        System.out.println(alunosCancelados);
                    } else if (situacaoAtual.equals("Cancelado Por Abandono")){
                        alunosCanceladosAbandono= carregaDadosSituacaoAtual(situacaoAtual);
                        System.out.println(alunosCancelados);
                    } else if (situacaoAtual.equals("Cursando")){
                        alunosCursando= carregaDadosSituacaoAtual(situacaoAtual);
                        System.out.println();
                    } else if (situacaoAtual.equals("Transferido")){
                        alunosTransferidos= carregaDadosSituacaoAtual(situacaoAtual);
                        System.out.println();
                    }
                } else  { // recupera se selecionou por ano
                    if(situacaoAtual.equals("All")){               
                        alunosCancelados= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    } else if (situacaoAtual.equals("Formado")){
                        alunosFormados= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    } else if (situacaoAtual.equals("Cancelado")){
                        alunosCancelados= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    } else if (situacaoAtual.equals("Cancelado Por Abandono")){
                        alunosCancelados= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    } else if (situacaoAtual.equals("Cursando")){
                        alunosCursando= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    } else if (situacaoAtual.equals("Transferido")){
                        alunosTransferidos= carregaDadosSituacaoAnoAtual(anoAtual,situacaoAtual);
                    }
                }
            } 
             
            request.setAttribute("alunosCancelados", alunosCancelados);
            request.setAttribute("alunosFormados", alunosFormados);
            request.setAttribute("alunosCanceladosAbandono", alunosCanceladosAbandono);
            request.setAttribute("alunosTransferidos",alunosTransferidos);
            request.setAttribute("alunosCursando",alunosCursando);
            request.setAttribute("alunosCursandoAnoCancelados",alunosCursandoAnoCancelados);
            request.setAttribute("alunosCursandoAnoCanceladosAbandono",alunosCursandoAnoCanceladosAbandono);
            request.setAttribute("situacao",situacaoAtual);
            request.setAttribute("anos",anoAtual);
            request.getRequestDispatcher("graficos_dinamicos.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
