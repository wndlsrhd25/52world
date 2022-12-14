<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#makeBtn{
	font-size : 12px;
	cursor: pointer; 
	background-color: smokewhite; 
	border-radius: 5px; 
	border:1px solid #ddd;
	color : gray;
}
#makeBtn:hover{
	color:  rgb(34, 84, 52);
}
#editBtn{
	font-size : 12px;
	cursor: pointer; 
	background-color: smokewhite; 
	border-radius: 5px; 
	border:1px solid #ddd;
	color : gray;
}
#editBtn:hover{
	color:  rgb(34, 84, 52);
}
#deleteBtn{
	font-size : 12px;
	cursor: pointer; 
	background-color: smokewhite; 
	border-radius: 5px; 
	border:1px solid #ddd;
	color : gray;
}
#deleteBtn:hover{
	color:  rgb(34, 84, 52);
}
#container {
	padding: 0;
	width: 720px;
	box-sizing: border-box;
	margin: 10px auto;
	/* background-color: rgb(245, 245, 245); */
	
}
.galleryFolder {
	height: 300px;
	font-size: 18px;
	line-height : 30px;
}
h1 {
	PADDING-top: 10px;
	text-align: center;
}
#editPhoto {
	box-sizing: border-box;
	border: 1px solid #3e9fbe;
	height: 500px;
	margin-top: 30px;
	margin-left: 30px;
	margin-right: 20px;
	padding-top: 50px;
	padding-left: 30px;
	text-align: center;
}
.img .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 78%;
    color: #999999;
}
.img label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}
.img input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#update{
	font-size : 15px;
	font-weight : bold;
	cursor: pointer; 
	background-color: smokewhite; 
	border-radius: 5px; 
	border:1px solid #ddd;
	color : gray;
}
#update:hover{
	color:  rgb(34, 84, 52);
}
#backBtn{
	font-size : 15px;
	font-weight : bold;
	cursor: pointer; 
	background-color: smokewhite; 
	border-radius: 5px; 
	border:1px solid #ddd;
	color : gray;
}
#backBtn:hover{
	color:  rgb(34, 84, 52);
}
</style>

<!-- ?????? ?????? ?????? -->
<div class="left-container">
	<!-- ???????????? ?????? ?????? -->
	<div class="left-visits">
		<p>
			<fmt:parseNumber var="today" integerOnly="true"
				value="${Homepee.visitToday/1000000 }" />
			TODAY <span style="color: red">${today }</span> | TOTAL
			${Homepee.visitTotal }
		</p>
	</div>

	<!-- ?????? ???????????? -->
	<div class="left-box">
		<!-- ???????????? ?????? ????????? ??? -->
		<%-- <div style="height: 200px">
		<img class="profile-img" src="${homeOwner.profile }" alt="profile image" />
		<br />
		</div> --%>


		<!-- kbb) ??????????????? ?????? -->

		<div class="folderBtn" style="width: 300px;">
			<h3>
				<input id="makeBtn" type="button" value="????????????" onclick="makeGalleryFolder()">
				<input id="editBtn" type="button" value="????????????" onclick="updateGalleryFolder()">
				<input id="deleteBtn" type="button" value="????????????" onclick="deleteGalleryFolder()">
			</h3>

		</div>

		<div class="galleryFolder">
			<c:forEach var="item" items="${GFlist }">
				<div class="row date">
					<div class="makeFolder">
						<a id="makeF"
							href="galleryList.do?id=${ Homepee.homepeeId}&fId=${item.folderName}"><span>????
								${item.folderName }</span></a>

					</div>
				</div>

			</c:forEach>
			<br>
			<br>

		</div>



		<div class="profile" style="width:200px">
				<br /><br /><br /><br />
			<!-- c:if????????? ?????????????????? ?????? -->
			<c:choose>
				<c:when test="${member.id eq Homepee.homepeeId }">
					<a href="javascript:editProfile()"><span
						style="color: #3e9fbe; font-size: 8px">??? </span>EDIT</a>&nbsp
					<!-- ???????????? -->
					<a href="javascript:bffRequestList()"> <span
						style="color: #3e9fbe; font-size: 8px">??? </span>????????????
					</a>


				</c:when>
				<c:when test="${member.id ne Homepee.homepeeId }">

					<c:if test="${empty isFriend }">
						<a href="javascript:bffRequest()"> <span
							style="color: #3e9fbe; font-size: 8px">??? </span>????????????
						</a>&nbsp
					</c:if>
				</c:when>
			</c:choose>

			<!-- ???????????? -->
			<a href="#" onclick="searchMemberForm()"> <span
				style="color: #3e9fbe; font-size: 8px">??? </span>????????????
			</a>&nbsp

			<hr />



			<div class="profile-name">${homeOwner.name }</div>
			<br />
			<!-- ???????????? -->
			<a><span style="color: #3e9fbe; font-size: 8px">??? </span>????????????</a>
			<hr>
			<div class="friendsList">
				<form action="minihomepee.do" method="post">
					<select name="id" style="width: 150px">
						<optgroup label="????????????">
							<option value="${member.id }">??? ?????????</option>
							<c:forEach var="bff" items="${bffList }">
								<option value="${bff.reqId }">${bff.reqId }(${bff.reqName })</option>
							</c:forEach>
						</optgroup>
					</select> <input type="submit" value="??????">
				</form>
			</div>



		</div>
		<!-- ???????????? ????????? ??? -->
	</div>
