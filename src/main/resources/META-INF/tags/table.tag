<%--
   DataTables Taglib
   http://tduchateau.github.com/DataTables-Taglib
   
   Copyright (c) 2012 Thibault Duchateau
   Licensed under the GPL license.
   
   Version : 1.0.0
 --%>
<%@ tag language="java" pageEncoding="ISO-8859-1" description="Creates a HTML table with JQuery and JQuery DataTables plugin."  %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="htmlTableId" required="true" type="java.lang.String" description="DOM id of the HTML table." %>
<%@ attribute name="data" required="true" rtexprvalue="true" type="java.util.Collection" description="Collection of data used to populate the table." %>
<%@ attribute name="dataObjectId" required="true" type="java.lang.String" rtexprvalue="false" description="Name of the object representing the current row." %>
<%@ attribute name="cssClass" required="false" type="java.lang.String" rtexprvalue="false" description="CSS class(es) of the HTML table." %>
<%@ attribute name="style" required="false" type="java.lang.String" rtexprvalue="false" description="CSS style of the HTML table." %>
<%@ attribute name="htmlRowIdPrefix" required="false" type="java.lang.String" description="String which is prepended to the htmlRowIdBase attribute." %>
<%@ attribute name="htmlRowIdBase" required="false" type="java.lang.String" description="Useful if you want each row has a DOM id. This attribute is evaluated as an object's property of the data attribute." %>
<%@ attribute name="htmlRowIdSufix" required="false" type="java.lang.String" description="String which is appended to the htmlRowIdBase attribute." %>
<%@ attribute name="info" required="false" rtexprvalue="true" type="java.lang.Boolean" description="Enable or disable the table information display. This shows information about the data that is currently visible on the page, including information about filtered data if that action is being performed." %>
<%@ attribute name="paginate" required="false" rtexprvalue="true" type="java.lang.Boolean" description="Enable or disable pagination." %>
<%@ attribute name="lengthPaginate" required="false" rtexprvalue="true" type="java.lang.String" description="If paginate is enabled, allows the end user to select the size of a formatted page from a select menu (sizes are 10, 25, 50 and 100)." %>
<%@ attribute name="filter" required="false" rtexprvalue="true" type="java.lang.Boolean" description="Enable or disable filtering of data." %>
<%@ attribute name="labels" required="false" rtexprvalue="true" type="java.lang.String" description="Base URL of an AJAX loaded file which contains all the labels used in tables. This attribute is the value for the sUrl DataTable parameter.Warning This attribute is evaluated with &lt;c:url&gt;" %>
<%@ attribute name="extraConf" required="false" rtexprvalue="true" type="java.lang.String" description="Base URL of an AJAX loaded DataTable configuration file which is merged with the default configuration (thanks to the JQuery $.extend function). Warning This attribute is evaluated with &lt;c:url&gt;" %>
<%@ attribute name="extraFile" required="false" rtexprvalue="true" type="java.lang.String" description="Base URL of an AJAX loaded Javascript file which is then executed (thanks to the JQuery $.getScript function).Warning This attribute is evaluated with &lt;c:url&gt;" %>
<%@ attribute name="extraFilterId" required="false" rtexprvalue="true" type="java.lang.String" description="" %>
<%@ attribute name="extraFilterPosition" required="false" rtexprvalue="true" type="java.lang.String" description="" %>
<%@ attribute name="addButton" required="false" rtexprvalue="true" type="java.lang.Boolean" description="Enable or disable an add link on the top of the table." %>
<%@ attribute name="addButtonUrl" required="false" rtexprvalue="true" type="java.lang.String" description="If addButton is enabled, used to fill href attribute of a link. Warning This attribute is evaluated with &lt;c:url&gt;" %>
<%@ attribute name="addButtonLabel" required="false" rtexprvalue="true" type="java.lang.String" description="If addButton is enabled, used to fill the link description." %>
<%@ attribute name="addButtonCssClass" required="false" rtexprvalue="true" type="java.lang.String" description="If addButton is enabled, appended to the CSS attribute of the link." %>

<%@ variable name-from-attribute="dataObjectId" alias="dataItem" variable-class="java.lang.Object" scope="NESTED" %>

<%-- ******************************************** --%>
<%-- Variables initialization --%>
<%-- ******************************************** --%>
<%-- Global ones --%>
<c:set var="delimitor" value="|" scope="request" />

<%-- Column ones --%>
<c:set var="titles" scope="request" />
<c:set var="styles" scope="request" />
<c:set var="headerStyles" scope="request" />
<c:set var="cssClasses" scope="request" />
<c:set var="headerCssClasses" scope="request" />
<c:set var="sortables" scope="request" />
<c:set var="filterables" scope="request" />
<c:set var="filterTypes" scope="request" />
<c:set var="filterCssClasses" scope="request" />

