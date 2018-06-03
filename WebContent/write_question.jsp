<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family:"Nanum Gothic";
}
table{
	border-radius:5px;
	border:4px solid #f7cac9;
	margin-left:13%;
	margin-top:3%;
}
th{
	height:40px;
	text-align:center;
	border:3px solid #f7cac9;
}
td{
	height:40px;
	text-align:center;
	border:3px solid #f7cac9;
}
input[type=button],input[type=submit]{
    width: 6%;
    background-color: #f7cac9;
    color: black;
    padding: 6px 6px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-top:1%;
    font-size:medium;
}
input[type=text]{
	width:600;
	height:30px;
	border:0px;
	font-size:large;
}
textarea{
	border:0px;
	font-size:x-large;
}
</style>
</head>
<body>
<form method="post" action="save_question.jsp">
   <table border="1" cellspacing=0 cellpadding=0>
     <tr>
      <th align="center" width="70">제목</th>
      <td width="500"><input type="text" name="title" size="112" maxlength="100"></td>
     </tr>
     <%
      	if(session.getAttribute("s_Id")==null && session.getAttribute("s_Pwd")==null){%>
      	    <tr>
            <th align="center">닉네임</th>
            <td width="500"><input type="text" name="nick" size="112" maxlength="50"></td>
           </tr>
      <%}
      
      %>
     <tr>
      <th align="center">내용</th>
      <td><textarea name="memo" cols="97" rows="20"></textarea></td>
     </tr>
    </table>
    <input type="submit" value="등록" style="margin-left:40%; margin-right:2%;" onclick="alert('질문이 등록되었습니다!');"><input type=button value="취소" onclick="location.href='question.jsp'">
</form>
</body>
</html>