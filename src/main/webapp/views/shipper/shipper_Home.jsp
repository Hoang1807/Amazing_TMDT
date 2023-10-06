<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/css/shipper/shipper_css/shipper_home.css">
	<script src="../js/shipper/shipper_home.js"> </script>
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
          <svg class="moon" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"
            stroke-width="2" width="24" height="24" viewBox="0 0 24 24">
            <defs></defs>
            <path d="M21 12.79A9 9 0 1111.21 3 7 7 0 0021 12.79z"></path>
          </svg>
        </button>
        <button class="profile-btn">
          <img src="https://assets.codepen.io/3306515/IMG_2025.jpg" />
          <span>Trương Thành Đạt</span>
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
            <span class="status-number">45</span>
            <span class="status-type">Đơn chưa nhận</span>
          </div>
          <div class="item-status">
            <span class="status-number">24</span>
            <span class="status-type">Đơn đang chờ</span>
          </div>
          <div class="item-status">
            <span class="status-number">62</span>
            <span class="status-type">Đơn đã giao</span>
          </div>
        </div>
        <div class="view-actions">
          <button class="view-btn list-view" title="List View">
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
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
            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none"
              stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
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
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #6ac23e;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #f2b780;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #a9ed81;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #f6aaaa;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #f5b6df;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #f7fa9d;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>
        <div class="project-box-wrapper">
          <div class="project-box" style="background-color: #a2e7f0;">
            <div class="project-box-header">
              <span>December 10, 2023</span>
              <div class="more-wrapper">
                <button class="project-btn-more">
                  <circle cx="12" cy="12" r="1" />
                  <circle cx="12" cy="5" r="1" />
                  <circle cx="12" cy="19" r="1" /></svg>
                </button>
              </div>
            </div>
            <div class="project-box-content-header">
              <p class="box-content-header">Tên hàng: Ram KingSton</p>
              <p class="box-content-subheader">Thông tin người nhận:</p>
            </div>
            <div class="box-progress-wrapper">
              <p class="">Tên: Đặng Thế Huy</p>
              <p class="">SĐT: 01235588698</p>
            </div>
            <div class="project-box-footer">
              <div class="participants">
                <p class="box-progress-header">Giao đến: 12, Ngô Tất Tố,.....</p>
              </div>
              <div class="days-left" style="color: #ff942e;">
                Nhận đơn
              </div>
            </div>
          </div>
        </div>

        

      </div>
    </div>
  </div>
</body>

</html>