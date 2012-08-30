var oPersonTable;
var oPersonTableParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": true,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
  	$('#personTable_filter input').addClass('search-query');
  	$('#personTable_length select').addClass('span1');
  } 
};

$(document).ready(function() {
  oPersonTable = $('#personTable').dataTable(oPersonTableParams);
  SyntaxHighlighter.all();
});