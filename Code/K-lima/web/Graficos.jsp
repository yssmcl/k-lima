<%-- 
    Document   : index
    Created on : 05/06/2017, 14:26:56
    Author     : Paulo
--%>

<%@page import="unioeste.geral.servet.GraficosServlet"%>
<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.manager.CursoManager"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String caminho = request.getContextPath();
%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>K-Lima</title>

        <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">    
        <link rel="stylesheet" href="<%=caminho%>/css/app.css">
    </head>
    <body>

  <script src="https://code.highcharts.com/highcharts.js"></script>
  <script src="https://code.highcharts.com/modules/exporting.js"></script>
  <script src="https://code.highcharts.com/modules/drilldown.js"></script>
  <div class="off-canvas-wrapper">
      <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper> <!-- Essa div e a de cima servem para fazer a parte do menu lateral -->

          <jsp:include page="#{caminho}/includes/menu.jsp"/>
          
<% 
        String cursoEscolhido = "Ciência da Computação";
        
        
        HashMap<String, Object> condicao;
        condicao = new HashMap<String, Object>();
        condicao.put("situacaoAtual" , "Cancelado");
        AlunoManager aluno = new AlunoManager();
        condicao.put("situacaoAtual" , "Cancelado por Abandono");  
        List<Aluno> alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCanceladosCC =aluno.quantidadeAlunosCurso("Ciência da Computação", alunos);
        condicao.put("situacaoAtual" , "Cancelado");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosCC =alunosCanceladosCC+aluno.quantidadeAlunosCurso("Ciência da Computação", alunos);
        condicao.put("situacaoAtual" , "transferido");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosTransferidosCC = aluno.quantidadeAlunosCurso("Ciência da Computação", alunos);
        alunosCanceladosCC =alunosCanceladosCC+alunosTransferidosCC;
        
        int alunosCanceladosEM =aluno.quantidadeAlunosCurso("Engenharia Mecânica", alunos); 
        condicao.put("situacaoAtual" , "Cancelado por Abandono");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEM =aluno.quantidadeAlunosCurso("Engenharia Mecânica", alunos);
        condicao.put("situacaoAtual" , "Cancelado");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEM =alunosCanceladosEM+aluno.quantidadeAlunosCurso("Engenharia Mecânica", alunos);
        condicao.put("situacaoAtual" , "transferido");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEM =alunosCanceladosEM+aluno.quantidadeAlunosCurso("Engenharia Mecânica", alunos);
        
        int alunosCanceladosMAT =aluno.quantidadeAlunosCurso("Matemática", alunos); 
        condicao.put("situacaoAtual" , "Cancelado por Abandono");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosMAT =aluno.quantidadeAlunosCurso("Matemática", alunos);
        condicao.put("situacaoAtual" , "Cancelado");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosMAT =alunosCanceladosMAT+aluno.quantidadeAlunosCurso("Matemática", alunos);
        condicao.put("situacaoAtual" , "transferido");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosMAT =alunosCanceladosMAT+aluno.quantidadeAlunosCurso("Matemática", alunos);
        
        
        int alunosCanceladosEE =aluno.quantidadeAlunosCurso("Engenharia Elétrica", alunos); 
        condicao.put("situacaoAtual" , "Cancelado por Abandono");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEE =aluno.quantidadeAlunosCurso("Engenharia Elétrica", alunos);
        condicao.put("situacaoAtual" , "Cancelado");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEE =alunosCanceladosEE+aluno.quantidadeAlunosCurso("Engenharia Elétrica", alunos);
        condicao.put("situacaoAtual" , "transferido");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosEE =alunosCanceladosEE+aluno.quantidadeAlunosCurso("Engenharia Elétrica", alunos);
        
%>
<%
                
        condicao.put("situacaoAtual" , "cursando");        
        condicao.put("anoAtual" , "1");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando1Ano =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
        
        condicao.put("situacaoAtual" , "cursando");        
        condicao.put("anoAtual" , "2");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando2Ano =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "cursando");        
        condicao.put("anoAtual" , "3");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando3Ano =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "cursando");        
        condicao.put("anoAtual" , "4");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando4Ano =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

%>
<%            
        condicao.put("situacaoAtual" , "cancelado");        
        condicao.put("anoAtual" , "1");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando1AnoCancelados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
        
        condicao.put("situacaoAtual" , "cancelado");        
        condicao.put("anoAtual" , "2");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando2AnoCancelados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "cancelado");        
        condicao.put("anoAtual" , "3");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando3AnoCancelados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "cancelado");        
        condicao.put("anoAtual" , "4");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursand4AnoCancelados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
%>
<%            
        condicao.put("situacaoAtual" , "Cancelado por Abandono");        
        condicao.put("anoAtual" , "1");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando1AnoCanceladosAbandono =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
        
        condicao.put("situacaoAtual" , "Cancelado por Abandono");        
        condicao.put("anoAtual" , "2");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando2AnoCanceladosAbandono =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "Cancelado por Abandono");        
        condicao.put("anoAtual" , "3");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursando3AnoCanceladosAbandono =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 

        condicao.put("situacaoAtual" , "Cancelado por Abandono");        
        condicao.put("anoAtual" , "4");
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCursand4AnoCanceladosAbandono =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
%>

