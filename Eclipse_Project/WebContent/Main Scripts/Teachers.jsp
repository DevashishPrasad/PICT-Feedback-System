<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    	pageEncoding="ISO-8859-1"%>
<%@page import="jclass.*"%>

<script>
	var a = 4
	var title_name = "Teachers"
	function check(){
		 
		 filename = $("#file").val();
			
		 if(filename.trim().length == 0){
			 alert('Please Select The File To Upload Teachers Data');
			 return false;
		 }else{
			return true;	 
		 }
		
	}
</script>
<%@ include file = "navbar.jsp" %>
<form name="form1" action="Teachers.jsp" method="post">
<div>
<div>
<center><label>Teacher Name :&nbsp;</label></center>
<input id="name" type="text" placeholder="Teacher Name" name="name" pattern='[A-Za-z\\s]*'>
<br>
<br>
	<label>Teacher DEPT :&nbsp;</label>
		<select name="dept">
			<option value=" " disabled selected>Select department</option>
			<option value="CS">C.S</option>		
			<option value="IT">I.T</option>
    		<option value="EnTC">ENTC</option>
			<option value="AS">AS</option>
		</select>
<br>
<br>
<input type="submit" name="ADD1" value="ADD"></input>
</div>

</div>
</form>
<form action="staff_upload.jsp" enctype="multipart/form-data" method="post">

	<input name="upload" id="file" type="file" accept=".xls, .xlsx" >
	<br><br>
	<button type="submit" onclick="return check()">ADD</button>

</form>

<%
	String name=null;
	String dept=null;
	String s=null;
	String d=null;
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_main","Deva","dev123456");
	name=request.getParameter("name");
	dept=request.getParameter("dept");
	
	s=(String)request.getParameter("ADD1");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs1;
	if((name!=null)&&(dept!="")&&(s!=null) )
	{
		int i= st1.executeUpdate("insert into teachers(dept,name) values('"+dept+"','"+name+"')");
		
		%>
	    <p style="color:#0000FF"><%out.println("TEACHER ADDED");%></p>
	    <%	       
	}
	else 
	{
		out.println("PUT VALID INPUTS ONLY");
	
	}
%>
<br><br>
<center>
	<form action="#" method=post>
		<input type="submit" name="delete" value="Delete"/>
		<%
					if(request.getParameter("delete") != null){
						sammdao obj = new sammdao();
						
						String[] arr = (String[]) request.getParameterValues("selected");
						obj.dell(arr);
					}
		if(request.getParameter("error")!=null)
		{
			%>
		    <p style="color:#FF0000"><%out.println("INVALID INPUT");%></p>
		    <%	
		}
		%>
	<div class="table-responsive">
	<table class="table">

   <tr>
   		<th>Delete</th>
        <th>ID</th>
        <th>DEPT</th>
        <th>Name</th>
        <th>Edit</th>
   </tr>
   
<% 

ResultSet rs2= st1.executeQuery("select * from teachers");
int i = 0;
while(rs2.next())
{
%>
	<tr>
		<td><input type="checkbox" name="selected" value='<%=rs2.getInt(1)%>'/></td>
   		<td><input type="text" disabled="true" id="<%=i+rs2.getInt(1)%>" value="<%=i+rs2.getInt(1)%>"/></td>
   		<td><input type="text" disabled="true" id="<%=i+rs2.getString(2)%>" value="<%=rs2.getString(2)%>"/></td>
   		<td><input type="text" disabled="true" id="<%=i+rs2.getString(3)%>" value="<%=rs2.getString(3)%>"/></td>
   		<td><input type="button" onclick="fun1(this,'<%=i+rs2.getInt(1)%>','<%=i+rs2.getString(2)%>','<%=i+rs2.getString(3)%>');" value="EDIT"/></td>
	</tr>
<% 
}
%>
</table>
</div>
</form>
<%@ include file = "downbar.jsp" %>
<script>
var prev = []
var oid = null

function fun1(el,el_id1,el_id2,el_id3){
	if(el.value == "UPDATE"){
		var dept = document.getElementById(el_id2).value
		var name = document.getElementById(el_id3).value
		
		var urlstr = "edits/teacherEdit.jsp?oid="+ oid +"&dept="+ dept+"&name="+ name
		window.location.replace(urlstr)
		el.value = 'EDIT'
		
		for(var i; i < prev.length; i++)
			prev[i].disabled = true
			
		oyear = null
		odiv = null
	}
	else{	
		if(prev.length != 0){
			for(var i; i < prev.length; i++)
				prev[i].disabled = true	
		}
		oid = document.getElementById(el_id1).value
	
		var cur = []
			
		cur.push(document.getElementById(el_id2))
		cur.push(document.getElementById(el_id3))

		for(var i=0; i < cur.length; i++){
			cur[i].disabled = false
		}
		
		el.value = "UPDATE"
		
		for(var i=0; i < cur.length; i++)
			prev.push(cur[i])
	}
}
</script>