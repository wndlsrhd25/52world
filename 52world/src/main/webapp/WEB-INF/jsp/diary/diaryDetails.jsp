<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.dev.common.calendar"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html lang="ko">

<head>
   <meta charset="UTF-8" />
   <title>guestBook</title>
   <style>
      .mybox {
         box-sizing: border-box;
      }
      .calendarinner {
         background-color: rgb(62, 159, 190);
         box-sizing: border-box;
         padding: 5px 5px;
         border-radius: 5px;
      }
     table {
         margin: 8px auto;
         background-color: white;
         height: 150px;
         border-collapse: separate;
         border-radius: 5px;
         padding: 10px;
      }
      #calTr {
         background-color: rgb(137, 137, 137);
      }
      ==============================#insertButton {
         display: inline-block;
         text-align: right;
         margin: 20px 50px 25px 20px;
      }
      .diary_post_box {
         width: 700px;
         margin: 0 auto;
         overflow: hidden;
      }
      h3 {
         display: block;
         font-size: 1.17em;
         margin-block-start: 1em;
         margin-block-end: 1em;
         margin-inline-start: 50px;
         margin-inline-end: 0px;
         font-weight: bold;
         float: left;
      }
      .diary_post {
         margin: 0px;
         border: 1px solid rgb(139, 183, 197);
         border-radius: 2px;
         margin: 0px 0px 30px 0px;
         padding-bottom: 20px;
      }
      .diary_header {
         color: rgb(62, 159, 190);
         font-weight: bolder;
         border-radius: 2px;
         margin: 20px;
         padding: 20px 0px 10px 20px;
         font-size: 18px;
         font-family: 'Do Hyeon', sans-serif;
      }
      .diary_title {
         margin: 20px;
         text-align: center;
         font-weight: bolder;
         color: rgb(80, 80, 80);
      }
      .diary_content {
         margin: 20px;
         text-align: center;
         color: rgb(104, 104, 104);
      }
      .diary_text {
         text-align: center;
         font-size: 20px;
         font-family: 'Dongle', sans-serif;
      }
      
      #dCommentTable {
         padding: 0px;
         width : 100%;
         margin : 0 auto;
      }
      #dCommentTable.td {
         margin:0;
         width :30%;
         
      }      
      #dCommentTable.td:last-child {
         margin:0;
         width :50px;
         
      }
      
      
      #pagination {
         text-align: center;
      }
      .diary_post td {
         width: 150px;
      }
      #nav {
         width: 680px;
         margin: 0 auto;
         padding: 10px;
         text-align: right;
         float: right;
      }
      #nav ul {
         padding: 0;
         margin: 0;
      }
      #nav li {
         display: inline;
         padding: 10px;
         font-size: 17px;
      }
      .sub-box-Button {
         float: right;
         margin-left: 10px;
      }
      a:link {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:visited {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:hover {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:active {
         color: black;
         background-color: transparent;
         text-decoration: none;
      }
      a:hover:not(.active) {
         background-color: none;
      }
      .center {
  text-align: center;
}
.pagination {
  display: inline-block;
}
#dCommenttable {
    margin: 0 auto;
    background-color: white;
    height: 150px;
    border-collapse: separate;
    border-radius: 1px;
    padding: 0px 0px;
}
.pagination a {
  color: black;
  float: left;
  padding: 3px 10px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid rgb(141, 141, 141);
  margin: 0 4px;
}
.pagination a.active {
  background-color: rgb(141, 141, 141);
  color: white;
  border: 1px solid rgb(141, 141, 141);
}
.pagination a:hover:not(.active) {background-color: #ddd;}
   </style>

   <style type="text/css">
      /* ???????????????  */
      tr {
         height: 0px;
      }
      td {
         width: 0px;
         text-align: center;
         font-size: 10pt;
         font-family: 'Dongle', sans-serif;
      }
      /* ????????? ????????? */
      th#title {
         font-size: 10pt;
         font-weight: bold;
         color: #000000;
         font-family: 'Dongle', sans-serif;
      }
      /* ?????? ????????? */
      td.sunday {
         text-align: center;
         font-weight: bold;
         color: rgb(255, 153, 0);
         font-family: 'Dongle', sans-serif;
      }
      td.saturday {
         text-align: center;
         font-weight: bold;
         color: grey;
         font-family: 'Dongle', sans-serif;
      }
      td.etcday {
         text-align: center;
         font-weight: bold;
         color: grey;
         font-family: 'Dongle', sans-serif;
      }
      /* ?????? ????????? */
      td.sun {
         text-align: center;
         font-size: 10pt;
         color: rgb(255, 153, 0);
         font-family: 'Dongle', sans-serif;
         vertical-align: top;
      }
      td.sat {
         text-align: center;
         font-size: 10pt;
         color: grey;
         font-family: 'Dongle', sans-serif;
         vertical-align: top;
      }
      td.etc {
         text-align: center;
         font-size: 10pt;
         color: grey;
         font-family: 'Dongle', sans-serif;
         vertical-align: top;
      }
      td.redbefore {
         text-align: center;
         font-size: 0pt;
         color: rgb(255, 255, 255);
         font-family: 'Dongle', sans-serif;
         vertical-align: top;
      }
      td.before {
         text-align: center;
         font-size: 0pt;
         color: rgb(255, 255, 255);
         font-family: 'Dongle', sans-serif;
         vertical-align: top;
      }
   </style>
</head>
<!-- ?????? ?????? ?????? -->
<div class="left-container">

   <!-- ???????????? ?????? ?????? -->
   <div class="left-visits">
      <p>
         <fmt:parseNumber var="today" integerOnly="true" value="${Homepee.visitToday/1000000 }" />
         TODAY <span style="color: red">${today }</span> | TOTAL
         ${Homepee.visitTotal }
      </p>
   </div>

   <!-- ?????? ???????????? -->
   <div class="left-box">
      <br> <span style="color: rgb(104, 104, 104)">Calendar</span>
      <hr style="background-color: rgb(238, 238, 238); height: 3px;">
      <!-- ???????????? ?????? ????????? ?????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? -->
      <%
      // ????????? ???????????? ???, ??? ????????????
      Date date = new Date();
      int year = date.getYear() + 1900;
      int month = date.getMonth() + 1;
      //   ???????????? ????????????   
      try {
         year = Integer.parseInt(request.getParameter("year"));
         month = Integer.parseInt(request.getParameter("month"));
         if (month >= 13) {
            year++;
            month = 1;
         } else if (month <= 0) {
            year--;
            month = 12;
         }
      } catch (Exception e) {
      }
      %>
      <!-- ?????? ????????? -->
      <div class="calendarBox" style="width:200px">
         <div class="calendarinner">
            <table class="calTable">
               <div id="calTr">
                  <tr>
                     <!-- ????????? ?????? ????????? -->
                     <th>
                        <%-- <a href ="?year=<%=year%>&month=<%month-1%>">?????? ???</a> --%>
                        <input type="button" value="<" style="
                        width:20px;height:20px;border:0.5px;border-style:
                        none;border-radius: 2px;" onclick="location.href='?year=<%=year%>&month=<%=month - 1%>'">
                     </th>

                     <!-- ?????? ????????? -->
                     <th id="title" colspan="5"><%=year%>??? <%=month%>???</th>

                     <!-- ????????? ?????? ????????? -->
                     <th>
                        <%-- <a href ="?year=<%=year%>&month=<%month+1%>">?????? ???</a> --%>
                        <input type="button" value=">"
                           style="width: 20px; height: 20px; border: 0.5px; border-style: none; border-radius: 2px; margin: auto;"
                           onclick="location.href='?year=<%=year%>&month=<%=month + 1%>'">

                     </th>
                  </tr>
               </div>
               <!-- ?????? ????????? ???????????????(???, ???,???????????? ?????? ????????? ???????????? ???????????????) -->
               <tr>
                  <td class="sunday">S</td>
                  <td class="etcday">M</td>
                  <td class="etcday">T</td>
                  <td class="etcday">W</td>
                  <td class="etcday">T</td>
                  <td class="etcday">F</td>
                  <td class="saturday">S</td>
               </tr>


               <!-- ?????? ?????? ?????? -->
               <tr>
                  <%
                  //   1?????? ????????? ????????????(?????? ????????? ????????? ????????? ???????????????)
                  int first = calendar.weekDay(year, month, 1);
                  //   1?????? ????????? ?????? ?????? ????????? ????????? ???????????? ?????????????????? ??? ???????????? ???????????? ????????????.
                  int start = 0;
                  start = month == 1 ? calendar.lastDay(year - 1, 12) - first : calendar.lastDay(year, month - 1) - first;
                  //   1?????? ????????? ????????? ????????? ?????? 1?????? ???????????? ???????????? ?????????????????? ????????????.
                  for (int i = 1; i <= first; i++) {
                     if (i == 1) {
                        /* ?????????(?????????)??? ??????????????? ?????? ????????????  */
                        out.println("<td class = 'redbefore'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
                     } else {
                        out.println("<td class = 'before'>" + (month == 1 ? 12 : month - 1) + "/" + ++start + "</td>");
                     }
                  }
                  /* 1????????? ????????? ????????? ?????? ????????? ???????????? ???????????? ????????? ?????? */
                  for (int i = 1; i <= calendar.lastDay(year, month); i++) {
                     /* ???????????? ?????? ????????? ??????????????? td??? class ?????????????????? */
                     switch (calendar.weekDay(year, month, i)) {
                        case 0 :
                     out.println("<td class ='sun'>" + i + "</td>");
                     break;
                        case 6 :
                     out.println("<td class ='sat'>" + i + "</td>");
                     break;
                        default :
                     out.println("<td class ='etc'>" + i + "</td>");
                     break;
                     }
                     /* ????????? ??????(i)??? ??????????????? ????????? ????????? ???????????? ?????? ???????????? */
                     if (calendar.weekDay(year, month, i) == 6 && i != calendar.lastDay(year, month)) {
                        out.println("</tr><tr>");
                     }
                  }
                  if (calendar.weekDay(year, month, calendar.lastDay(year, month)) != 6) {
                     for (int i = calendar.weekDay(year, month, calendar.lastDay(year, month)) + 1; i < 7; i++) {
                        out.println("<td></td>");
                     }
                  }
                  %>
               </tr>
            </table>
         </div>
      </div>
      <div class="profile">
         <br /><br /><br /><br /><br /><br /><br /><br />
         <!-- c:if????????? ?????????????????? ?????? -->
         <c:choose>
            <c:when test="${member.id eq Homepee.homepeeId }">

               <!-- ???????????? -->
               <a href="javascript:bffRequestList()"> <span style="color: #3e9fbe; font-size: 8px">??? </span>????????????
               </a>


            </c:when>
            <c:when test="${member.id ne Homepee.homepeeId }">

               <c:if test="${empty isFriend }">
                  <a href="javascript:bffRequest()"> <span style="color: #3e9fbe; font-size: 8px">??? </span>????????????
                  </a>&nbsp
               </c:if>
            </c:when>
         </c:choose>

         <!-- ???????????? -->
         <a href="#" onclick="searchMemberForm()"> <span style="color: #3e9fbe; font-size: 8px">??? </span>????????????
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



      <!-- ???????????? ????????? ??? ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????-->
   </div>
</div>

<!-- ??????????????? ?????? -->
<div class="middle-container">



   <!-- ???????????? ?????? -->
   <div class="middle-title">
      <div class="middle-desc">${Homepee.name }</div>
      <div class="middle-url">https://52world.com/${homeOwner.id }</div>
   </div>
   <!-- ???????????? ?????? ??????????????????-->
   <div class="middle-box">
      <div id="mybox">
         <div id="diaryMenu">
         
         <%
         String Date = new java.text.SimpleDateFormat("yyyy. MM. dd").format(new java.util.Date());
         String Today = new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());         
         %>
         
        <c:set value="<%=Date%>" var="today" />
        <c:if test="${parameter.END_DATE >= today}">
         <p>???????????? ?????? ${today}</p>
       </c:if>    
            <h3>????????????</h3>
         </div>
         <c:choose>
            <c:when test="${member.id eq Homepee.homepeeId }">
               <div id="insertButton" style="float: right; margin: 20px 50px 25px 20px;">
                  <a href="${pageContext.request.contextPath }/writeDiaryForm.do">
                     <input type="button" value="??? ??? ??????">
                  </a>
               </div>
            </c:when>
         </c:choose>
         <div class="diary_post_box">


            <c:forEach var="vo" items="${commentList }">
               <div class="diary_post">
                  <div id="nav">
                     <ul>
                        <c:choose>

                           <c:when test="${vo.writer eq member.id}">

                              <li><a href="${pageContext.request.contextPath }/diaryUpdateForm.do?postId=${vo.postId}&title=${vo.title}&content=${vo.content}"
                                    style='cursor: pointer;' id="update-button">??????</a></li>
                              <li><a href="javascript:deleteDiary(${vo.postId })" style='cursor: pointer;'
                                    id="delete-button" data-value="${vo.postId }">??????</a></li>

                           </c:when>


                           <c:when test="${member.id eq homeOwner.id }">
                              <li><a href="javascript:deleteDiary(${vo.postId })" style='cursor: pointer;'
                                    id="delete-button" data-value="${vo.postId }">??????</a></li>
                           </c:when>
                        </c:choose>
                     </ul>
                  </div>
                  <div class="diary_header">${vo.createDate }</div>
                  <div class="diary_contentbox">
                     <div class="diary_title">${vo.title }</div>
                     <div class="diary_content" style="white-space:pre;">${vo.content}</div>
                  </div>

                  <!-- ???????????? ?????? ????????? -->
                  <form name="addComForm" action="addDiaryComment.do" method="post"
                     style="text-align: center; margin: 80px 0px 20px 0px">
                     <input type="text" name="content" style="width: 600px;">
                     <input type="hidden" name="postId" value="${vo.postId }">
                     <input type="hidden" name="writer" value="${member.id }">
                     <input type="button" class="addComm" value="????????????">

                  </form>

                  <details>
                     <summary data-cnt="${vo.cnt }" style="text-align: left; color: grey; font-size: 13px; padding-left: 50px">
                        comment(${vo.cnt})
                     </summary>
                     <br>
                     <hr>
                     <br>

                     <!-- ???????????? ?????? ????????? ??? -->
                     <table id="dCommentTable">
                        <tbody id="dCommentList${vo.postId }">
                           <c:forEach var="comment" items="${vo.commentList }">
                              <c:if test="${vo.postId eq comment.postId }">
                                 <tr>
                                    <td>${comment.content }</td>
                                    <td>${comment.writer }</td>
                                    <td>${comment.createDate }</td>

                                    <c:if test="${(member.id eq comment.writer) || (member.id eq homeOwner.id)}">
                                       <td><a onclick="deleteCallBack()" style='cursor: pointer;' class="delete-button"
                                             data-value="${comment.commId }">??????</a></td>
                                    </c:if>

                                 </tr>
                              </c:if>
                           </c:forEach>
                        </tbody>
                     </table>

                  </details>
               </div>
            </c:forEach>




         </div>

         <div class="center">
            <div class="pagination">
               <c:if test="${pageInfo.prev }">
                  <a href="diaryDetails.do?pageNum=${pageInfo.startPage-1}&amount=${pageInfo.cri.amount}"><</a> 
               </c:if>
               <c:forEach var="num" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                  <a href="diaryDetails.do?pageNum=${num}&amount=${pageInfo.cri.amount}" class="${pageInfo.cri.pageNum==num?'active':''}" }>${num}</a>
               </c:forEach>
               <c:if test="${pageInfo.next }">
                  <a href="diaryDetails.do?pageNum=${pageInfo.endPage+1}&amount=${pageInfo.cri.amount}">></a>
               </c:if>
            </div>
         </div>
      </div>
   </div>
</div>

<script>
   $('.page').on('click', '.addComm', function (event) {
      var addPost = $(event.target);
      var postId = addPost.parent().find("input[name=postId]").val();
      var content = addPost.parent().find("input[name=content]").val();
      if (content == "") {
         alert("????????? ????????????.");
         return;
      }
      var writer = addPost.parent().find("input[name=writer]").val();
      console.log(postId + " " + content + " " + writer);
      addPost.parent().find("input[name=content]").val("");
      $.ajax({
         type: "POST",
         url: "diaryComment.do",
         dataType: "json",
         data: {
            "writer": writer,
            "content": content,
            "postId": postId
         },
         success: function (data) {
            let curCnt = addPost.parent().next().children().eq(0).data('cnt');
            addPost.parent().next().children().eq(0).text('comment('+ ++curCnt + ')');
            addPost.parent().next().children().eq(0).data('cnt', curCnt);
            var tbody = $('#dCommentList' + postId);
            let comment = "<tr><td>" + data.content + "</td>";
            comment += "<td>" + data.writer + "</td>";
            comment += "<td>" + data.createDate + "</td>";
            comment += "<c:if test='${(member.id eq comment.writer) || (member.id eq homeOwner.id)}'>";
            comment +=
               "<td><a onclick='deleteCallBack()' style='cursor: pointer;' class='delete-button' data-value='${comment.commId }'>??????</a></td></c:if></tr>";
            tbody.prepend(comment);
         },
         error: function (er) {
            console.log("???????????? : " + er);
         }
      });
   });
   function deleteCallBack(e) {
      const delBtn = event.target;
      let delId = delBtn.getAttribute("data-value");
 
      console.log(delId + "=????????? ???????????? ??????");
      let isDel = confirm("?????????????????????????");
      if (isDel == true) {
         let delAjx = new XMLHttpRequest(); //send
         delAjx.open('post', 'diaryCommentDeleteAjax.do');
         delAjx.setRequestHeader('Content-type',
            'application/x-www-form-urlencoded');
         delAjx.send('delId=' + delId); // Cannot read properties of undefined (reading 'parentElement')
         
         delAjx.onload = function () {
         let curCnt = delBtn.parentElement.parentElement.parentElement.parentElement.parentElement.children[0].getAttribute('data-cnt');
         delBtn.parentElement.parentElement.parentElement.parentElement.parentElement.children[0].innerText='comment('+ --curCnt + ')';
         delBtn.parentElement.parentElement.parentElement.parentElement.parentElement.children[0].setAttribute('data-cnt',curCnt)
        
         delBtn.parentElement.parentElement.remove();
         alert("?????????????????????");
                 
         
         }
      }
   }
</script>

<!-- ????????? ?????? ??? -->

</html>