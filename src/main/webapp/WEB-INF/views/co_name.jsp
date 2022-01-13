<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body {
	  justify-content: center;
	  align-items: center;
	  min-height: 100vh;
	}
	
	.stripe {
	  color: #ccc;
	  line-height: 1;
	  position: relative;
	  display: block;
	  white-space: nowrap;
	  font-family: Arial;
	  font-weight: bold;
	  font-size: 48px;
	  text-transform: uppercase;
	  cursor: pointer;
	}
	.stripe:after {
	  content: "Street Futsal Manager";
	  position: absolute;
	  left: 0;
	  top: 0;
	  line-height: 1;
	  display: block;
	  color: #00838d;
	  width: 0;
	  overflow: hidden;
	  white-space: nowrap;
	  transition: 1s ease-out width;
	}
	.stripe:hover:after {
	  width: 100%;
	}
</style>
<script type="text/javascript">
	
</script>
</head>
<body>
	<span class="stripe" onclick="location.href='index.jsp'">
		Street Futsal Manager
	</span>
</body>
</html>