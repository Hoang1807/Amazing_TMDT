<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/shipper/shipper_css/shipper_home.css">
<script src="../js/shipper/shipper_home.js">
	
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
	rel="stylesheet">
</head>
<body>
	<div class="app-container">
		<div class="app-header">
			<div class="app-header-left">
				<span class="app-icon"></span>
				<p class="app-name">Bảng làm việc</p>
			</div>
			<div class="app-header-right">
				<button class="mode-switch" title="Switch Theme">
					<svg class="moon" fill="none" stroke="currentColor"
						stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
						width="24" height="24" viewBox="0 0 24 24">
            <defs></defs>
            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
          </svg>
				</button>
				<button class="profile-btn">
					<img src="${user.shipperAvatar }" /> <span>${user.shipperFullname }</span>
				</button>
			</div>
		</div>
		<div class="projects-section">
			<div class="projects-section-header">
				<p>Đơn hàng</p>
			</div>
			<div class="projects-section-line">
				<div class="projects-status">
				
				<div class="item-status">
						<span class="status-number">${ myInvoices}</span><span
							class="status-type">Đơn hàng bạn đã nhận</span>
					</div>
					<div class="item-status">
						<span class="status-number">${ Invoices}</span><span
							class="status-type">Đơn hàng đang có</span>
					</div>
					<div class="item-status">
						<span class="status-number">${ totalInvoices}</span> <span class="status-type">Tổng số đơn hệ thống</span>
					</div>
				</div>

				<div class="view-actions">
					<button class="view-btn list-view" title="List View">
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-list">
              <line x1="8" y1="6" x2="21" y2="6" />
              <line x1="8" y1="12" x2="21" y2="12" />
              <line x1="8" y1="18" x2="21" y2="18" />
              <line x1="3" y1="6" x2="3.01" y2="6" />
              <line x1="3" y1="12" x2="3.01" y2="12" />
              <line x1="3" y1="18" x2="3.01" y2="18" />
            </svg>
					</button>
					<button class="view-btn grid-view active" title="Grid View">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							viewBox="0 0 24 24" fill="none" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
							class="feather feather-grid">
              <rect x="3" y="3" width="7" height="7" />
              <rect x="14" y="3" width="7" height="7" />
              <rect x="14" y="14" width="7" height="7" />
              <rect x="3" y="14" width="7" height="7" />
            </svg>
					</button>
				</div>
			</div>
			<div class="project-boxes jsGridView">
				<c:forEach var="invoice" items="${invoices}">
					<div class="project-box-wrapper">

						<div class="project-box" style="background-color: #6ac23e;">
							<div class="project-box-header">
								<fmt:parseDate value=" ${invoice.invoiceDate} "
									pattern="yyyy-MM-dd HH:mm:ss.S" var="parsedDate" />
								<fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy HH:mm"
									var="formattedDate" />


								<span>Thời gian đặt hàng: ${formattedDate}</span>
								<div class="more-wrapper">
									<button class="project-btn-more">
										<circle cx="12" cy="12" r="1" />
										<circle cx="12" cy="5" r="1" />
										<circle cx="12" cy="19" r="1" />
										</svg>
									</button>
								</div>
							</div>
							<div class="project-box-content-header">
								<c:forEach var="detail" items="${invoice.invoiceDetails}">
									<p class="box-content-header">Tên hàng:
										${detail.type.product.productName}</p>
								</c:forEach>
								<p class="box-content-subheader">Thông tin người nhận</p>
							</div>
							<div class="box-progress-wrapper">

								<p class="h5">Tên: ${invoice.users.userFullname }</p>
								<p class="h5">SĐT: ${invoice.users.userPhone }</p>


							</div>
							<c:set var="sumPrice" value="0" />
							<c:forEach var="detail" items="${invoice.invoiceDetails}">
								<c:set var="bb"
									value="${sumPrice=sumPrice+detail.type.typePrice}" />
							</c:forEach>
							<p class="h5">
								Giá tiền:
								<fmt:formatNumber value="${sumPrice}" pattern="###,### VND" />
							</p>
							<p class="">Note: ${invoice.invoiceNote }</p>
							<div class="project-box-footer">
								<div class="participants">
									<p class="box-progress-header">Giao đến:
										${invoice.invoiceAddress}</p>
								</div>
								<c:choose>
									<c:when test="${invoice.invoiceShippingstatus == true}">
										<button
											class="days-left btn bg-secondary text-white col-4 fw-bold"
											disabled>Đã nhận</button>
									</c:when>
									<c:otherwise>
										<a class="days-left btn bg-success text-white col-4 fw-bold"
											href="/shipper/receive/${invoice.invoiceId}">Nhận đơn</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>

</html>