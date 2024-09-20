<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cPath" value="${pageContext.request.contextPath }"
	scope="application" />
<c:set value="${pageContext.request.userPrincipal }" var="autentication"
	scope="application" />
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<link rel="icon" type="image/svg+xml" href="${cPath }/resources/images/hotel_logo_favi.ico" />
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">

	<title>H Hotel</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
	<tiles:insertAttribute name="preScript" />

	<%--  <c:if test="${not empty message }">
		<script>
			alert("${message}");

		</script>
		<c:remove var="message" scope="session"/>
		</c:if> --%>

</head>

<body data-context-path="${cPath }">

	<div style="position: fixed; width: 50px; height: 50px; bottom: 0; right: 0; z-index: 10;">
		<a href="${cPath }" style="display: block; width: 50px; height: 50px"></a>
	</div>

	<div class="spinner-wrapper">
		<div class="spinner">
			<div class="bounce1"></div>
			<div class="bounce2"></div>
			<div class="bounce3"></div>
		</div>
	</div>
	<header>
		<!-- ======= Header ======= -->
		<tiles:insertAttribute name="header" />

	</header>
	<main>
		<tiles:insertAttribute name="contentPage" />

	</main>
	<!-- ======= Footer ======= -->
	<footer>
		<tiles:insertAttribute name="footer" />
	</footer>

	<tiles:insertAttribute name="postScript" />
</body>

</html>