<% 
    
        condicao.put("situacaoAtual" , "Cancelado");
        condicao.put("situacaoAtual" , "Cancelado por Abandono");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosCancelados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos);
        condicao.put("situacaoAtual" , "Cancelado");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        alunosCanceladosCC =alunosCanceladosCC+aluno.quantidadeAlunosCurso(cursoEscolhido, alunos);
        condicao.put("situacaoAtual" , "transferido");  
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosTransferidos = aluno.quantidadeAlunosCurso(cursoEscolhido, alunos);        
        condicao.put("situacaoAtual" , "formado");                
        alunos= aluno.recuperarAlunosPorAtributos(condicao);
        int alunosFormados =aluno.quantidadeAlunosCurso(cursoEscolhido, alunos); 
%>
</div>
      </div>
<br />
          <br />
          <br />
<div id="colunasLaterais" style="min-width: 310px; max-width: 800px; height: 400px; margin: 0 auto"></div>  
<br><br><br>

<div id="AlunosDesistentesPorCurso" style="min-width: 310px; height: 400px; margin: 0 auto"></div>

<br><br><br>     
  <div id="AlunosPorAnoDoCursoDe" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<br><br><br>
        
  <div id="pizza" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>
<br><br><br> 
  
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>  
        
     <script>
        
        // Create the chart
     
    
Highcharts.chart('colunasLaterais', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Alunos desistentes por curso'
        },

        xAxis: {
            categories: ['Ciência da Computação','Engenharia Elétrica','Engenharia Mecânica','Matemática'],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade de alunos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Desistentes',
            data: [<%out.println(alunosCancelados);%>, <%out.println(alunosCanceladosEE);%>, <%out.println(alunosCanceladosEM);%>, <%out.println(alunosCanceladosMAT);%>]

        }]
    }); // retangular
        
Highcharts.chart('AlunosDesistentesPorCurso', {
        chart: {
            type: 'bar'
        },
        title: {
        text: 'Alunos cursando '+'<% out.print(cursoEscolhido);%>'
        },
        xAxis: {
            categories: ['1 ano', '2 ano', '3 ano', '4 ano'],
            title: {
                text: null
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Alunos',
                align: 'high'
            },
            labels: {
                overflow: 'justify'
            }
        },
        tooltip: {
        },
        plotOptions: {
            bar: {
                dataLabels: {
                    enabled: true
                }
            }
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Quantidade de alunos',
            data: [<% out.println(alunosCursando1Ano);%>,<% out.println(alunosCursando2Ano);%>,
                    <% out.println(alunosCursando3Ano);%>,<% out.println(alunosCursando4Ano);%>]
        }]
    });
        
Highcharts.chart('AlunosPorAnoDoCursoDe', {
        chart: {
            type: 'column'
        },
        title: {
            text: 'Alunos por ano do curso de '+'<% out.print(cursoEscolhido);%>'
        },

        xAxis: {
            categories: [ '1 ano', '2 ano', '3 ano','4 ano'],
            crosshair: true
        },
        yAxis: {
            min: 0,
            title: {
                text: 'Quantidade de alunos'
            }
        },
        tooltip: {
            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
            pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                '<td style="padding:0"><b>{point.y}</b></td></tr>',
            footerFormat: '</table>',
            shared: true,
            useHTML: true
        },
        plotOptions: {
            column: {
                pointPadding: 0.2,
                borderWidth: 0
            }
        },
        series: [{
            name: 'Cancelados',
            data: [<%out.println(alunosCursando1AnoCancelados);%>,<%out.println(alunosCursando2AnoCancelados);%>,
                    <%out.println(alunosCursando3AnoCancelados);%>,<%out.println(alunosCursand4AnoCancelados);%> ]

        }, {
            name: 'Cancelados por abandono',
            data: [<%out.println(alunosCursando1AnoCanceladosAbandono);%>,<%out.println(alunosCursando2AnoCanceladosAbandono);%>,
                    <%out.println(alunosCursando3AnoCanceladosAbandono);%>,<%out.println(alunosCursand4AnoCanceladosAbandono);%> ]
        }]
    }); // retangular
        
Highcharts.chart('pizza', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Situação do ingresso do curso de '+'<% out.print(cursoEscolhido);%>'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
						fontSize: '14px'
                    }
                }
            }
        },
        series: [{
            name: 'Alunos',
            colorByPoint: true,
            data: [
                   {name: 'Desistentes', y: <% out.println(alunosCancelados);%>},
                   {name: 'Formados', y: <% out.println(alunosFormados);%>},
                   {name: 'Transferidos', y: <%out.println(alunosTransferidos);%>},
                   {name: 'Cursando', y: <%out.println(alunosCursando1Ano+alunosCursando2Ano+alunosCursando3Ano+alunosCursando4Ano);%>}            
            ]
        }]
        
    });  // pizza
 
   </script>   
    <script src="<%=caminho%>/js/vendor/jquery.js"></script>    
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>

    </body>
</html>
