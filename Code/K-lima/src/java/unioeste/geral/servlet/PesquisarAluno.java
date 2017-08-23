/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.servlet;

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

/**
 *
 * @author Leandro Ensina
 */
@WebServlet(name = "PesquisarAluno", urlPatterns = {"/PesquisarAluno"})
public class PesquisarAluno extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PesquisarAluno</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PesquisarAluno at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // pega caracteres UTF-8 do JSP

        AlunoManager alunoMana = new AlunoManager();
        CursoManager cursoMana = new CursoManager();
        List<Aluno> alunos = new ArrayList<>();
        List<Aluno> alunos_total = new ArrayList<>();
        List<Curso> cursos = new ArrayList<>();
        List<Curso> cursos_nome = new ArrayList<>();
        List<Curso> cursos_turno = new ArrayList<>();
        int i, j;
        
        try{
            String aluno = request.getParameter("aluno");
            String curso = request.getParameter("curso");
            String turno = request.getParameter("turno");
            String anoEntrada = request.getParameter("anoEntrada");
            String anoAtual = request.getParameter("anoAtual");
            String situacaoAtual = request.getParameter("situacaoAtual");
            
            HashMap<String, Object> condicao = new HashMap<>();
            
            //recupera os alunos
            condicao.put("nome", "%"+aluno+"%");            
            condicao.put("anoEntrada", "%"+anoEntrada+"%");
            condicao.put("anoAtual", "%"+anoAtual+"%");
            condicao.put("situacaoAtual", "%"+situacaoAtual+"%");
            alunos = alunoMana.recuperarAlunosPorAtributos(condicao);
            
            //recupera os cursos
            cursos_nome = cursoMana.recuperarCursosPorAtributo("nome", "%"+curso+"%");
            
            //recupera os cursos pelo turno
            cursos_turno = cursoMana.recuperarCursosPorAtributo("turno", "%"+turno+"%");
            
            for(i=0; i<cursos_nome.size(); i++){                
                for(j=0; j<cursos_turno.size(); j++){
                    if(cursos_nome.get(i).getId() == cursos_turno.get(j).getId()){
                        cursos.add(cursos_nome.get(i));
                        continue;
                    }
                }
            }
            
            //procura por alunos que estejam no curso passado no filtro de pesquisa
            for(i=0; i<alunos.size(); i++){
                for(j=0; j<cursos.size(); j++){
                    if(alunos.get(i).getCurso().getId() == cursos.get(j).getId()){
                        alunos_total.add(alunos.get(i));
                        continue;
                    }
                }
            }
            
            
            
            request.setAttribute("alunos", alunos_total);
            request.getRequestDispatcher("tabela_evasao.jsp").forward(request, response);
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
