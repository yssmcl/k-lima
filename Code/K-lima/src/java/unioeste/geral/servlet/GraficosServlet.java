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

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
       
        CursoManager cursoMana = new CursoManager();
        
        List<String> filtrosEixoX = new ArrayList<>();
        List<Long> filtrosEixoY = new ArrayList<>();
        String filtrosEixoy = new String();
        String tipoFiltroX = new String();
        String tipoFiltroY = new String();
        String filtroX = new String();
       
        
      
        
        try{    
            filtroX=request.getParameter("FiltroX");
            tipoFiltroY=request.getParameter("FiltroSelecionadoY");
            tipoFiltroX= request.getParameter("TipoFiltroX");
            filtrosEixoy = request.getParameter("FiltroY");            
            //String anoEntrada = request.getParameter("anoEntrada");
            String anoAtual = request.getParameter("anoSelecionado");
            String situacaoAtual = request.getParameter("situacaoSelecionada");
                        
              JsonObject objJson= new JsonObject();
              JsonArray data= new JsonArray();
              
             // data.add();
              
            Multimap<String, Object> condicaoAND = null;
            Multimap<String, Object> condicaoOR = null;
        
            if(tipoFiltroX.equals("AllCursos")){
                filtrosEixoX = carregaDadosNomeCurso(filtroX); // carrega dados se curso selecionado para x
                if(tipoFiltroY.equals("AllAnos")){
                    for(int i=0; i<filtrosEixoX.size();i++){
                        filtrosEixoY.add(carregaDadosAnoAtual("%%",filtrosEixoX.get(i)));
                    }
                } else {
                    for(int i=0; i<filtrosEixoX.size();i++){
                        filtrosEixoY.add(carregaDadosAnoAtual(tipoFiltroY,filtrosEixoX.get(i)));
                    }
                }
            }
            if(tipoFiltroX.equals("AllAnos")){
                filtrosEixoX.add("Primeiro Ano"); // carrega dados se curso selecionado para x
                filtrosEixoX.add("Segundo Ano");
                filtrosEixoX.add("Terceiro Ano");
                filtrosEixoX.add("Quarto Ano");                
                filtrosEixoX.add("Quinto Ano");
                if(tipoFiltroY.equals("AllCursos")){
                    for(int i=0; i<filtrosEixoX.size();i++){
                        filtrosEixoY.add(carregaDadosAnoAtual("%%",filtrosEixoX.get(i)));
                    }
                } else {
                    for(int i=0; i<filtrosEixoX.size();i++){
                         filtrosEixoY.add(carregaDadosAnoAtual(tipoFiltroY,filtrosEixoX.get(i)));
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
