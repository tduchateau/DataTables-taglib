<%--
   DataTables Taglib
   http://tduchateau.github.com/DataTables-Taglib
   
   Copyright (c) 2012 Thibault Duchateau
   Licensed under the GNU GPLv2 license.
   
   Version : 1.0.3
 --%>
<%@ tag language="java" pageEncoding="ISO-8859-1" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ attribute name="property" required="false" type="java.lang.String" description="Name of the property in the bean contained in the data attribute." %>
<%@ attribute name="title" required="false" type="java.lang.String" description="Title of the column (th)." %>
<%@ attribute name="style" required="false" type="java.lang.String" description="HTML style attribute which will affect every td of the column." %>
<%@ attribute name="headerStyle" required="false" type="java.lang.String" description="HTML style attribute which will affect the th cell." %>
<%@ attribute name="cssClass" required="false" type="java.lang.String" description="CSS class which will affect every td of the column." %>
<%@ attribute name="headerCssClass" required="false" type="java.lang.String" description="CSS class which will affect the th cell." %>
<%@ attribute name="sortable" required="false" type="java.lang.Boolean" description="Enable or disable sorting on the column." %>
<%@ attribute name="filterable" required="false" type="java.lang.Boolean" description="Enable or disable filtering on the column." %>
<%@ attribute name="filterType" required="false" type="java.lang.String" description="If filterable is enabled, allows to change the filter type between select (default) and input." %>
<%@ attribute name="filterCssClass" required="false" type="java.lang.String" description="If filterable is enabled, allows to add CSS class to the filter field." %>
 
<c:set var="colCounter" value="${colCounter + 1}" scope="request" />

<%-- HTML parameters --%>
<c:if test="${htmlVarManagement}">
	<c:choose>
		<c:when test="${empty titles}">
			<c:set var="titles" value="${title}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:set var="titles" value="${titles}${delimitor}${title}" scope="request" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty styles}">
			<c:set var="styles" value="${style}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:set var="styles" value="${styles}${delimitor}${style}" scope="request" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty headerStyles}">
			<c:set var="headerStyles" value="${headerStyle}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:set var="headerStyles" value="${headerStyles}${delimitor}${headerStyle}" scope="request" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty headerCssClasses}">
			<c:set var="headerCssClasses" value="${headerCssClass}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:set var="headerCssClasses" value="${headerCssClasses}${delimitor}${headerCssClass}" scope="request" /> 
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty filterables}">
			<c:set var="filterables" value="${filterable eq null or filterable eq 'false' ? false : true}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${filterable eq null or filterable eq false}">
					<c:set var="filterables" value="${filterables}${delimitor}false" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="filterables" value="${filterables}${delimitor}${filterable}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty filterTypes}">
			<c:set var="filterTypes" value="${filterType eq null ? 'select' : filterType}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${filterType eq null}">
					<c:set var="filterTypes" value="${filterTypes}${delimitor}select" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="filterTypes" value="${filterTypes}${delimitor}${filterType}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty filterCssClasses}">
			<c:set var="filterCssClasses" value="${empty filterCssClass ? 'null' : filterCssClass}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${empty filterCssClass}">
					<c:set var="filterCssClasses" value="${filterCssClasses}${delimitor}null" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="filterCssClasses" value="${filterCssClasses}${delimitor}${filterCssClass}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:if>

<%-- Javascript parameters --%>
<c:if test="${sortManagement}">
	<c:choose>
		<c:when test="${empty sortables}">
			<c:set var="sortables" value="${sortable eq null or sortable eq 'false' ? false : true}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${sortable eq null or sortable eq false}">
					<c:set var="sortables" value="${sortables}${delimitor}false" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="sortables" value="${sortables}${delimitor}${sortable}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
</c:if>

<%-- EVALUATION DU CORPS DU TAG COLUMN --%>
<c:if test="${bodyManagement}">
	
	<c:choose>
		<c:when test="${empty cssClasses}">
			<c:set var="cssClasses" value="${cssClass}" scope="request" />
		</c:when>
		<c:otherwise>
			<c:set var="cssClasses" value="${cssClasses}${delimitor}${cssClass}" scope="request" />
		</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${empty properties}">
			<c:set var="properties" value="${property eq null ? 'null' : property}" scope="request" />
		</c:when>
		<c:otherwise>
			<%--<c:set var="properties" value="${property eq null ? properties + delimitor + 'null' : properties + delimitor + property}" scope="request" /> --%>
			<c:choose>
				<c:when test="${property eq null}">
					<c:set var="properties" value="${properties}${delimitor}null" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="properties" value="${properties}${delimitor}${property}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

	<%-- Evaluation du corps du tag column --%>
	<jsp:doBody var="tmpnom" scope="page"/>
		
	<c:choose>
		<c:when test="${empty contents}">
			<c:choose>
				<c:when test="${empty tmpnom}">
					<c:set var="contents" value="null" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="contents" value="${tmpnom}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${empty tmpnom}">
					<c:set var="contents" value="${contents}${delimitor}null" scope="request" />
				</c:when>
				<c:otherwise>
					<c:set var="contents" value="${contents}${delimitor}${tmpnom}" scope="request" />
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>

</c:if>