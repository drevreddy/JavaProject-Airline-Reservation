<link href="air.cdf" rel="stylesheet">
<%@page import="java.sql.*"%>
<%@ include file="common.jsp" %>

<%
         try 
        {
	String vall1 = request.getParameter("flightid");
String vall= "Seats Booked Report for the flight Id " + vall1 ;
       out.println("<div style='position:absolute;left:280;top:140;'><p style='font-size:15px;font-family:tahoma;font-weight:bold;padding:5px;text-align:center;background:linen;color:maroon'>"+vall+"</p></div>");
	
       String ds;
         int iv;
	

         String data="Select  DOJ      , DOB,             STYPE ,     SNO ,       USID                  from seats where status = 'y' and flightid ='" + vall1 + "'";
        
		  PreparedStatement pst=null;
		  ResultSet rs=null;
		  ResultSetMetaData meta=null;

          rs=(st!=null)?st.executeQuery(data):null;
 		  meta=(rs!=null)?rs.getMetaData():null;
		  int ct=0;
		  out.println("<BODY leftMargin=0 topMargin=0 rightMargin=0 bgColor= #bbe9ff><style>");
		  out.println("td {font-family:ms sans serif;color:gray;font-size:12px:align=center;}");
		  out.println("th{font-family:ms sans serif;background:lightslategray;color:aliceblue;font-size:12px;}");
		  out.println("body {background-image:Bg.gif}");
		  out.println("</style>");
		  out.println("<title>Reports Generation</title>");
          out.println("<table style='position:absolute;left:1;top:170;' width=750 border=0 bgcolor=#bbe9ff cellspacing=1 cellpadding=1");
          if(rs!=null) {out.println("<TR>");  
          for(int mt=1;mt<=meta.getColumnCount();mt+=1) 
          out.println("<Th wrap>&nbsp;&nbsp;"+meta.getColumnName(mt).replace('_','-')+"&nbsp;&nbsp;</th>");
		  out.println("</TR>");} 
		  while(rs!=null && rs.next()) {
          ct++;out.println("<TR>");
		  for(int d=1;d<=meta.getColumnCount();d++) {
          String metaname=meta.getColumnTypeName(d).toLowerCase();
		  if(metaname.indexOf("varchar")!=-1) {
          ds=rs.getString(d);
          out.println("<td wrap bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+ds+"&nbsp;</td>");}
		  else if(metaname.indexOf("date")!=-1) {

	java.text.SimpleDateFormat fmt=new java.text.SimpleDateFormat("dd-MMM-yy");
	ds=fmt.format(rs.getDate(d)).toString();


          out.println("<td wrap bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+ds+"&nbsp;</td>");}
		  else {
          iv=rs.getInt(d);
          out.println("<td wrap bgcolor=whitesmoke>&nbsp;&nbsp;&nbsp;"+iv+"&nbsp;</td>");}
  		  }  out.println("</tr>");
  	      } 
out.println("<tr><td align=center colspan=15 bgcolor=whitesmoke><h2><a href=\"javascript:window.print()\"><font face=arial color=gray>Print The Reports</font></a></h2></center><br><hr size=1 color=gray><BR></td></table><br>");

          } 
catch (Exception e) 
{ out.println("<h1>Error Occured<BR>"+e);  }
 



%>