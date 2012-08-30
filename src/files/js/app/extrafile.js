var oTable_personTableExtraFile;	
var oTable_personTableExtraFileParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
     $('#personTableExtraFile_filter input').addClass('search-query');
     $('#personTableExtraFile_length select').addClass('span1');
  }
};

$(document).ready(function() {
  oTable_personTableExtraFile = $('#personTableExtraFile').dataTable(oTable_personTableExtraFileParams);
  SyntaxHighlighter.all();  
});

$.fn.dataTableExt.afnFiltering.push(
  function( oSettings, aData, iDataIndex ) {
     var cityChoice = $("#cityChoice").val();
     var city = aData[3];
     
     if ( cityChoice == "" || cityChoice == "All")
     {
        return true;
     }
     else if ( cityChoice == city)
     {
        return true;
     }
     return false;
  }
);

$("#cityChoice").change( function() { 
  oTable_personTableExtraFile.fnDraw(); 
});