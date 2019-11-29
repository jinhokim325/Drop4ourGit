<%@page import="kr.or.bit.dto.REAImage"%>
<%@page import="kr.or.bit.dto.REAUser"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap"
	rel="stylesheet">
<head>
<meta charset="utf-8">
<title>Drop 4our bit</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0d0c0a21e3bf46994d7f7a41d9cc729f&libraries=services"></script>

<jsp:include page="./css/css.jsp"></jsp:include>

<% 
	REAUser reaUser = (REAUser) request.getAttribute("reaUser");
	REAImage reaImg = (REAImage) request.getAttribute("reaImg");
	String userId = (String) session.getAttribute("userId");
	String type= "U02";
%>
<c:set var="reaUserData" value="<%=reaUser%>"></c:set>
<c:set var="reaImgData" value="<%=reaImg%>"></c:set>

<style type="text/css">
h2 {
	font-family: 'Jua', sans-serif;
}

input {
	height: 40px;
}

form-control {
	height: 40px;
}

.genderbox {
	padding: 1px;
	border: 1px solid #cccccc;
	height: 40px;
}

#tdId, #tdEmail, #tdPw, #tdCh {
	font-size: 13px;
	font-family: 'Jua', sans-serif;
	color: #ff6600;
}

.form-group input[type="text"], input[type="email"], input[type="password"]
	{
	border: 1px solid #e5e5e5;
}
/* Center the avatar image inside this container */
.imgcontainer {
	text-align: center;
}
/* Avatar image */
img.avatar {
	border-radius: 50%;
}
</style>

</head>

<body data-spy="scroll" data-target=".navbar-collapse">
	<div class="culmn">
		<!--Home page style-->

		<!-- Top jsp -->
		<nav
			class="navbar navbar-light navbar-expand-lg  navbar-fixed ivory no-background bootsnav">
			<jsp:include page="WEB-INF/include/REAUser_Top.jsp"></jsp:include>

			<!-- Side jsp -->
			<jsp:include page="WEB-INF/include/Side.jsp"></jsp:include>
		</nav>
		<!--Login Sections-->

		<section id="join" class="about roomy-100">
			<form action="UpdateREAUserService.d4b?type=<%=type %>" method="post" name="loginForm" enctype="multipart/form-data">
				<div class="container">
					<div class="about_content">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-6">
								<div class="signup-form">

									<br> <br> <br>
									<h2 style="text-align: center">공인중개사회원 정보수정</h2>
									<br>
									<hr>
									<div class="form-group" style="text-align: center">
										<img id="preview" src="./reaimg/${reaImgData.reaImgSaveName}"
											style="width: 200px" alt="Profile">
											<input type="hidden" name="reaId" value="${reaImgData.reaImgSaveName}">
											 <br> <br>
										&nbsp;&nbsp;&nbsp;&nbsp;<input type="file" name="filename" id="getfile" accept="image/*"><br>
									</div>
									<br> <br>
									<div class="form-group">
										<label>아이디 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<input type="text" class="form-control" name="reaId" id="reaId"
											required="required" readonly value="${reaUserData.reaId}">
									</div>
									<div class="form-group">
										<label>비밀번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdPw"></span></label>
										<input type="password" class="form-control" name="reaPwd"
											id="reaPwd" required="required" placeholder="영문+숫자 7자 이상">
									</div>
									<div class="form-group">
										<label>이름 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<input type="text" class="form-control" name="reaName" id="reaName"
											required="required" value="${reaUserData.reaName}">
									</div>
									<div class="form-group">
										<label>휴대폰번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
										<input type="text" class="form-control" name="reaPhoneNum"
											id="reaPhoneNum" required="required" placeholder="010-0000-0000" value="${reaUserData.reaPhoneNum}">
									</div>
									<div class="form-group">
										<label>사무소 이름 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<input type="text" class="form-control" name="officeName"
											id="officeName" required="required" value="${reaUserData.officeName}">
									</div>
									<div class="form-group">
										<label>주소 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdCh"></span></label>
										<div class="row">
											&nbsp;&nbsp;&nbsp;&nbsp; <input type="text"
												class="form-control" name="officeAddr" id="officeAddr"
												required="required" placeholder="주소" style="width: 72%;" value="${reaUserData.officeAddr}">
											&nbsp;&nbsp; <input type="button" onclick="searchAddr()"
												value="주소 검색"><br>
											<br>
										</div>
										<input type="text" class="form-control"
											name="officeDetailAddr" id="officeDetailAddr"
											required="required" placeholder="상세주소" style="width: 77%;" value="${reaUserData.officeDetailAddr}"><br>
										<div id="map" 
											style="width: 300px; height: 300px; margin-top: 10px; margin-left: 17%; display: none"></div>
									</div>
									<br>

									<div class="form-group">
										<label>사무소 전화번호 &nbsp;&nbsp;&nbsp;&nbsp;<span
											id="tdId"></span></label> <input type="text" class="form-control"
											name="officeHp" id="officeHp" required="required"
											placeholder="02-0000-0000" value="${reaUserData.officeHp}">
									</div>
									<div class="form-group">
										<label>사업자등록번호 &nbsp;&nbsp;&nbsp;&nbsp;<span id="tdId"></span></label>
										<input type="text" class="form-control" name="regNum"
											id="regNum" required="required" placeholder="000-00-00000" value="${reaUserData.regNum}">
									</div>
									<input type="hidden" id="userCode" name="userCode" value="U02">

									<div class="form-group">
										<div class="row">
											<div class="col-sm-6">
												<input type="submit"
													class="btn btn-primary btn-block btn-lg" value="수정 완료">
											</div>
											<div class="col-sm-6">
												<button type="reset"
													class="btn btn-primary btn-block btn-lg">취소</button>
											</div>
										</div>
									</div>
									<br> <br>

									<br> <br> <br>
								</div>
							</div>
						</div>
					</div>
					<!--End off row-->
				</div>
				<!--End off container -->
			</form>
		</section>

		<!-- scroll up-->
		<div class="scrollup">
			<a href="#"><i class="fa fa-chevron-up"></i></a>
		</div>
		<!-- End off scroll up -->
		<jsp:include page="WEB-INF/include/Bottom.jsp"></jsp:include>
	</div>

	<!-- JS includes -->
	<jsp:include page="./js/js.jsp"></jsp:include>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
			center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
			position : new daum.maps.LatLng(37.537187, 127.005476),
			map : map
		});

		function searchAddr() {
			new daum.Postcode({
				oncomplete : function(data) {
					var addr = data.address; // 최종 주소 변수

					// 주소 정보를 해당 필드에 넣는다.
					document.getElementById("officeAddr").value = addr;
					// 주소로 상세 정보를 검색
					geocoder.addressSearch(data.address, function(results,
							status) {
						// 정상적으로 검색이 완료됐으면
						if (status === daum.maps.services.Status.OK) {

							var result = results[0]; //첫번째 결과의 값을 활용

							// 해당 주소에 대한 좌표를 받아서
							var coords = new daum.maps.LatLng(result.y,
									result.x);
							// 지도를 보여준다.
							mapContainer.style.display = "block";
							map.relayout();
							// 지도 중심을 변경한다.
							map.setCenter(coords);
							// 마커를 결과값으로 받은 위치로 옮긴다.
							marker.setPosition(coords)
						}
					});
				}
			}).open();
		}
		
		var file = document.querySelector('#getfile');

		file.onchange = function () { 
		    var fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);

		    //로드 한 후
		    reader.onload = function  () {
		        document.querySelector('#preview').src = reader.result ;
		    }; 
		};
	</script>

</body>

</html>