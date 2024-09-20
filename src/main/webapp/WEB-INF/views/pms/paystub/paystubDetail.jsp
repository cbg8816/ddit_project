<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<div class="print-h1">
	<h1>급여명세서</h1>
</div>
<div class="pay-emp-info">
	<div class="d-flex">
		<p class="pay-title">사번</p>
		<span class="pay-line"></span>
		<p class="pay-cont">${paystub.emp.empId }</p>
	</div>
	<div class="d-flex">
		<p class="pay-title">급여지급일</p>
		<span class="pay-line"></span>
		<p class="pay-cont">${paystub.paystubPaydate }</p>
	</div>
	<div class="d-flex">
		<p class="pay-title">이름</p>
		<span class="pay-line"></span>
		<p class="pay-cont">${paystub.emp.empName }</p>
	</div>
	<div class="d-flex">
		<p class="pay-title">정산기간</p>
		<span class="pay-line"></span>
		<p class="pay-cont">${paystub.paystubStdate }~
			${paystub.paystubEnddate }</p>
	</div>
</div>
<div class="m-table-outer">
	<div class="m-table-inner">
		<table>
			<colgroup>
				<col width="20%" />
				<col width="" />
				<col width="20%" />
				<col width="" />
			</colgroup>
			<tr>
				<th>지급액</th>
				<th>금액(원)</th>
				<th>공제금액</th>
				<th>금액(원)</th>
			</tr>

			<tr>
				<th>기본금</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubNomal }" />원</td>
				<th>국민연금</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubNaPen }" />원</td>
			</tr>
			<tr>
				<th>상여금</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubBonus }" />원</td>
				<th>건강보험</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubHeIns }" />원</td>
			</tr>
			<tr>
				<th>야근수당</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubOvertime }" />원</td>
				<th>고용보험</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubEmpIns }" />원</td>

			</tr>
			<tr>
				<th></th>
				<td></td>
				<th>장기요양보험료</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubLongIns }" />원</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th>소득세</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubIncomeTax }" />원</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th>지방소득세</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubLoIncomeTax }" />원</td>
			</tr>
			<tr>
				<th>지급액</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubTotal }" />원</td>
				<th>공제금액</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.deductible }" />원</td>
			</tr>
			<tr>
				<th></th>
				<td></td>
				<th>실 수령액</th>
				<td class="td-number"><fmt:formatNumber type="number" value="${paystub.paystubRealtotal }" />원</td>
			</tr>
		</table>
	</div>
</div>
