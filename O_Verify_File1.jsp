<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>O_Verify_File</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-georgia.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 24}
.style2 {padding:0; margin:0; width:100%; line-height:0; clear: both;}
.style3 {font-size: 36px; }
.style4 {
	color: #FF0000;
	font-weight: bold;
}
.style5 {
	color: #FF0000;
	font-size: 24px;
	font-weight: bold;
}
.style7 {color: #FFFF00}
.style8 {color: #FF0000; font-size: 12px; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="O_Main.jsp">Hi <%=application.getAttribute("doname")%> !!</a></li>
          <li><a href="O_Login.jsp">Logout</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style5">Secure Cloud Data Deduplication with Efficient Re-encryption</h1>
      </div>
      <div class="clr style1"></div>
      <div class="slider style1">
        <div id="coin-slider"> <a href="#"><img src="images/slide1.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide2.jpg" width="960" height="360" alt="" /> </a> <a href="#"><img src="images/slide3.jpg" width="960" height="360" alt="" /> </a> </div>
        <div class="style2"></div>
      </div>
      <div class="clr style1"></div>
    </div>
  </div>
  <div class="content style1">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2>Verify_File</h2>
          <%
	 	int i;
	 	String s2, s3, s4, s5, s6, s7, s12="", s13="", s14="", s15="", s16="";

	 	try {
	 		String fname = request.getParameter("fname");
	
	 		String oname = request.getParameter("oname");

	 		Statement st = connection.createStatement();

%> 
<%

	 		String strQuery2 = "select * from ownerdetails where fname='"
	 				+ fname + "' and ownername='" + oname + "'";
	 		connection.createStatement();

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
	 			i = rs.getInt(1);//id
	 			s2 = rs.getString(2);//fn
	 			s3 = rs.getString(3);//on
	 			s4 = rs.getString(4);//mac
	 			s5 = rs.getString(5);//sk
	 			s7 = rs.getString(6);//dt
	 			%>

<%
				
	 %> <%
					String strQuery3 = "Select * FROM cloudserver where fname='"
									+ fname + "' and ownername='" + oname + "' ";

							Statement st2 = connection.createStatement();

							ResultSet rss = st2.executeQuery(strQuery3);
							if (rss.next()) {
								i = rss.getInt(1);//id
								s12 = rss.getString(2);//fname
								s13 = rss.getString(4);//on
								s14 = rss.getString(5);//mac
								s15 = rss.getString(6);//sk
								s16 = rss.getString(7);//rank
								
								%>

<%} %>

<%
							if(s2.equalsIgnoreCase(s12) && s3.equalsIgnoreCase(s13) && s4.equalsIgnoreCase(s14) && s5.equalsIgnoreCase(s15))
							{
							%>
<p>
<h2><%=fname %> File of Mr.<%=oname %> is Secured !!!</h2>
</p>
<br />
<p><a
	href="O_Main.jsp">BACK</a></p>

<%
							}	
							else {
								%>
<p>
<h2><%=fname %> File of Mr.<%=oname %> is Attacked by Attacker !!!</h2>
</p>
<br />
<p> <a
	href="O_Main.jsp">BACK</a></p>

<%
				
					 		}
						}
	 					else{
							%>
<p>
<h2><%=fname %> File of Mr/Ms.<%=oname %> Which u Provided is Wrong Details !!!</h2>
</p>
<br />
<p> <a
	href="O_Main.jsp">BACK</a></p>

<%
	 					}	
		  	connection.close();

		  	}catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	} %>							
				
          <p>&nbsp;</p>
          <p><a href="O_Main.jsp">Back</a></p>
          <div class="style2"></div>
        </div>
      </div>
      <div class="style2"></div>
    </div>
  </div>
  <div class="fbg style1">
    <div class="fbg_resize">
      <div class="style2"></div>
    </div>
  </div>
  <div class="footer style1">
    <div class="footer_resize">
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center class="style1"></div>
</body>
</html>