<%-- Table ones --%>
<c:set var="colCounter" value="0" scope="request" />
<c:set var="dataTableSortProperty" value="[]" />
<c:set var="customRowId" value="${not empty htmlRowIdPrefix or not empty htmlRowIdBase or not empty htmlRowIdSufix}" />
<c:set var="infoProperty" value="${empty info ? true : info}" />
<c:set var="paginateProperty" value="${empty paginate ? true : paginate}" />
<c:set var="lengthPaginateProperty" value="${empty lengthPaginate ? true : lengthPaginate}" />
<c:set var="filterProperty" value="${empty filter ? true : filter}" />
<c:set var="labelsProperty" value="${empty labels ? 'dataTables.default.french.txt' : labels}" />
<c:set var="extraConfProperty" value="${empty extraConf ? null : extraConf}" />
<c:set var="extraFileProperty" value="${empty extraFile ? null : extraFile}" />
<c:set var="extraFilterIdProperty" value="${empty extraFilterId ? null : extraFilterId}" />
<c:set var="extraFilterPositionProperty" value="${empty extraFilterPosition ? null : extraFilterPosition}" />
<c:set var="addButtonProperty" value="${empty addButton or addButton eq false ? false : true}" />
<c:set var="addButtonUrlProperty" value="${empty addButtonUrl ? '' : addButtonUrl}" />
<c:set var="addButtonLabelProperty" value="${empty addButtonLabel ? 'Ajouter' : addButtonLabel}" />
<c:set var="addButtonCssClassProperty" value="${empty addButtonCssClass ? 'btn' : addButtonCssClass}" />
<c:set var="cssClassProperty" value="${empty cssClass ? 'table table-striped table-bordered table-condensed' : cssClass}" />
<c:set var="cssStyleProperty" value="${empty style ? '' : style}" />

<%-- Evaluation du corps du tag table --%>
<c:set var="htmlVarManagement" value="true" scope="request" />
<jsp:doBody />
<c:set var="htmlVarManagement" value="false" scope="request" />

<c:set var="listStyle" value="${fn:split(styles, delimitor)}" scope="request" />
<c:set var="listHeaderStyle" value="${fn:split(headerStyles, delimitor)}" scope="request" />
<c:set var="listClass" value="${fn:split(cssClasses, delimitor)}" scope="request" />
<c:set var="listHeaderClass" value="${fn:split(headerCssClasses, delimitor)}" scope="request" />
<c:set var="listFilterable" value="${fn:split(filterables, delimitor)}" scope="request" />
<c:set var="listFilterType" value="${fn:split(filterTypes, delimitor)}" scope="request" />
<c:set var="listFilterCssClass" value="${fn:split(filterCssClasses, delimitor)}" scope="request" />

<table id="${htmlTableId}" class="${cssClassProperty}" style="${cssStyleProperty}">
<thead>
   <tr>
      <c:forTokens items="${titles}" delims="${delimitor}" var="title" varStatus="s">
         <c:set var="columnHeaderStyle" value="${listHeaderStyle[s.count - 1]}" />
         <c:set var="columnHeaderClass" value="${listHeaderClass[s.count - 1]}" />
         <c:choose>
            <c:when test="${not empty columnHeaderStyle and not empty columnHeaderClass}">
               <th class="${columnHeaderClass}" style="${columnHeaderStyle}"><c:out value="${title}" /></th>
            </c:when>
            <c:when test="${not empty columnHeaderStyle and empty columnHeaderClass}">
               <th style="${columnHeaderStyle}"><c:out value="${title}" /></th>
            </c:when>
            <c:when test="${empty columnHeaderStyle and not empty columnHeaderClass}">
               <th class="${columnHeaderClass}"><c:out value="${title}" /></th>
            </c:when>
            <c:otherwise>
               <th><c:out value="${title}" /></th>
            </c:otherwise>
         </c:choose>
      </c:forTokens>
   </tr>
