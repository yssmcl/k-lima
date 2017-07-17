<%-- 
    Document   : upload_csv_evasao
    Created on : 17/07/2017, 08:12:07
    Author     : Leandro Ensina
--%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
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
    <title>K-Lima</title>
    
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.css"/> 
    <script type="text/javascript" src="https://cdn.datatables.net/r/zf-5.5.2/jqc-1.11.3,dt-1.10.8/datatables.min.js"></script>
    <script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
            $('#example').dataTable();
	} );
    </script>
    <link rel="stylesheet" href="<%=caminho%>/css/foundation.css">    
    <link rel="stylesheet" href="<%=caminho%>/css/app.css">
    
  </head>
  <body>
    
    <div class="off-canvas-wrapper">
      <div class="off-canvas-wrapper-inner" data-off-canvas-wrapper> <!-- Essa div e a de cima servem para fazer a parte do menu lateral -->

        <div class="off-canvas position-left" id="mobile-menu" data-off-canvas>
          <div class="menu-mobile-opcao"><a href="index.jsp">Home</a></div>
          <div class="menu-mobile-opcao"><a href="pesquisar_tabela.jsp">Tabela</a></div>
          <div class="menu-mobile-opcao">Gráficos</div>
          <ul>
            <li><a href="#">Estáticos</a></li>
            <li><a href="#">Dinâmicos</a></li>
          </ul>
          <div class="menu-mobile-opcao"><a href="#">Atualizar dados</a></div>
          <div class="menu-mobile-opcao"><a href="#">Ajuda</a></div>
        </div>

        <!-- MOBILE NAVIGATION -->
        
        <div class="off-canvas-content" data-off-canvas-content>
          <div class="title-bar show-for-small-only">
            <div class="title-bar-left">
              <button class="menu-icon" type="button" data-open="mobile-menu"></button>
              <span class="title-bar-title">MENU</span>
            </div>
          </div>
        
          <!-- DESKTOP NAVIGATION -->
          <nav class="top-bar nav-desktop hide-for-small-only">
           <div class="wrap">
              <div class="top-bar-left">
                <ul class="dropdown menu menu-desktop" data-dropdown-menu>
                  <li>
                    <a href="index.jsp">Home</a>
                  </li>                  
                  <li>
                    <a href="pesquisar_tabela.jsp">Tabela</a>
                  </li>
                  <li>
                    <a href="#">Gráficos</a>
                    <ul class="menu">
                      <li><a href="#">Estáticos</a></li>
                      <li><a href="#">Dinâmicos</a></li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">Atualizar dados</a>
                  </li>
                  <li>
                    <a href="#">Ajuda</a>
                  </li>
                </ul>
              </div>
            </div>
          </nav>

          <!-- MAIN SECTION -->
          <div class="row">
            <br />
            <h1>Importar dados de Evasão</h1>
            <form method="post" action="UploadServlet" enctype="multipart/form-data">
              Selecione o arquivo CSV para importação:
              <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
              <input type="submit" value="Upload" />
            </form>
              
          </div>
                    
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
