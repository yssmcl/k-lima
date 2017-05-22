function loadChartsOnMenu(){
	var ulCharts_cece = $("#graficos_cece");
	var ulCharts_cancelados = $("#graficos_cancelados");
	var ulCharts_cursando = $("#graficos_cursando");
	var ulCharts_situacao = $("#graficos_situacao");
	

	$(".chart_cece").each(function(){
		var idChart = "" + $(this).attr("id");
		var nomeChart = "" + $(this).attr("name");

		var a = $("<a></a>");
		a.text(nomeChart);
		a.attr("href","#" + idChart);

		var li = $("<li></li>");
		li.append(a);

		ulCharts_cece.append(li);
	});

	$(".chart_cancelados").each(function(){
		var idChart = "" + $(this).attr("id");
		var nomeChart = "" + $(this).attr("name");

		var a = $("<a></a>");
		a.text(nomeChart);
		a.attr("href","#" + idChart);

		var li = $("<li></li>");
		li.append(a);

		ulCharts_cancelados.append(li);
	});

		$(".chart_cursando").each(function(){
		var idChart = "" + $(this).attr("id");
		var nomeChart = "" + $(this).attr("name");

		var a = $("<a></a>");
		a.text(nomeChart);
		a.attr("href","#" + idChart);

		var li = $("<li></li>");
		li.append(a);

		ulCharts_cursando.append(li);
	});

	$(".chart_situacao").each(function(){
		var idChart = "" + $(this).attr("id");
		var nomeChart = "" + $(this).attr("name");

		var a = $("<a></a>");
		a.text(nomeChart);
		a.attr("href","#" + idChart);

		var li = $("<li></li>");
		li.append(a);

		ulCharts_situacao.append(li);
	});
	
}

function adjustGoogleFormHeight(){
	var h = $("#google_form").height();
    $("#google_form").height(h - 51);
}