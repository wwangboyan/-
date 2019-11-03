<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>
</head>
<style>
html {
	width: 100%;
	height: 100%;
	overflow: hidden;
	font-style: sans-serif;
}
body {
	width: 100%;
	height: 100%;
	font-family: 'Open Sans', sans-serif;
	margin: 0;
	background-color:#D2D6DE;
}

#login {
	position: absolute;
	top: 40%;
	left: 50%;
	margin: -150px 0 0 -150px;
	width: 300px;
	height: 300px;
}

#login h1 {
	color: #000000;
	text-shadow: 0 0 10px;
	letter-spacing: 1px;
	text-align: center;
}

h1 {
	font-size: 3.5em;
	margin: 0.4em 0;
	transition: 3s;
	font-family: Times New Roman;
}

input {
	width: 350px;
	height: 30px;
	margin-bottom: 10px;
	outline: none;
	padding: 10px;
	font-size: 13px;
	color: #fff;
	text-shadow: 1px 1px 1px;
	border-radius: 4px;
	background-color:rgba(106, 149, 141, 0.46);
}

#o {
	text-decoration: none;
	out-line: nonecolor: #*****;
	color: azure;
}

.but {
	width: 375px;
	min-height: 30px;
	display: block;
	background-color:rgba(106, 149, 141, 0.46);
	text-shadow: 1px 1px 1px;
	color: #0f0f0f;
	padding: 9px 14px;
	font-size: 16px;
	font-weight:bold;
	line-height: normal;
	border-radius: 5px;
	margin: 0;
	transition: 1.5s;
}

.bu {
	width: 375px;
	min-height: 50px;
	display: block;
	text-shadow: 1px 1px 1px;
	color: #0f0f0f;
	padding: 9px 14px;
	font-size: 16px;
	font-weight:bold;
	line-height: normal;
	border-radius: 5px;
	margin: 0;
	transition: 1s;
	background-color:  rgba(106, 149, 141, 0.46);
}

.bu :hover {
	border-radius: 42%;
	color: rgba(106, 149, 141, 0.46);
	background-color: #AABBCC;
	transition: 1s;
}

.but :hover {
	border-radius: 12%;
	color: white;
	background-color: #F5DEB3;
	transition: 1.5s;
}

.link {
	outline: none;
	text-decoration: none;
	position: relative;
	font-size: 8em;
	line-height: 1;
	color: #9e9ba4;
	display: inline-block;
}

.but:link {
	color: #06F;
	text-decoration: none;
} /* 未访问的链接 */
.but:visited {
	color: #999;
	text-decoration: line-through;
} /* 已访问的链接 */
.but:hover {
	color: #F00;
	text-decoration: underline;
} /* 鼠标移动到链接上 */
.but:active {
	color: #F0F;
} /* 选定的链接 */
.b {
	width: 300px;
	min-height: 20px;
	display: block;
	background-color: #424242;
	border: 1px solid #3762bc;
	color: #fff;
	padding: 9px 14px;
	font-size: 15px;
	line-height: normal;
	border-radius: 5px;
	margin: 0;
	transition: 1s;
	background-color: #008080;
}

.b :hover {
	border-radius: 42%;
	color: white;
	background-color: #F5DEB3;
	transition: 1s;
}
</style>
<body>
	<div id="login">
		<h1>登录</h1>
        <%=request.getAttribute("message")==null?"":request.getAttribute("message") %>
		<form name="form1" method="get" action="LoginServlet">
			<input type="text" required="required" placeholder="用户名" name="name" id="name"></input>
			<input type="password" required="required" placeholder="密码" name="pwd" id="pwd"></input>
			<select name="type" class="bu">
				<option value="1">学生</option>
				<option value="2">管理员</option>
			</select> <br/>
			<button class="but" id="check" type="submit">登录</button>
		</form>
	</div>
</body>
</html>