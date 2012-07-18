var oTable_reference;
var oTable_referenceParams = {
  "bInfo": true,
  "bPaginate": false,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "bAutoWidth": true,
  "fnInitComplete": function( oSettings ) {
     $('#reference_filter input').addClass('search-query');
     $('#reference_length select').addClass('span1');
  }
};

var oTable_plugins;
var oTable_pluginsParams = {
  "bInfo": true,
  "bPaginate": false,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "bAutoWidth": true,
  "fnInitComplete": function( oSettings ) {
     $('#plugins_filter input').addClass('search-query');
     $('#plugins_length select').addClass('span1');
  }
};

var oTable_extras;
var oTable_extrasParams = {
  "bInfo": true,
  "bPaginate": false,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "bAutoWidth": true,
  "fnInitComplete": function( oSettings ) {
     $('#extras_filter input').addClass('search-query');
     $('#extras_length select').addClass('span1');
  }
};

$(document).ready(function() {
  oTable_reference = $('#reference').dataTable(oTable_referenceParams);
  oTable_plugins = $('#plugins').dataTable(oTable_pluginsParams);
  oTable_extras = $('#extras').dataTable(oTable_extrasParams);
  SyntaxHighlighter.all();
});