</div>

<!-- ??????????????? ?????? -->
<div class="middle-container">
	<!-- ???????????? ?????? -->
	<div class="middle-title">
		<div class="middle-desc">${Homepee.name }</div>
		<div class="middle-url">https://52world.com/${homeOwner.id }</div>
	</div>
	<!-- ????????? ?????? ??????????????????-->
	<div class="middle-box">



		<c:set var="user" value="${member.id}" />
		<c:if test="${empty Homepee.homepeeId}">
			<c:redirect
				url="${pageContext.request.contextPath }/galleryUpdateForm.do"></c:redirect>
		</c:if>

		<div id="container">
			<h1>????????????????????? ?????????</h1>
			<form id="editPhoto" name="editPhoto" 
				action="${pageContext.request.contextPath }/galleryUpdate.do"
				method="post">

				<div class="title">
					<h3>
						<label for="pId">???????????????</label> <input type="text" name="poId"
							id="postId" readonly value="${postId }">
					</h3>

					<h3>
						<label for="title">??????</label> <input type="text" name="title"
							id="title" placeholder="????????? ??????????????????." value="${title}">
					</h3>
				</div>

				<div class="content">
					<h3>
						<label for="content">??????</label>
						<textarea name="content" id="content" placeholder="??????">${content}</textarea>
					</h3>
				</div>

				<div class="folder">
					<h3>
						<label for="folder">????????????</label> <select name="folder">

							<c:forEach var="item" items="${folderList }">
								<option value=${item.folderName }>${item.folderName }</option>
							</c:forEach>
						</select>
					</h3>
				</div>

				<!-- <div class="img">
					<h3>
						<label for="img">????????????</label> <input class="upload-name"
							value="????????????" placeholder="????????????" type="hidden"> 
							<input type="file"
							name="img" id="img" accept="image/*" onchange="preview(this)"
							readonly /> <img id="preview-img" />
					</h3>
				</div> -->

				<div class="btn">
					<!-- <input type="button" value="??????" onclick="editToGalleryList()"> -->
					<input id="update" type="button" value="??????" onclick="editCheck()"> 
					<input id="backBtn" type="button"
						value="????????????" onclick="backToGalleryList()">
				</div>
			</form>
		</div>

		<!-- 
   <script type="text/javascript">
      function editToGalleryList(vo.postId){
         location.href = "galleryList.do?postId="+postId;
      }
   </script>
 -->
		<script type="text/javascript">
			function backToGalleryList() {
				location.href = "galleryList.do?id=${homeOwner.id }";
			}
			
			function editCheck(){
		   		if(document.editPhoto.title.value==""){
		   			alert("?????? ??????????????????.");
		   			document.editPhoto.title.focus();
		   			return false;
		   		}
		   		else{
		   			
		   			
					let cf = confirm('???????????? ?????????????????????????')
					if(cf){
						alert("????????? ?????????????????????.");
						document.editPhoto.submit();
						
					} else {
						alert("????????? ?????????????????????")
					}
		   			
		   			
		   		}
		   		
		   	} 
			
		</script>

		<script type="text/javascript">
			function preview(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						document.querySelector("#preview-img").src = e.target.result;
						document.querySelector('#preview-img').width = 200;
						document.querySelector('#preview-img').height = 200;
					};
					reader.readAsDataURL(input.files[0]);
				} else {
					document.getElementById('preview').src = "";
				}
			}
		</script>

	</div>
</div>
<!-- ????????? ?????? ??? -->