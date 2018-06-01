<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung');
* {
	font-family: 'Nanum Gothic';
	font-size:medium;
}
hr{
	border-radius: 4px;
}
input[type=text],input[type=email],input[type=password],input[type=tel],input[type=date],select {
    width: 25%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit], input[type=reset] {
    width: 100%;
    background-color: #92a8d1;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
input[type=submit]:hover, input[type=reset]:hover {
    background-color: #f7cac9;
}
label{
    display:inline-block;
    width:120px;
}
div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
</head>
<body>
   <div>
		<form action="signup.jsp" method="post">
			<fieldset>
			
			<legend>회원가입</legend>
				<label>아이디 </label><input type="text" name="id" required>
				<input type="button" value="아이디 중복 확인"><br />
				<label>비밀번호 </label><input type="password" name="pw" required><br />
				<label>이름 </label><input type="text" name="name" required><br />
				<label>생년월일 </label><input type="date" name="birth" required><br />
			</fieldset>
			<input type="submit" value="회원가입">
			<input type="reset" value="취소">
		</form>
		</div>
</body>
</html>