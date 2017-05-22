      //funçao de conversao para tabelas em xls
      function tableToXLS(idTable){
	    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
	    var textRange; var j=0;
	    tab = document.getElementById(idTable); // id of table
	    console.log(tab);
	    for(j = 0 ; j < tab.rows.length ; j++){
	        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
	    }

	    tab_text= tab_text+"</table>";
	    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
	    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
	    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params
	   
	     sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

	    return (sa);
	  }