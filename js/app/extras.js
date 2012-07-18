var oPersonTableUsualOptionsParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
     $('#personTable_filter input').addClass('search-query');
     $('#personTable_length select').addClass('span1');
  }
};

var oTable_personTableExtraConf;    
var oTable_personTableExtraConfParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
     $('#personTableExtraConf_filter input').addClass('search-query');
     $('#personTableExtraConf_length select').addClass('span1');
  } 
};

$(document).ready(function() {
  $('.tabs a:last').tab('show');
  var oPersonTableUsualOptions = $('#personTableUsualOptions').dataTable(oPersonTableUsualOptionsParams);
  oTable_personTableExtraConf = $('#personTableExtraConf').dataTable(oTable_personTableExtraConfParams);
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
  oTable_personTableExtraConf.fnDraw(); 
});