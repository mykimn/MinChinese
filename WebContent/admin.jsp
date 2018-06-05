<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MIN'S CHINESE</title>
<link rel="stylesheet" href="basic_style.css">
</head>
<body>
    <header><a href="index.jsp"><h1 style="text-align: center">MIN'S CHINESE</h1></a></header>
    <aside id = "leftmenu">
    <%
    	request.setCharacterEncoding("UTF-8");
    	if(session.getAttribute("s_Id")=="svt" && session.getAttribute("s_Pwd")=="0526"){ %>
    		<div id="member">
		        <h3 style="margin-top:24px; margin-left:43px;"><%= "관리자님 환영합니다." %></h3><br>
		        <a href="index.jsp" target="main" style="text-decoration:none; color:gray; margin-left:70px;">홈으로 이동</a><br>
		        <a href="logout.jsp" style="text-decoration:none; color:red; margin-left:73px;">로그아웃</a><br>
			</div>
    <%	}else{ %>
    		<div id="login">
	            <h3 style="margin-top:5px; margin-left:82px; margin-bottom:10px;">로그인</h3>
	            <form action="loginadmin.jsp" method="post">
	               <label style="margin-left:20px;">아이디 : </label><input type="text" size="10" name="id" style="margin-left:15px;" required><br />
	               <label style="margin-left:20px;"> 패스워드 : </label><input type="password" size="10" name="pw" required><br />
	               <input type="submit" value="로그인" style="margin-left:55px; margin-top:6px;">
	                <input type="reset" value="취소">
	            </form>
        	</div>
    <%  }
    %>
    </aside>
    <section>
        <article style="width:80%; background-color:white;">
        	<%
        		if(session.getAttribute("s_Id")=="svt" && session.getAttribute("s_Pwd")=="0526"){%>
        			<iframe name="main" width="100%" height="800" style="border:none" src="addphrase.jsp"></iframe>
        	<%	}
        		else{%>
        			<iframe name="main" width="100%" height="800" style="border:none" src="other.jsp"></iframe>
        	<% 	}
        	%>
        </article>
    </section>
</body>
</html>