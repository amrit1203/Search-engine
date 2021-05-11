<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en" >

<head>

  <meta charset="UTF-8">
  
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />

<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />

  <title>Search Engine</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

  
  
<style>
* {
  box-sizing: border-box;
}

body {
  background: #2A2E37;
}
.center {
  text-align: center;
  border: 3px  #00FEDE;
}

h1,h4 {
  color: white;
}

.search {
  width: 100px;
  height: 100px;
  margin: 40px auto 0;
  background-color: #242628;
  position: relative;
  overflow: hidden;
  transition: all 0.5s ease;
}
.search:before {
  content: '';
  display: block;
  width: 3px;
  height: 100%;
  position: relative;
  background-color: #00FEDE;
  transition: all 0.5s ease;
}
.search.open {
  width: 420px;
}
.search.open:before {
  height: 60px;
  margin: 20px 0 20px 30px;
  position: absolute;
}

.search-box {
  width: 100%;
  height: 100%;
  box-shadow: none;
  border: none;
  background: transparent;
  color: #fff;
  padding: 20px 100px 20px 45px;
  font-size: 40px;
}
.search-box:focus {
  outline: none;
}

.search-button {
  width: 100px;
  height: 100px;
  display: block;
  position: absolute;
  right: 0;
  top: 0;
  padding: 20px;
  cursor: pointer;
}

.search-icon {
  width: 40px;
  height: 40px;
  border-radius: 40px;
  border: 3px solid #00FEDE;
  display: block;
  position: relative;
  margin-left: 5px;
  transition: all 0.5s ease;
}
table, th, td {
  border: 2px black;
  border-collapse: collapse;
  text-align: left;
  padding: 8px; 
}

a{
  color: #00FEDE;
}

.search-icon:before {
  content: '';
  width: 3px;
  height: 15px;
  position: absolute;
  right: -2px;
  top: 30px;
  display: block;
  background-color: #00FEDE;
  transform: rotate(-45deg);
  transition: all 0.5s ease;
}
.search-icon:after {
  content: '';
  width: 3px;
  height: 15px;
  position: absolute;
  right: -12px;
  top: 40px;
  display: block;
  background-color: #00FEDE;
  transform: rotate(-45deg);
  transition: all 0.5s ease;
}
.open .search-icon {
  margin: 0;
  width: 60px;
  height: 60px;
  border-radius: 60px;
}
.open .search-icon:before {
  transform: rotate(52deg);
  right: 22px;
  top: 23px;
  height: 18px;
}
.open .search-icon:after {
  transform: rotate(-230deg);
  right: 22px;
  top: 13px;
  height: 18px;
}
#output{
  width: 100%;
  height: 50%;
  box-shadow: none;
  border: none;
  background: transparent;
  color: #fff;
  padding: 20px 100px 20px 45px;
  font-size: 14px;

}
</style>

  <script>
  window.console = window.console || function(t) {};
</script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

  


</head>

<body translate="no" >
 <form action="/MyProject/Search">
 <div class="center"><h1>Welcome to Web Search Engine</h1>
 
 </div>
  <div class="center"><h4>Team members: Amrit, Diyanshi, Gurpreet, Mounika, Neha</h4>
 
 </div>
 
  <div class="search">
 
  <input  type="text" name="search"  class="search-box"  />
  <span class="search-button" size="500">
    <span class="search-icon"></span>
  </span>
</div>
    <script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>

  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
      <script id="rendered-js" >
$('.search-button').click(function () {
  $(this).parent().toggleClass('open');
});
//# sourceURL=pen.js
    </script>
</form>
  
  <%out.println("<br>");%>
    <%out.println("<br>");%>
    
  <div id = "output" class="center">
   <%@page import="java.util.*"%>      <%--Importing all the dependent classes--%>
<%@page import="java.util.Iterator"%> 
<%@page import="java.util.HashMap"%> 
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="java.io.PrintWriter"%>

<% HashMap<String, Integer> pages = (HashMap<String, Integer>)request.getAttribute("pages");
String output=(String)request.getAttribute("output");

if(pages != null) {
	HashMap<String, String> urlmap = (HashMap<String, String>)request.getAttribute("urlmap");
	Set<String> keys = pages.keySet();
	Iterator<String> setitr = keys.iterator();
	out.println("<h1>Search Query: "+output+"</h1><br>");
	
	
	out.println("<table align='center' style='width:20%'>"+"<tr>");
	
	  
	out.println("<td>Page Name</td><td>  Rank </td><td> URL </td></tr>");
	//print the hashmap 
	while(setitr.hasNext()) {
		String key = setitr.next();
		String url = urlmap.get(key);
		
		out.println("<tr><td>"+key+ "</td> <td>" + pages.get(key)+" </td><td><a href='" + url + "'>" +  url+ "</a></td></tr>");
		
		out.println();
		}
	out.println("</table>");
	out.println();
	}
%>

  </div>

</body>

</html>
 
    