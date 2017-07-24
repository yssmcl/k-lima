package unioeste.geral.relatorio;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import unioeste.geral.bo.Aluno;
import unioeste.geral.manager.AlunoManager;

public class Relatorio {

	public void gerarRelatorio() {
		try {
			String wd = System.getProperty("user.dir");
			wd = wd.split("k-lima")[0];

			String arquivoTemplate = wd + "k-lima/Code/K-lima/jasper/templates/relatorioabandono.jrxml";
			String arquivoDestino = wd + "k-lima/Code/K-lima/jasper/relatorios/relatorioabandono.pdf";

			HashMap<String, Object> condicao = new HashMap<>();
			condicao.put("situacaoAtual", "Cancelado");
			List<Aluno> alunosCancelados = new AlunoManager().recuperarAlunosPorAtributos(condicao);

			condicao.clear();
			condicao.put("situacaoAtual", "Cancelado Por Abandono");
			List<Aluno> alunosCanceladosPorAbandono = new AlunoManager().recuperarAlunosPorAtributos(condicao);

			condicao.clear();
			condicao.put("situacaoAtual", "Transferido");
			List<Aluno> alunosTransferidos = new AlunoManager().recuperarAlunosPorAtributos(condicao);

			Map parametros = new HashMap();
			parametros.put("Cancelados", alunosCancelados.size());
			parametros.put("CanceladosPorAbandono", alunosCanceladosPorAbandono.size());
			parametros.put("Transferidos", alunosTransferidos.size());
			parametros.put("Total", alunosCancelados.size() + alunosCanceladosPorAbandono.size() + alunosTransferidos.size());

			JasperReport jasperReport = JasperCompileManager.compileReport(arquivoTemplate);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, new JREmptyDataSource());
			JasperExportManager.exportReportToPdfFile(jasperPrint, arquivoDestino);
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

}
