package unioeste.geral.relatorio;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
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
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.AlunoManager;

public class Relatorio {

	// TODO: fazer o esquema de caminho absoluto pro logo da Unioeste no relatório
	public void gerarRelatorioEvasaoPorCurso(Curso curso) {
		try {
			String diretorioAtual = System.getProperty("user.dir");
			diretorioAtual = diretorioAtual.split("k-lima")[0];
			String arquivoTemplate = diretorioAtual + "k-lima/Code/K-lima/jasper/templates/relatorioabandono.jrxml";
			String arquivoDestino = diretorioAtual + "k-lima/Code/K-lima/jasper/relatorios/relatorioabandono.pdf";
			String caminhoLogoUnioeste = diretorioAtual + "k-lima/Code/K-lima/web/img/unioeste.jpg";
			String caminhoLogoGoverno = diretorioAtual + "k-lima/Code/K-lima/web/img/governo.jpg";

			String nomeAtributoCurso;
			String nomeCurso;
			if (curso == null) {
				nomeCurso = "Todos os cursos";
				nomeAtributoCurso = "";
			} else {
				nomeCurso = curso.getNome();
				nomeAtributoCurso = "curso";
			}

			Multimap<String, Object> condicaoAND = HashMultimap.create();
			condicaoAND.put("situacaoAtual", "Cancelado");
			condicaoAND.put(nomeAtributoCurso, curso);
			List<Aluno> alunosCancelados = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, null);

			condicaoAND.clear();
			condicaoAND.put("situacaoAtual", "Cancelado Por Abandono");
			condicaoAND.put(nomeAtributoCurso, curso);
			List<Aluno> alunosCanceladosPorAbandono = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, null);

			condicaoAND.clear();
			condicaoAND.put("situacaoAtual", "Transferido");
			condicaoAND.put(nomeAtributoCurso, curso);
			List<Aluno> alunosTransferidos = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, null);

			Map parametros = new HashMap();
			parametros.put("Curso", nomeCurso);
			parametros.put("LogoUnioeste", caminhoLogoUnioeste);
			parametros.put("LogoGoverno", caminhoLogoGoverno);
			parametros.put("Cancelados", alunosCancelados.size());
			parametros.put("CanceladosPorAbandono", alunosCanceladosPorAbandono.size());
			parametros.put("Transferidos", alunosTransferidos.size());
			parametros.put("Total", alunosCancelados.size() + alunosCanceladosPorAbandono.size() + alunosTransferidos.size());

			JasperReport jasperReport = JasperCompileManager.compileReport(arquivoTemplate);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, new JREmptyDataSource());
			JasperExportManager.exportReportToPdfFile(jasperPrint, arquivoDestino);
//			JasperViewer.viewReport(jasperPrint);
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		new Relatorio().gerarRelatorioEvasaoPorCurso(null);
	}

}
