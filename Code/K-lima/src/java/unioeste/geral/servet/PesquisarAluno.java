/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package unioeste.geral.servet;

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
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AlunoManager alunoMana = new AlunoManager();
        CursoManager cursoMana = new CursoManager();
        List<Aluno> alunos = new ArrayList<>();
        
        try{
            String nome = request.getParameter("nome");
            String curso = request.getParameter("curso");
            String anoEntrada = request.getParameter("anoEntrada");
            String anoAtual = request.getParameter("anoAtual");
            String situacaoAtual = request.getParameter("situacaoAtual");
            
            HashMap<String, Object> condicao = new HashMap<>();
            condicao.put("nome", "Arlindo");
            
            alunos = alunoMana.recuperarAlunosPorAtributos(condicao);
            
            request.setAttribute("alunos", alunos);
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
