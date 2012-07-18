var oTableReference;
var oTableReferenceParams = {
  "bInfo": false,
  "bPaginate": false,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
    $('#tableReference_filter input').addClass('search-query');
    $('#tableReference_length select').addClass('span1');
  } 
};

var oColumnReference;
var oColumnReferenceParams = {
  "bInfo": false,
  "bPaginate": false,
  "bLengthChange": false,
  "bFilter": true,
  "aaSorting": [],
  "fnInitComplete": function( oSettings ) {
    $('#columnReference_filter input').addClass('search-query');
    $('#columnReference_length select').addClass('span1');
  } 
};

$(document).ready(function() {
  oTableReference = $('#tableReference').dataTable(oTableReferenceParams);
  oColumnReference = $('#columnReference').dataTable(oColumnReferenceParams);
  $('#tabs a.last').tab('show');

  var hash = document.location.hash;
  var prefix = "tab_";
  if (hash) {
    var tab = hash.split("_")[0];
    var ref = hash.split("_")[1];
    $('.nav-tabs a[href=' + tab.replace(prefix, "") + ']').tab('show');
    $.scrollTo('#' + ref, 500, {offset: {top:-150} });
    var previousBgColor = $('#' + ref).css('backgroundColor');
    $('#' + ref).animate({backgroundColor: '#FBF418'}, 1800)
      .delay(1000)
      .animate({backgroundColor: previousBgColor}, 2000);
  } 
});