<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>MLE_Keys_Request</title>
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
.style24 {
	color: #FF0000;
	font-size: 24px;
	font-weight: bold;
}
.style25 {color: #FFFF00}
.style26 {font-size: 14px}
.style27 {color: #FF0000; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="KS_Main.jsp">KEY SERVER</a></li>
          <li><a href="KS_Login.jsp">LOGOUT</a></li>
        </ul>
      </div>
      <div class="logo">
        <h1 class="style3 style24">Secure Cloud Data Deduplication with Efficient Re-encryption</h1>
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
          <h2>View MLE Key Request and Permit !!! </h2>
          <p class="infopost">&nbsp;</p>
          <div class="style2"></div>
          <div class="img">
            <div align="justify"></div>
          </div>
          <div class="post_content">
            <p>&nbsp;</p>
            <table width="618" border="1" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="66" height="30" bgcolor="#FF0000"><div align="center" class="style24 style25 style26"><strong> ID </div></td>
              <td width="127" bgcolor="#FF0000"><div align="center" class="style24 style25 style26">User Name </div></td>
              <td width="116" bgcolor="#FF0000"><div align="center" class="style24 style25 style26">Owner Name </div></td>
              <td width="127" bgcolor="#FF0000"><div align="center" class="style24 style25 style26">File Name </div></td>
            
			  <td width="123" bgcolor="#FF0000"><div align="center" class="style24 style25 style26">MLE Key </div></td>
            </tr>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;

      	try 
	{
		String s="null";
		String dname=(String)application.getAttribute("doname");
      		String query="select * from request"; 
           Statement st=connection.createStatement();
           ResultSet rs=st.executeQuery(query);
	while ( rs.next() )
	   {
		i=rs.getInt(1);
		s2=rs.getString(2);
		s3=rs.getString(3);
		s4=rs.getString(4);
		s5=rs.getString(5);
		s6=rs.getString(6);
		

		
	
		
		%>
            <tr>
              <td height="28"><div align="center" class="style27"><%=i%></div></td>
              <td><div align="center" class="style27"><%=s2%></div></td>
              <td><div align="center" class="style27"><%=s3%></div></td>
              <td><div align="center" class="style27"><%=s4%></div></td>
              <%

			 		
			if(s6.equalsIgnoreCase("Requested"))
			{
			
		%>
              <td><div class="style27">
                  <div align="center"><a href="KS_Keys_Request2.jsp?usid=<%=i%>&amp;fname=<%=s6%>">Generative and Give Permission</a></div>
              </div></td>
              <%
		
			}else if(s6.equalsIgnoreCase("Permitted"))
			{
		%>
              <td width="17"><div class="style27">
                  <div align="center"><%=s6%></div>
              </div></td>
            </tr>
            <%
			
			 
	  }
         
          }
         }
          catch(Exception e)
          {
            out.println(e.getMessage());
          }
%>
          </table>
            <p align="right">&nbsp;</p>
            <p align="right"><a href="KS_Main.jsp">Back</a></p>
          </div>
          <div class="style2"></div>
        </div>
      </div>
      <div class="sidebar">
        <div class="searchform">
          <form id="formsearch" name="formsearch" method="post" action="#">
            
            <input name="editbox_search" class="editbox_search" id="editbox_search" maxlength="80" value="Search our ste:" type="text" />
            
            <input name="button_search" src="images/search.gif" class="button_search" type="image" />
          </form>
        </div>
        <div class="gadget">
          <h2 class="star"> Menu</h2>
          <div class="style2"></div>
          <ul class="sb_menu">
            <li><a href="KS_Main.jsp">Home</a></li>
            <li><a href="KS_Login.jsp">Logout</a></li>
          </ul>
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
