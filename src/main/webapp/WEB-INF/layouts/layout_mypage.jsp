<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cPath" value="${pageContext.request.contextPath }" scope="application"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <link rel="icon" type="image/svg+xml" href="${cPath }/resources/images/hotel_logo_favi.ico" />

  <title>PMS</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <tiles:insertAttribute name="preScript" />

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Updated: Apr 20 2024 with Bootstrap v5.3.3
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <c:if test="${not empty message }">
	<script>
		alert("${message}");
	</script>
	<c:remove var="message" scope="session"/>
	</c:if>

</head>

<body data-context-path="${cPath }">

  <!-- ======= Header ======= -->
  <div class="wrapper">
	<tiles:insertAttribute name="sidebar"/>
	<div class="main-panel">
		<tiles:insertAttribute name="header" />


		<tiles:insertAttribute name="contentPage" />


	  <!-- ======= Footer ======= -->

	    <tiles:insertAttribute name="footer" />
	</div>

  </div>


  <tiles:insertAttribute name="postScript"/>
</body>

</html>


