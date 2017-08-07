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
import com.google.gson.*;

@WebServlet(name = "GraficosServlet", urlPatterns = {"/GraficosServlet"})
public class GraficosServlet extends HttpServlet{

    
    private AlunoManager aluno = new AlunoManager();
    private CursoManager cursoMana = new CursoManager();
    private String cursoEscolhido;
  
    
    public  List<String> carregaDadosNomeCurso(Object filtroX){        
    List<String> filtrosEixoX = new ArrayList<>();
        if(filtroX.equals("Allcurso")){ //todos os cursos selecionados

                List<Curso> listaCursos = cursoMana.recuperarCursosPorAtributo("nome", "%%");
                for(int i=0; i<listaCursos.size(); i++){
                    filtrosEixoX.add(listaCursos.get(i).getNome());
                }
        } else { // somente um curso selecionado
            filtrosEixoX.add(cursoMana.recuperarCursosPorAtributo("nome", filtroX).get(0).getNome());
        } 
        
        return filtrosEixoX;
    }
   
    public Long carregaDadosSituacaoAnoAtual(Object ano, Object situacao, Object curso){        
                 
        Multimap<String, Object> condicaoAND = HashMultimap.create();
		
		condicaoAND.put("curso", curso);
		condicaoAND.put("situacaoAtual" , situacao);
		condicaoAND.put("anoAtual" , ano);
                
         return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
        
    }
    
     public long carregaDadosAnoAtual(Object ano, Object curso){                         
        
        Multimap<String, Object> condicaoAND = HashMultimap.create();
            
            condicaoAND.put("curso", curso);		
            condicaoAND.put("anoAtual" , ano);
            
        return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
        
    }
     
    public Long carregaDadosSituacaoAtual( Object situacao, Object curso){        
        Multimap<String, Object> condicaoAND = HashMultimap.create();
        Multimap<String, Object> condicaoOR = HashMultimap.create();
        
            condicaoAND.put("curso", curso);
            
            if(situacao.equals("AllSituacao")){
                condicaoOR.put("situacaoAtual" , "Cancelado");               
                condicaoOR.put("situacaoAtual", "Cancelado Por Abandono");		
		condicaoOR.put("situacaoAtual", "Transferido");
            }else condicaoAND.put("situacaoAtual" , situacao);
           
        return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
    }

    
    public long carregaDados( Multimap<String, Object> condicaoAND, Multimap<String, Object> condicaoOR){
            return new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, condicaoOR);
    }
    
    public  List<String> carregaPeriodos( ){
        List<String> filtrosEixoX = new ArrayList<>();
            filtrosEixoX.add("1"); // carrega dados se curso selecionado para x
            filtrosEixoX.add("2");
            filtrosEixoX.add("3");
            filtrosEixoX.add("4");                
            filtrosEixoX.add("5");
        return filtrosEixoX; // TODO deixar Dinamico
    }
    
    public List<String> carregaSituacao(){
        List<String> filtrosEixoX = new ArrayList<>();
            filtrosEixoX.add("Cursando"); // carrega dados se curso selecionado para x
            filtrosEixoX.add("Formado");
            filtrosEixoX.add("Cancelado por Abandono");
            filtrosEixoX.add("Cancelado");                
            filtrosEixoX.add("Transferido");
        return filtrosEixoX;// TODO deixar Dinamico
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try{    

            CursoManager cursoMana = new CursoManager();
            List<String> cursos = new ArrayList<>();
            List<String> valoresDoEixoX = new ArrayList<>();
            List<Long> valoresDoEixoY = new ArrayList<>();
            
            List<String> periodos = carregaPeriodos();
            List<String> situacoes = carregaSituacao();
            
            String tipoFiltroX = request.getParameter("TipoFiltroX");
            String tipoFiltroY = request.getParameter("TipoFiltroY");
            String tipoFiltroAuxiliar = request.getParameter("TipoFiltroAuxiliar");
            
            String filtrosEixoY = request.getParameter("FiltroY");  
            String filtroX = request.getParameter("FiltroX");
            String filtroAuxiliar = request.getParameter("auxiliaresSelecionado");

                        
              JsonObject objJson= new JsonObject();
              JsonArray data= new JsonArray();
              
             // data.add();
              
            Multimap<String, Object> condicaoAND = null;
            Multimap<String, Object> condicaoOR = null;
        
            if(filtroX.equals("AllCursos")||filtroX.equals("AllAnos")||filtroX.equals("AllSituacao")){
                
                if(tipoFiltroX.equals("AllCursos"))valoresDoEixoX = carregaDadosNomeCurso(filtroX);//;
                else if(tipoFiltroX.equals("AllAnos"))valoresDoEixoX = periodos;
                else if(tipoFiltroX.equals("AllSituacao"))valoresDoEixoX = situacoes;
                
            } else {                
                valoresDoEixoX.add(tipoFiltroX);             
            } // dados de x carregado
            
            if(valoresDoEixoX.size()==1){
                if(tipoFiltroX.equals("TfiltroPeriodos")){
                    condicaoAND.put("anoAtual", valoresDoEixoX.get(0));
                } else if(tipoFiltroX.equals("TfiltroCursos")){
                    condicaoAND.put("curso", valoresDoEixoX.get(0));
                } else if(tipoFiltroX.equals("TfiltroSituacao")){
                    condicaoAND.put("situacaoAtual", valoresDoEixoX.get(0));
                }
            } else {
                for(int i=0; i<valoresDoEixoX.size();i++){
                    if(tipoFiltroX.equals("TfiltroPeriodos")){
                        condicaoAND.put("anoAtual", valoresDoEixoX.get(i));
                    } else if(tipoFiltroX.equals("TfiltroCursos")){
                        condicaoAND.put("curso", valoresDoEixoX.get(i));
                    } else if(tipoFiltroX.equals("TfiltroSituacao")){
                        condicaoAND.put("situacaoAtual", valoresDoEixoX.get(i));
                    }
                    if(filtrosEixoY.equals("AllCursos")){
                        condicaoAND.put("curso", "%%");
                    } else if(filtrosEixoY.equals("AllAnos")){
                        condicaoAND.put("anoAtual", "%%");
                    } else if(filtrosEixoY.equals("AllSituacao")){
                        condicaoAND.put("situacaoAtual", "%%");
                    }
                }
            }

            
            
            request.getRequestDispatcher("graficos_dinamicos.jsp").forward(request, response);
        }catch(Exception e){
            e.printStackTrace(); // faz sentido isso aqui?
            System.out.println(e.getMessage());
        }
        
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
