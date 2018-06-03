<%@page import="java.util.Random"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStreamReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Nanum+Gothic|Song+Myung|Gaegu|Poor+Story|Nanum+Myeongjo');
*{
	font-family:'Nanum Gothic';
}
label#label1{
	font-size:27px;
}
label#label2{
	font-size:25px;
}
input[type=radio]{
	width:25px;
	height:25px;
	cursor: pointer;
	margin-top:20px;
}input[type=submit]{
    width: 23%;
    background-color: #f7cac9;
    color: black;
    padding: 14px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left:0.5%;
    font-size:x-large;
}
</style>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String number = request.getParameter("page");
	
	int i = 0;
	int j = 0;
	int count = 0;
	String quiz[][] = new String[50][6];
	String dir = application.getRealPath("/WEB-INF/text/");
	String filePath = dir+"/quiz"+number+".txt";
	try{
		File file = new File(filePath);
		   
		BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
		String line = null;
		while((line=br.readLine())!=null){ //라인단위 읽기
			quiz[i][j] = line;
			++count;
			++j;
			if(count%6==0){
				++i;
				j=0;
			}
		}
	} catch (IOException e) { 
	  System.out.println(e.toString()); //에러 발생시 메시지 출력
	}
	int[] arr = new int[10];  //1차원배열 방 10개를 만듭니다.
    int ran=0;    //랜덤값을 받을 변수를 만듭니다.
    boolean cheak;    // 비교하기 위해 boolean형 변수를 만듭니다.
    Random r = new Random();    // Random형 객체를 만듭니다.

    for (int l=0; l<arr.length; l++) {    // 배열의 크기만큼 for문을 돌립니다.
        ran = r.nextInt(20);    // nextInt(10)하면 0-9까지 나오므로  +1을 시켜 1-10까지로 만듭니다.
        cheak = true;    // i문이 돌 때마다 cheak를 true로 만듭니다.
        for (int t=0; t<l; t++) {    //if문 때문에 j를 i값만큼 돌립니다. 
            if(arr[t] == ran) {
                l--;    // i의 값을 하나 줄여 한 번 더 돌게 합니다.
                cheak = false;    // 목적과는 다르게 같은 값이 나왔으므로 cheak를 false로 만듭니다.
            }
        }
        if(cheak) arr[l] = ran;   // ran에 받은 값을 arr[i]방에 넣습니다.
    }
%>
<form method="post" action="quiz_answer.jsp">
	<input type="hidden" name="quizpage" value="<%=number %>">
<%	
	for(int p = 0; p<arr.length; p++){
		out.println("<br>"+"&nbsp;");%>
		<label id="label1"><%=(p+1)+". "+quiz[arr[p]][0]%></label><br>
<%		for(int y = 1;y<5;y++){%>
			&nbsp;&nbsp;<label id="label2"><%=quiz[arr[p]][y] %></label><input type="radio" name="<%="quiz"+p%>" value="<%=quiz[arr[p]][y]%>">
			<input type="hidden" name="<%="quiz"+p+"ans"%>" value="<%=quiz[arr[p]][5]%>">
			<input type="hidden" name="<%="quiz"+p+"que"%>" value="<%=quiz[arr[p]][0] %>">
<%		}
		out.println("<br>"+"<br>");
	}%>
	<input type="submit" value="채점하기">
</form>	
</body>
</html>