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
  },
  "fnRowCallback": function( nRow, aData, iDisplayIndex, iDisplayIndexFull ) {
    $('td:eq(0)', nRow).css('border-color', 'red');
    $('td:eq(1)', nRow).css('border-color', 'green');
    $('td:eq(2)', nRow).css('border-color', 'black');
    $('td:eq(3)', nRow).css('border-color', 'blue');
    $('td:eq(4)', nRow).css('border-color', 'yellow');
    return nRow; 
  }
};

$(document).ready(function() {
  oTable_personTableExtraConf = $('#personTableExtraConf').dataTable(oTable_personTableExtraConfParams);
  SyntaxHighlighter.all();  
});