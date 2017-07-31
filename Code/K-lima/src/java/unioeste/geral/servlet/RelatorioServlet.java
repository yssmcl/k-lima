package unioeste.geral.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.CursoManager;
import unioeste.geral.relatorio.Relatorio;

@WebServlet(name = "RelatorioServlet", urlPatterns = {"/RelatorioServlet"})
public class RelatorioServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		String idCurso = request.getParameter("idCurso");

		// Verifica se é a seleção no JSP não foi "Todos"
		if (idCurso.matches("[0-9]+")) {
			Curso curso = new CursoManager().recuperarCursosPorAtributo("id", Long.parseLong(idCurso)).get(0);
			new Relatorio().gerarRelatorioEvasaoPorCurso(curso);
		} else {
			new Relatorio().gerarRelatorioEvasaoPorCurso(null);
		}

		String diretorioAtual = System.getProperty("user.dir");
		diretorioAtual = diretorioAtual.split("k-lima")[0];
		File file = new File(diretorioAtual + "k-lima/Code/K-lima/jasper/relatorios/relatorio-abandono.pdf");
		response.setHeader("Content-Type", getServletContext().getMimeType(file.getName()));
		response.setHeader("Content-Length", String.valueOf(file.length()));
		response.setHeader("Content-Disposition", "inline; filename=\"relatorio-abandono.pdf\"");
		long copy = Files.copy(file.toPath(), response.getOutputStream());
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
	}

}
