var oPersonTableAddButton;    
var oPersonTableAddButtonParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": true,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
     $('#personTableAddButton_filter input').addClass('search-query');
     $('#personTableAddButton_length select').addClass('span1');
     $('<div style="float: right; margin-right: 10px;"><label><br /><a class="btn" href="features.html"><i class="icon-plus"></i> Add a person</a></label></div>').insertBefore('#personTableAddButton');
  } 
};

$(document).ready(function() {
  oPersonTableAddButton = $('#personTableAddButton').dataTable(oPersonTableAddButtonParams);
  SyntaxHighlighter.all();  
});