</thead>
<tbody>
   <c:set var="bodyManagement" value="true" scope="request" />
   <c:set var="rowIdList" />
   <%-- Iteration sur les LIGNES --%>
   <c:forEach var="dataItem" items="${data}" varStatus="status">
      <c:set var="rowIdList" value="${rowIdList}${htmlRowIdPrefix}${dataItem[htmlRowIdBase]}${htmlRowIdSufix}${delimitor}" />
      <c:set var="properties" value="" scope="request" />
      <c:set var="contents" value="" scope="request" />
      <jsp:doBody />
      <c:set var="listProperty" value="${fn:split(properties, delimitor)}" scope="request" />
      <tr>
         <%-- Iteration sur les COLONNES --%>
         <c:forTokens var="body" items="${contents}" delims="${delimitor}" varStatus="s">
            <c:set var="columnContent" value="${listContent[status.count - 1]}" />
               <td>
                  <c:choose>
                     <c:when test="${listProperty[s.count - 1] eq 'null'}">
                        <c:out value="${body}" escapeXml="false" />
                     </c:when>
                     <c:otherwise>
                        <c:out value="${dataItem[listProperty[s.count - 1]]}" />
                     </c:otherwise>
                  </c:choose>
               </td>
         </c:forTokens>	
      </tr>
   </c:forEach>
   <c:set var="bodyManagement" value="false" scope="request" />
</tbody>
<c:if test="${fn:contains(filterables, 'true')}">
<tfoot>
   <tr>
      <c:forTokens var="filter" items="${filterables}" delims="${delimitor}" varStatus="s">		
         <c:set var="columnFilterType" value="${listFilterType[s.count - 1]}" />
         <c:set var="columnFilterCssClass" value="${listFilterCssClass[s.count - 1]}" />       
         <c:choose>
            <c:when test="${filter and columnFilterType eq 'select'}">
               <th><select class="${columnFilterCssClass}"></select></th>
            </c:when>
            <c:when test="${filter and columnFilterType eq 'input'}">
               <th><input type="text" value="" class="search-query ${columnFilterCssClass}"></th>
            </c:when>
            <c:otherwise>
               <th></th>
            </c:otherwise>
         </c:choose>
      </c:forTokens>		
   </tr>
</tfoot>
</c:if>
</table>

<%-- Evaluation du corps du tag table --%>
<c:set var="sortManagement" value="true" scope="request" />
<jsp:doBody />
<c:set var="sortManagement" value="false" scope="request" />

<c:if test="${not empty sortables}">
   <c:set var="dataTableSortProperty" value=",'aoColumns': [" />
   <c:set var="sortableColCounter" value="0" />
   <c:set var="it" value="1" />
   <c:forTokens var="sortable" items="${sortables}" delims="${delimitor}" varStatus="s">
      <c:choose>
         <%-- 1ere valeur de l'Array Javascript --%>
         <c:when test="${it eq 1}">
            <c:choose>
               <c:when test="${sortable eq true}">
                  <c:set var="dataTableSortProperty" value="${dataTableSortProperty}{'bSortable': true}" />
                  <c:set var="it" value="${it + 1}" />	
               </c:when>
               <c:otherwise>
                  <c:set var="dataTableSortProperty" value="${dataTableSortProperty}{'bSortable': false}" />
                  <c:set var="it" value="${it + 1}" />
               </c:otherwise>
            </c:choose>
         </c:when>
         <%-- Valeurs suivantes de l'Array Javascript --%>
         <c:otherwise>
            <c:choose>
               <c:when test="${sortable eq true}">
                  <c:set var="dataTableSortProperty" value="${dataTableSortProperty},{'bSortable': true}" />
                  <c:set var="it" value="${it + 1}" />	
               </c:when>
               <c:otherwise>
                  <c:set var="dataTableSortProperty" value="${dataTableSortProperty},{'bSortable': false}" />
                  <c:set var="it" value="${it + 1}" />
               </c:otherwise>
            </c:choose>
         </c:otherwise>
      </c:choose>
      <c:set var="sortableColCounter" value="${sortableColCounter + 1}" />
   </c:forTokens>
   <c:set var="dataTableSortProperty" value="${dataTableSortProperty}]" />
</c:if>

