<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<table>
	<colgroup>
		<col width="30%" />
		<col width="" />
	</colgroup>
	<tr>
		<th>이름</th>
		<td>${att.emp.empName }</td>
	</tr>
	<tr>
		<th>총 연차 개수</th>
		<td>${att.atteAllAnLeave }개</td>
	</tr>
	<tr>
		<th>남은 연차 개수</th>
		<td>${att.atteLeftAnLeave }개</td>
	</tr>
	<tr>
		<th>사용 연차 개수</th>
		<td>${att.atteUseAnLeave }개</td>
	</tr>
</table>


<p class="att-table-title">사용 내역</p>
<table>
	<tr>
		<th>내용</th>
		<th>시작일</th>
		<th>종료일</th>
		<th>기간</th>
	</tr>
	<c:set var="attDetailList" value="${att.attDetailList }" />
	<c:forEach items="${attDetailList }" var="attDetail">
		<c:if test="${not empty attDetail.adId  }">
			<tr>
				<td>${attDetail.adContent }</td>
				<td>${attDetail.adStrDate }</td>
				<td>${attDetail.adEndDay }</td>
				<td>
					<c:set var="startDate" value="${attDetail.adStrDate }" />
					<c:set var="endDate" value="${attDetail.adEndDay }" />

					<fmt:parseDate value="${startDate}" pattern="yyyy-MM-dd" var="startDateObj" />
					<fmt:parseDate value="${endDate}" pattern="yyyy-MM-dd" var="endDateObj" />

					<c:set var="diffInMilli" value="${endDateObj.time - startDateObj.time}" />
					<c:set var="diffInDays" value="${diffInMilli / (1000 * 60 * 60 * 24)}" />

<%-- 					시작일: ${startDate}<br> --%>
<%-- 					마감일: ${endDate}<br> --%>
<%-- 					기간: ${diffInDays + 1}일 --%>
					<fmt:formatNumber value="${diffInDays + 1}" pattern="0" />일
				</td>

			</tr>
		</c:if>
		<c:if test="${empty attDetail.adId  }">
			<tr>
				<td colspan="4">사용연차가 없음</td>
			</tr>
		</c:if>
	</c:forEach>
</table>



