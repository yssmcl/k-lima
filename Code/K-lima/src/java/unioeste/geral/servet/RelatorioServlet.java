package unioeste.geral.servet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import unioeste.geral.relatorio.Relatorio;

@WebServlet(name = "RelatorioServlet", urlPatterns = {"/RelatorioServlet"})
public class RelatorioServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // pega caracteres UTF-8 do JSP

		new Relatorio().gerarRelatorioCancelamento();

//            response = HttpResponse(arquivo_pdf, content_type='application/pdf')
//            response['Content-Disposition'] = 'inline; filename=%s' % smart_str(nome_arquivo)
//			return response
	}

}
