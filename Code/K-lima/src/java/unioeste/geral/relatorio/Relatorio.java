package unioeste.geral.relatorio;

import com.google.common.collect.HashMultimap;
import com.google.common.collect.Multimap;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.view.JasperViewer;
import unioeste.geral.bo.Aluno;
import unioeste.geral.bo.Curso;
import unioeste.geral.manager.AlunoManager;

/**
 * 
 * Classe utilizada para gerar relatórios do sistema.
 * 
 *Os métodos dessa classe permitem construir relatórios e exporta-los para o 
 * formato PDF.
 * 
 */
public class Relatorio {
/*
    
    
    */

    /**gerarRelatorioEvasaoPorCurso.
     * 
     * 
     * Gera o relatório de evasão de um determinado curso, utilizando um 
     * modelo de relatório de formato jrxml.
     * O parâmetro de entrada é um objeto do tipo Curso.
     * 
     * @see   Curso
     * @param curso
     */

	public void gerarRelatorioEvasaoPorCurso(Curso curso) {
		try {
			String diretorioAtual = System.getProperty("user.dir");
			diretorioAtual = diretorioAtual.split("k-lima")[0];
			new File(diretorioAtual + "k-lima/lib/apache-tomcat-8.5.15/temp").mkdir(); // cria diretório temp pra não dar exceção de fontes no jasper
			String arquivoTemplate = diretorioAtual + "k-lima/Code/K-lima/jasper/templates/relatorio-abandono.jrxml";
			String arquivoDestino = diretorioAtual + "k-lima/Code/K-lima/jasper/relatorios/relatorio-abandono.pdf";
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
			Long qtdAlunosCancelados = new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
			condicaoAND.clear();
			condicaoAND.put("situacaoAtual", "Cancelado Por Abandono");
			condicaoAND.put(nomeAtributoCurso, curso);
			Long qtdAlunosCanceladosPorAbandono = new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
			condicaoAND.clear();
			condicaoAND.put("situacaoAtual", "Transferido");
			condicaoAND.put(nomeAtributoCurso, curso);
			Long qtdAlunosTransferidos = new AlunoManager().recuperarQtdAlunosPorAtributos(condicaoAND, null);
			Map parametros = new HashMap();
			parametros.put("Curso", nomeCurso);
			parametros.put("LogoUnioeste", caminhoLogoUnioeste);
			parametros.put("LogoGoverno", caminhoLogoGoverno);
			parametros.put("Cancelados", qtdAlunosCancelados);
			parametros.put("CanceladosPorAbandono", qtdAlunosCanceladosPorAbandono);
			parametros.put("Transferidos", qtdAlunosTransferidos);
			parametros.put("Total", qtdAlunosCancelados + qtdAlunosCanceladosPorAbandono + qtdAlunosTransferidos);
			JasperReport jasperReport = JasperCompileManager.compileReport(arquivoTemplate);
			JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parametros, new JREmptyDataSource());
			JasperExportManager.exportReportToPdfFile(jasperPrint, arquivoDestino);
//			
		} catch (JRException e) {
			e.printStackTrace();
		}
	}

    /**gerarRelatorioGeral.
     *
     * Gera  o relatório apartir de uma lista do objeto Aluno e um modelo de 
     * relatório de formato jrxml.
     * O parâmetro de entrada é uma lista de elementos do tipo Aluno;
     * @see Aluno
     * @param alunos
     */
    public void gerarRelatorioGeral(List<Aluno> alunos) {
		try {
			String diretorioAtual = System.getProperty("user.dir");
			diretorioAtual = diretorioAtual.split("k-lima")[0];
			new File(diretorioAtual + "k-lima/lib/apache-tomcat-8.5.15/temp").mkdir();
			String arquivoTemplate = diretorioAtual +"k-lima/Code/K-lima/jasper/templates/relatorio-geral.jrxml"; 
			String arquivoDestino = diretorioAtual  +"k-lima/Code/K-lima/jasper/relatorios/relatorio-geral.pdf";
			String caminhoLogoUnioeste = diretorioAtual + "k-lima/Code/K-lima/web/img/unioeste.jpg";
			String caminhoLogoGoverno = diretorioAtual + "k-lima/Code/K-lima/web/img/governo.jpg";
			JasperReport jr = JasperCompileManager.compileReport(arquivoTemplate);
			Map<String, Object> parametros = new HashMap<>();
			JRDataSource arquivo = new JRBeanCollectionDataSource(alunos);
			JasperPrint jp = JasperFillManager.fillReport(jr, parametros, arquivo);
                       JasperExportManager.exportReportToPdfFile(jp, arquivoDestino);
                    	JasperViewer.viewReport(jp);
		} catch (JRException e) {
			System.out.println("Erro fatal na geração do relatório");
		}
	}


    public static void main(String[] args) {
		Multimap<String, Object> condicaoAND = HashMultimap.create();
		condicaoAND.put("situacaoAtual", "Cancelado");
		List<Aluno> alunosCancelados = new AlunoManager().recuperarAlunosPorAtributosMultimap(condicaoAND, null);
		new Relatorio().gerarRelatorioGeral(alunosCancelados);
	}

}