<script type="text/javascript">
   function fnCreateSelect( aData ){
      var r='<option value=""></option>', i, iLen=aData.length;
      for ( i=0 ; i<iLen ; i++ ){
         r += '<option value="'+aData[i]+'">'+aData[i]+'</option>';
      }
      return r;
   }

   var oTable_${htmlTableId};	
   var oTable_${htmlTableId}Params = {
      "bInfo": ${infoProperty},
      "bPaginate": ${paginateProperty},
      "bLengthChange": ${lengthPaginateProperty},
      "bFilter": ${filterProperty},
      "aaSorting": [],
      "fnInitComplete": function( oSettings ) {
          $('#${htmlTableId}_filter input').addClass('search-query');
          $('#${htmlTableId}_length select').addClass('span1');
          <c:if test="${addButtonProperty}">
             $('<div style="float: right; margin-right: 10px;"><label><br /><a class="${addButtonCssClassProperty}" href="${addButtonUrlProperty}"><i class="icon-plus"></i> ${addButtonLabelProperty}</a></label></div>').insertBefore('#${htmlTableId}');
          </c:if>
          <c:if test="${not empty extraFilterIdProperty}">
             $('<div style="float: right; margin-right: 10px;">').html($('#${extraFilterIdProperty}')).insertBefore('#${htmlTableId}');
          </c:if>
      }
      <c:if test="${labelsProperty}">
      ,"oLanguage": { 
          "sUrl": "<c:url value='${labelsProperty}' />" 
      }</c:if>${dataTableSortProperty} 
   };

	<c:if test="${not empty extraConfProperty}">
		$.ajax({
		  url: "<c:url value='${extraConfProperty}' />",
		  dataType: "text",
		  type: "GET",
		  async: false,
		  success: function(extraProperties, xhr, response) {
			  var myObject = eval('(' + extraProperties + ')');
			  $.extend(true, oTable_${htmlTableId}Params, myObject);
			},
		  error : function(jqXHR, textStatus, errorThrown) {
			  alert("textStatus = " + textStatus);
			  alert("errorThrown = " + errorThrown);
			}
		});
	</c:if>

	$(document).ready(function() {

		oTable_${htmlTableId} = $('#${htmlTableId}').dataTable(oTable_${htmlTableId}Params);
		
		<c:if test="${not empty extraFileProperty}">
			$.getScript("<c:url value='${extraFileProperty}' />");
		</c:if>  
			
		<c:if test="${fn:contains(filterables, true)}">
			$("tfoot th").each( function (index, dom) {
		        if($('input', this).length > 0){
		        	$('input', this).keyup(function(){
						oTable_${htmlTableId}.fnFilter( this.value, index);
		        	});
				}
		    });

			/* Add a select menu for each TH element in the table footer */
		    $("tfoot th").each( function ( i ) {
			    if($(this).find('select').length > 0){
				    $(this).find('select').html(fnCreateSelect( oTable_${htmlTableId}.fnGetColumnData(i) ));
			    	$(this).find('select').change( function () {
			    		oTable_${htmlTableId}.fnFilter( $(this).val(), i );
			        });
			    }
		    } );
	    </c:if>

	    <c:if test="${customRowId}">
			var ${htmlTableId}rowIdArray = [];
			<c:forTokens var="rowId" items="${rowIdList}" delims="${delimitor}">
				${htmlTableId}rowIdArray.push('${rowId}');
			</c:forTokens>
			$('#${htmlTableId} tr').each(function(index, dom){
				$(this).attr('id', ${htmlTableId}rowIdArray[index - 1]);
			});
		</c:if>
	});

   <c:if test="${fn:contains(filterables, 'true')}">
   (function($) {
      /*
       * Function: fnGetColumnData
       * Purpose:  Return an array of table values from a particular column.
       * Returns:  array string: 1d data array 
       * Inputs:   object:oSettings - dataTable settings object. This is always the last argument past to the function
       *           int:iColumn - the id of the column to extract the data from
       *           bool:bUnique - optional - if set to false duplicated values are not filtered out
       *           bool:bFiltered - optional - if set to false all the table data is used (not only the filtered)
       *           bool:bIgnoreEmpty - optional - if set to false empty values are not filtered from the result array
       * Author:   Benedikt Forchhammer <b.forchhammer /AT\ mind2.de>
       */
      $.fn.dataTableExt.oApi.fnGetColumnData = function ( oSettings, iColumn, bUnique, bFiltered, bIgnoreEmpty ) {
          // check that we have a column id
          if ( typeof iColumn == "undefined" ) return new Array();
           
          // by default we only wany unique data
          if ( typeof bUnique == "undefined" ) bUnique = true;
           
          // by default we do want to only look at filtered data
          if ( typeof bFiltered == "undefined" ) bFiltered = true;
           
          // by default we do not wany to include empty values
          if ( typeof bIgnoreEmpty == "undefined" ) bIgnoreEmpty = true;
           
          // list of rows which we're going to loop through
          var aiRows;
           
          // use only filtered rows
          if (bFiltered == true) aiRows = oSettings.aiDisplay; 
          // use all rows
          else aiRows = oSettings.aiDisplayMaster; // all row numbers
       
          // set up data array    
          var asResultData = new Array();
           
          for (var i=0,c=aiRows.length; i<c; i++) {
              iRow = aiRows[i];
              var sValue = this.fnGetData(iRow, iColumn);
               
              // ignore empty values?
              if (bIgnoreEmpty == true && sValue.length == 0) continue;
       
              // ignore unique values?
              else if (bUnique == true && jQuery.inArray(sValue, asResultData) > -1) continue;
               
              // else push the value onto the result data array
              else asResultData.push(sValue);
          }
           
          return asResultData;
   }}(jQuery));
   </c:if>
</script>