<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한자 퀴즈</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Gaegu|Poor+Story|Nanum+Myeongjo');
*{
	font-family:'Nanum Gothic';
}
input[type=button]{
    width: 30%;
    height: 400px;
    background-color: #EFF5FB;
    color: black;
    padding: 10px 20px;
    border: none;
    border-radius: 10px;
    cursor: pointer;
    margin-top:2%;
    font-size:xx-large;
    display:inline;
    margin-left:2%;
    margin-right:10px;
}
</style>
</head>
<body>
<h1 style="text-align:center; margin-top:5%;">한자 퀴즈</h1>
<form method="post">
<input type="button" value="8급 한자" style="background-color: #92a8d1;" onclick="location.href='quiz_do.jsp?page=8'">
<input type="button" value="5급 한자" style="background-color: #f7cac9;" onclick="location.href='quiz_do.jsp?page=5'">
<input type="button" value="2급 한자" style="background-color: #92a8d1;" onclick="location.href='quiz_do.jsp?page=2'">
</form>
</body>
</html>