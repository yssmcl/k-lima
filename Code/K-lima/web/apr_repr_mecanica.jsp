<%-- 
    Document   : apr_repr
    Created on : 26/07/2017, 14:28:12
    Author     : Leandro Ensina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
<%
	String caminho = request.getContextPath();
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SAG - Sistema de Apoio ao Gestor</title>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.css"/> 
    <script type="text/javascript" src="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
    <script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
            $('#example').dataTable();
	} );
        
        function cancelar_cadastro() {
            decisao = confirm("Ao sair, todos os dados do formulário serão perdidos. Deseja continuar?");
            if (decisao) {
                location.href = "index.jsp";
            }
        }
    </script>
    <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">    
    <link rel="stylesheet" href="<%=caminho%>/css/app.css">
    <style>
        div{
            text-align: center;
        }
    </style>
    
  </head>
  <body>
    
    <div class="off-canvas-wrapper">
      <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper> <!-- Essa div e a de cima servem para fazer a parte do menu lateral -->

          <jsp:include page="#{caminho}/includes/menu.jsp"/>

          <!-- MAIN SECTION -->
          <br />
          <h1 style="text-align: center;">Índice de aprovação de Engenharia Mecânica</h1>
          <br />
          <form action="CadastroAprRepr" method="post">
              <div class="row">
                  <div class="medium-12 columns">
                      <label>Ano Letivo
                          <input id="ano" name="ano" type="text" />
                      </label>
                  </div>
              </div>
              
              <hr />
              
              <div class="row">
                  <h2 style="text-align: left;">1º ano</h2>
                  <div class="medium-6 columns">
                      <label>Álgebra Linear</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Geometria Analítica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoAlgebra" name="aprovacaoAlgebra" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoAlgebra" name="reprovacaoAlgebra" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoGeometria" name="aprovacaoGeometria" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoGeometria" name="reprovacaoGeometria" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Cálculo I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Cálculo II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCalculo1" name="aprovacaoCalculo1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCalculo1" name="reprovacaoCalculo1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCalculo2" name="aprovacaoCalculo2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCalculo2" name="reprovacaoCalculo2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Computação I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Computação II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoComputacao1" name="aprovacaoComputacao1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoComputacao1" name="reprovacaoComputacao1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoComputacao2" name="aprovacaoComputacao2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoComputacao2" name="reprovacaoComputacao2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Desenho Técnico I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Desenho Técnico II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoDesenho1" name="aprovacaoDesenho1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoDesenho1" name="reprovacaoDesenho1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoDesenho2" name="aprovacaoDesenho2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoDesenho2" name="reprovacaoDesenho2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Física I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Física II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoFisica1" name="aprovacaoFisica1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoFisica1" name="reprovacaoFisica1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoFisica2" name="aprovacaoFisica2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoFisica2" name="reprovacaoFisica2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Laboratório de Física I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Laboratório de Física II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoLabFisica1" name="aprovacaoLabFisica1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoLabFisica1" name="reprovacaoLabFisica1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoFisica2" name="aprovacaoLabFisica2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoFisica2" name="reprovacaoLabFisica2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Química I</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Química II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoQuimica1" name="aprovacaoQuimica1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoQuimica1" name="reprovacaoQuimica1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoQuimica2" name="aprovacaoQuimica2" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoQuimica2" name="reprovacaoQuimica2" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Química Geral e Tecnológica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoQuimicaGeral" name="aprovacaoQuimicaGeral" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoQuimicaGeral" name="reprovacaoQuimicaGeral" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              
              <hr />
              
              <div class="row">
                  <h2 style="text-align: left;">2º ano</h2>
                  <div class="medium-6 columns">
                      <label>Cálculo Vetorial</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Equações Diferenciais</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCalculoVet" name="aprovacaoCalculoVet" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCalculoVet" name="reprovacaoCalculoVet" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoEquaDif" name="aprovacaoEquaDif" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoEquaDif" name="reprovacaoEquaDif" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Física II</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Laboratório de Física II</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoFisica22" name="aprovacaoFisica22" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoFisica22" name="reprovacaoFisica22" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoLabFisica22" name="aprovacaoLabFisica22" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoLabFisica22" name="reprovacaoLabFisica22" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Mecânica - Estática e Dinâmica</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Probabilidades e Estatística</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMecanica1" name="aprovacaoMecanica1" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMecanica1" name="reprovacaoMecanica1" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoProba" name="aprovacaoProba" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoProba" name="reprovacaoProba" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Termodinâmica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoTermodinamica" name="aprovacaoTermodinamica" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoTermodinamica" name="reprovacaoTermodinamica" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              
              <hr />
              
              <div class="row">
                  <h2 style="text-align: left;">3º ano</h2>
                  <div class="medium-6 columns">
                      <label>Análise de Sistemas Dinâmicos e Vibrações</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Cálculo Numérico</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoAnalise" name="aprovacaoAnalise" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoAnalise" name="reprovacaoAnalise" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCalculoNum" name="aprovacaoCalculoNum" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCalculoNum" name="reprovacaoCalculoNum" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Circuitos Elétricos e Eletrotécnica para Engenharia Mecânica</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Mecânica dos Fluídos</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCircuitos" name="aprovacaoCircuitos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCircuitos" name="reprovacaoCircuitos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMecanicaFluidos" name="aprovacaoMecanicaFluidos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMecanicaFluidos" name="reprovacaoMecanicaFluidos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Mecânica dos Sólidos</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Processos de Usinagem</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMecanicaSolidos" name="aprovacaoMecanicaSolidos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMecanicaSolidos" name="reprovacaoMecanicaSolidos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoProcessos" name="aprovacaoProcessos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoProcessos" name="reprovacaoProcessos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Transferência de Calor</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoTranferencia" name="aprovacaoTransferencia" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoTransferencia" name="reprovacaoTransferencia" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              
              <hr />
              
              <div class="row">
                  <h2 style="text-align: left;">4º ano</h2>
                  <div class="medium-6 columns">
                      <label>Engenharia de Manutenção</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Gestão de Inovação Tecnológica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoEngenhariaManu" name="aprovacaoEngenhariaManu" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoEngenhariaManu" name="reprovacaoEngenhariaManu" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoGestao" name="aprovacaoGestao" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoGestao" name="reprovacaoGestao" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Máquinas de Fluxo</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Máquinas Térmicas</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMaquinasFluxo" name="aprovacaoMaquinasFluxo" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMaquinasFluxo" name="reprovacaoMaquinasFluxo" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMaquinasTermicas" name="aprovacaoMaquinasTermicas" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMaquinasTermicas" name="reprovacaoMaquinasTermicas" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Mecanismos e Elementos de Máquinas</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Medidas Eletromecânicas e Metrologia e Controle de Processos</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMecanismos" name="aprovacaoMecanismos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMecanismos" name="reprovacaoMecanismos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMedidasEletro" name="aprovacaoMedidasEletro" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMedidasEletro" name="reprovacaoMedidasEletro" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>              
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Processos de Conformação e Fundição</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Projeto de Controladores Automáticos</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoProcessosConfor" name="aprovacaoProcessosConfor" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoProcessosConfor" name="reprovacaoProcessosConfor" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoProjetoContro" name="aprovacaoProjetoContro" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoProjetoContro" name="reprovacaoProjetoContro" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Refrigeração e Ar Condicionado</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Teoria de Estruturas de Materiais Compósitos</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoRefrigeracao" name="aprovacaoRefrigeracao" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoRefrigeracao" name="reprovacaoRefrigeracao" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoTeoriaEstru" name="aprovacaoTeoriaEstru" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoTeoriaEstru" name="reprovacaoTeoriaEstru" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Volumes Finitos</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoVolumesFinitos" name="aprovacaoVolumesFinitos" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoVolumesFinitos" name="reprovacaoVolumesFinitos" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              
              <hr />
              
              <div class="row">
                  <h2 style="text-align: left;">5º ano</h2>
                  <div class="medium-6 columns">
                      <label>Ciência, Tecnologia e Sociedade na Engenharia</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Confiabilidade</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoCiencia" name="aprovacaoCiencia" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoCiencia" name="reprovacaoCiencia" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoConfiabilidade" name="aprovacaoConfiabilidade" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoConfiabilidade" name="reprovacaoConfiabilidade" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Engenharia de Segurança, Legislação e Ética Profissional</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Engenharia Econômica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoSeguranca" name="aprovacaoSeguranca" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoSeguranca" name="reprovacaoSeguranca" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoEngEconomica" name="aprovacaoEngEconomica" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoEngEconomica" name="reprovacaoEngEconomica" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Engenharia: Geração de Ideias e Criatividade</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Estágio Supervisionado</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoIdeias" name="aprovacaoIdeias" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoIdeias" name="reprovacaoIdeias" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoEstagio" name="aprovacaoEstagio" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoEstagio" name="reprovacaoEstagio" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>              
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Fadiga</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Marketing Pessoal e Plano de Negócios em Engenharia</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoFadiga" name="aprovacaoFadiga" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoFadiga" name="reprovacaoFadiga" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoMarketing" name="aprovacaoMarketing" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoMarketing" name="reprovacaoMarketing" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Processos de Soldagem</label>
                  </div>
                  <div class="medium-6 columns">
                      <label>Técnicas de Redação e Metodologia Científica</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoSoldagem" name="aprovacaoSoldagem" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoSoldagem" name="reprovacaoSoldagem" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoRedacao" name="aprovacaoRedacao" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoRedacao" name="reprovacaoRedacao" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <label>Trabalho de Conclusão de Curso</label>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-6 columns">
                      <div class="row">                          
                           <div class="medium-6 columns">
                               <label>Aprovação
                                   <input id="aprovacaoTCC" name="aprovacaoTCC" type="text" />
                               </label>
                          </div>
                          <div class="medium-6 columns">
                               <label>Reprovação
                                   <input id="reprovacaoTCC" name="reprovacaoTCC" type="text" />
                               </label>
                          </div>                          
                      </div>
                  </div>
              </div>
              <div class="row">
                  <div class="medium-12 columns">
                    <input type="submit" value="Salvar" class="button" style="width: 150px;" />
                  </div>
              </div>
          </form>
          <div class="row">
               <div class="medium-12 columns">
                   <input type="button" value="Cancelar" class="alert button" style="width: 150px;" onclick="cancelar_cadastro();" />
               </div>
          </div>
          <hr />
        </div>
      </div>
    </div>
    <br/>
    <br/>
    <br/>
    <br/>
    <br/>
    <!--
    <script src="<%=caminho%>/js/vendor/jquery.js"></script>
    -->
    <script src="<%=caminho%>/js/vendor/what-input.js"></script>
    <script src="<%=caminho%>/js/vendor/foundation.js"></script>
    <script src="<%=caminho%>/js/app.js"></script>
    <script type="text/javascript">
	// For demo to fit into DataTables site builder...
	$('#example')
		.removeClass( 'display' )
		.addClass('tdisplay');
    </script>
  </body>
</html>