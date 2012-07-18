var oPersonTable;
var oPersonTableParams = {
  "bInfo": true,
  "bPaginate": true,
  "bLengthChange": true,
  "bFilter": true,
  "aaSorting": [],
  "oLanguage": {
     "sProcessing":     "Traitement en cours...",
     "sLengthMenu":     "Afficher _MENU_ elements",
     "sZeroRecords":    "Aucun element a afficher",
     "sInfo":           "Affichage de l'element _START_ a _END_ sur _TOTAL_ elements",
     "sInfoEmpty":      "Affichage de l' �lement 0 a 0 sur 0 elements",
     "sInfoFiltered":   "(filtres de _MAX_ elements au total)",
     "sInfoPostFix":    "",
     "sSearch":         "Rechercher :",
     "sLoadingRecords": "Telechargement...",
     "sUrl":            "",
     "oPaginate": {
         "sFirst":    "Premier",
         "sPrevious": "Precedent",
         "sNext":     "Suivant",
         "sLast":     "Dernier"
     }
 },
"fnInitComplete": function( oSettings ) {
    $('#personTable_filter input').addClass('search-query');
    $('#personTable_length select').addClass('span1');
} 
};

$(document).ready(function() {
  oPersonTable = $('#personTable').dataTable(oPersonTableParams);
  SyntaxHighlighter.all();
});