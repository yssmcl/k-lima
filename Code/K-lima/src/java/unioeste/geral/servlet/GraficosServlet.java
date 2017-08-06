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

    
    private AlunoManager aluno = new AlunoManager();
    
    private String cursoEscolhido;
    
    public Long carregaDadosSituacaoAnoAtual(Object ano, Object situacao, Object curso){        
                 
        Multimap<String, Object> condicaoAND = HashMultimap.create();
		
		condicaoAND.put("curso", curso);
		condicaoAND.put("situacaoAtual" , situacao);
		condicaoAND.put("anoAtual" , ano);
                
         return  new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
        
    }
    
     public Long carregaDadosAnoAtual(Object ano, Object curso){                         
        
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

    String criarGraficoDinamico(List<Long> constantesX){
        String grafico=
        "    <script> "
            + "Highcharts.chart( 'grafico', { "
            + "           chart:{"
            + "                type: graficoSelecionado.options[graficoSelecionado.selectedIndex].value"
            + "           },"
            + "            title:{"
            + "                text: document.getElementById(tituloSelect.id).value"
            + "            },"
            + "        xAxis: {"
            + "            categories: ['1 ano', '2 ano', '3 ano', '4 ano'],"
            + "            title: {"
            + "                text: null"
            + "            }"
            + "        },"
            + "        yAxis: {"
            + "            min: 0,"
            + "            title: {"
            + "                text: 'quantidade de alunos do curso de: '"
            + "            }"
            + "        },"
            + "        tooltip: {"
            + "            headerFormat: '<span style=\"font-size:10px\">{point.key}</span><table>',"
            + "            pointFormat: '<tr><td style=\"color:{series.color};padding:0\">{series.name}: </td>' +"
            + "                '<td style=\"padding:0\"><b>{point.y}</b></td></tr>',"
            + "            footerFormat: '</table>',"
            + "            shared: true,"
            + "            useHTML: true"
            + "        },"
            + "        plotOptions: {"
            + "            column: {"
            + "                pointPadding: 0.2,"
            + "                borderWidth: 0"
            + "            }"
            + "        },"
            + "        series: [{name: 'Alunos evadidos',"     ;
        String dados="                data: [";
        for(int i=0;i<constantesX.size();i++){
            dados.concat(constantesX.get(i)+" ");
            if(i<constantesX.size()-1)dados.concat(", ");
        }
        
        String fim="] "
            + " }]});"
            + "</script>";   
        grafico.concat(dados);
        grafico.concat(fim);
        return grafico;
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
        String filtrosEixoy = new String();
        String filtroX = new String();
        List<Long> constantesX = new ArrayList<>();
        
      
        
        try{    
            filtroX=request.getParameter("FiltroX");
            filtrosEixoy = request.getParameter("FiltroY");            
            //String anoEntrada = request.getParameter("anoEntrada");
            String anoAtual = request.getParameter("anoSelecionado");
            String situacaoAtual = request.getParameter("situacaoSelecionada");
            
            Multimap<String, Object> condicaoAND = null;
            Multimap<String, Object> condicaoOR = null;
            
            if(filtroX.equals("Allcurso")){
               
                List<Curso> listaCursos = cursoMana.recuperarCursosPorAtributo("nome", "%%");
                for(int i=0; i<listaCursos.size(); i++){
                    filtrosEixoX.add(listaCursos.get(i).getNome());
                    constantesX.add(carregaDadosSituacaoAtual(filtrosEixoy,filtrosEixoX.get(i)));
                }
                
            } else { } 
            
               request.setAttribute("filtroEixoX", filtrosEixoX);
               request.setAttribute("constantesX", constantesX);
               request.setAttribute("baseX", filtroX);               
               request.setAttribute("filtrosEixoy", filtrosEixoy);
               request.setAttribute("grafico", criarGraficoDinamico(constantesX));
               
            request.getRequestDispatcher("graficos_dinamicos.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
}
