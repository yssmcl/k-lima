<%-- 
    Document   : index.jsp
    Created on : 14/06/2017, 08:41:19
    Author     : Leandro Ensina
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="unioeste.geral.bo.Aluno"%>
<%@page import="unioeste.geral.manager.AlunoManager"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html class="no-js" lang="en" dir="ltr">
<%
	String caminho = request.getContextPath();
%>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutoria</title>
    
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

			<jsp:include page="#{caminho}/includes/menu.jsp"/>
                        
                        <!-- MAIN SECTION -->
			
                        <div class="row centralizado">
				<div class="medium-12 columns" style="text-align: center;">
					<h1>Mapa de Alunos</h1>
				</div>
			</div>
        		<div id="map" style="height: 600px;"></div>
			
        </div>			
    </div>
	</div>
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
    <script>
            var map;
            var cluster;

            function init() {
                map = new google.maps.Map(document.getElementById('map'), {
                    center: {lat: -33.8688, lng: 151.2195},
                    zoom: 13,
                    mapTypeId: 'roadmap'
                });

                cluster = new MarkerClusterer(map, [], {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});

                <%
                AlunoManager manager = new AlunoManager();

                String aluno = request.getParameter("aluno");
                String curso = request.getParameter("curso");
                String turno = request.getParameter("turno");
                String anoEntrada = request.getParameter("anoEntrada");
                String anoAtual = request.getParameter("anoAtual");
                String situacaoAtual = request.getParameter("situacaoAtual");

                System.out.println("================================"+aluno + " " +  curso + " " +  turno + " " +  anoEntrada + " " +  anoAtual + " " +  situacaoAtual);
                
                HashMap<String, Object> condicao = new HashMap<>();

                //recupera os alunos
                condicao.put("nome", "%"+aluno+"%");            
                condicao.put("anoEntrada", "%"+anoEntrada+"%");
                condicao.put("anoAtual", "%"+anoAtual+"%");
                condicao.put("situacaoAtual", "%"+situacaoAtual+"%");
                
                List<Aluno> alunos = manager.recuperarAlunosPorAtributos(condicao);
                
                for(Aluno a : alunos){
                    if (a.getLatitude() != null) {%>
                        cluster.addMarker(new google.maps.Marker({
                            map: map,
                            position: {lat:<%= a.getLatitude() %>, lng:<%= a.getLongitude() %>}
                        }));
                    <%}
                }%>
                    
                cluster.fitMapToMarkers();
            }

    </script>
    <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC9pNbJrgjHF7S7IXPXXZVGXPFVLDUr4S8&libraries=places&callback=init" async defer></script>
  </body>
</html>
