<link href="air.cdf" rel="stylesheet">
<%@ include file="common.jsp" %>
<%@ page import="java.sql.*"%>
<% 
try {
	String from=request.getParameter("from").toLowerCase();
	String to=request.getParameter("to").toLowerCase();
	String subject=request.getParameter("subject").toLowerCase();
    java.text.SimpleDateFormat fmt=new java.text.SimpleDateFormat("dd-MMM-yyyy");
    String msgdate=fmt.format(new java.util.Date()).toString();
	String msg=request.getParameter("message");
	String table=request.getParameter("table");
    String getid="SELECT MAX(mid) from " + table;

	PreparedStatement sst=null;
	st=con.createStatement();
	ResultSet rs1=st.executeQuery(getid);
	int val=0;
		if(rs1.next()){
			val=rs1.getInt(1);
			if (val>0){ val+=1;}
			else{val=1;}
		}
	String data[]={to,from,subject,msg,msgdate};
	String buff="";
	for(int dt=0;dt<data.length;dt++) 	buff+="'"+data[dt]+"',";
    buff=buff.substring(0,buff.length()-1);
	String cmd="INSERT INTO "+table+" VALUES("+val+","+buff+")";
	boolean eff=st.execute(cmd);
    out.println("<link rel=stylesheet href='air.cdf'><body bgColor= #bbe9ff><h3 align=center>Your Transaction is Succeeded</h1><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\"></a>");
	}catch(Exception e)	{
	String msgs=" ";
	msgs=(e.getMessage().toLowerCase().indexOf("unique")!=-1)?"The User Name U Specified is Already Existed.<BR><BR>Please Choose Another Name":"UnKnown Exception Occured"+e;
	out.println("<link rel=stylesheet href='air.cdf'><body bgColor= #bbe9ff><h1>Error Occured! While Processing Ur Transaction</font></h1><P>"+msgs+"</p><br><br><center><a href=\"javascript:history.back()\">Continue</a>&nbsp;&nbsp;<a href=\"index.htm\" target=\"_parent\">Home</a>");
	}
%>