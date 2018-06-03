<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="basic_style.css">
</head>
<body>
    <header><a href="index.jsp"><h1 style="text-align: center">MIN'S CHINESE</h1></a></header>
    <nav>
        <ul>
            <li><a href="practice.jsp?page=8" target="main">한자 공부</a>
            	<ul>
            		<li><a href="practice.jsp?page=8" target="main">8급</a></li>
            		<li><a href="practice.jsp?page=5" target="main">5급</a></li>
            		<li><a href="practice.jsp?page=2" target="main">2급</a></li>
            	</ul>
            </li>
            <li><a href="quiz.jsp" target="main">한자 퀴즈</a></li>
            <li><a href="singing.jsp" target="main">이야기로 연습</a></li>
            <li><a href="question.jsp" target="main">질문하기</a></li>
        </ul>
    </nav>
    <aside id = "leftmenu">
    <%
    	request.setCharacterEncoding("UTF-8");
    	if(session.getAttribute("s_Id")==null && session.getAttribute("s_Pwd")==null){ %>
    		<div id="login">
	            <h3 style="margin-top:5px; margin-left:82px; margin-bottom:10px;">로그인</h3>
	            <form action="login.jsp" method="post">
	               <label style="margin-left:20px;">아이디 : </label><input type="text" size="10" name="id" style="margin-left:15px;" required><br />
	               <label style="margin-left:20px;"> 패스워드 : </label><input type="password" size="10" name="pw" required><br />
	               <input type="submit" value="로그인" style="margin-left:55px; margin-top:6px;">
	                <input type="reset" value="취소">
	            </form>
	            <a href="join.jsp" target="main" style="margin-left:70px; text-decoration:none; color:red;">회원가입</a><br>
        	</div>
    <%	}else{ %>
			<div id="member">
		        <h3 style="margin-top:24px; margin-left:43px;"><%= session.getAttribute("s_Id")+"님 환영합니다." %></h3><br>
		        <a href="myroom.jsp" target="main" style="text-decoration:none; color:gray; margin-left:39px;">내 문제방</a>&nbsp;
		        <a href="mysaveword.jsp" target="main" style="text-decoration:none; color:gray;">내 한자방</a><br><br>
		        <a href="logout.jsp" style="text-decoration:none; color:red; margin-left:73px;">로그아웃</a><br>
			</div>
    <%  }
    %>
    </aside>
    <section>
        <article style="width:80%; background-color:white;">
            <iframe name="main" width="100%" height="800" style="border:none" src="main.jsp"></iframe>
        </article>
    </section>
</body>
</html>