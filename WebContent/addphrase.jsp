<%@page import="java.io.IOException"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Anton|Passion+One|Archivo+Black');
* {
	font-family:"Nanum Gothic";
}
h1{
	font-size:60px;
	margin-left:3%;
}
#hanjabox{
	margin-top:5%;
	margin-left:3%;
	margin-right:3.5px;
	margin-bottom:30px;
	text-align:center;
	valign:center;
	width:1200px;
	height:500px;
	display:inline-block;
	border:3px solid #92a8d1;
}
label{
	margin-left:3%;
	font-size:x-large;
}
input[type=text]{
	height:50px;
	font-size:x-large;
	margin-bottom:2%;
}
input[type=submit]{
    width: 19.5%;
    background-color: #92a8d1;
    color: black;
    padding: 10px 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:74.5%;
    font-size:large;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
%>
<h1>사자성어 추가</h1>
<form action="add.jsp" method="post">
<label>한자&nbsp;&nbsp;&nbsp;</label><input type="text" name="hanja" size="130"><br>
<label>음&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" name="um" size="130"><br>
<label>뜻&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><input type="text" name="mean" size="130"><br>
<input type="submit" value="추가하기" onclick="alert('사자성어를 추가했습니다.')">
</form>
</body>
</html>