<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="jclass.*"%>
<%
        
    Class.forName("com.mysql.jdbc.Driver");
	String database = (String)session.getAttribute("curdb");
	System.out.println("In subject");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+database, "Deva", "dev123456");
    Statement st=conn.createStatement();
    ResultSet yr=null;
    
%>
<script>
	var a = 3
	var title_name = "Subject"
	

		function check(){
			 
			 filename = $("#file").val();
				
			 if(filename.trim().length == 0){
				 alert('Please Select The File To Upload Subject Data');
				 return false;
			 }else{
				document.getElementById("add1").disabled = true;

				document.getElementById("add2").disabled = true;
				document.getElementById("del").disabled = true;
				return true;	 
			 }
			
		}
</script>
<%@ include file = "navbar.jsp" %>
<div class="row">

<div class="col">
        <form action="subject.jsp" method="POST">
        	<table>
        		<tr><td>Subject ID </td><td><input type="number" id="subid" name="subjectID" placeholder="Enter the Subject ID" min="1"></td></tr>
	            <tr><td>Subject Name </td><td><input type="text" id="subname" name="subject" placeholder="Enter the Subject Name" pattern='[A-Z\_a-z\\s]*'></td></tr>
	            <tr><td><input type="hidden" name="error" value="" /></td>
	            <tr><td>Domain </td><td><select id="Area" name="domain">
<%  
    try{
        ResultSet result = null;
        result = st.executeQuery("select * from domain");
        while(result.next())
        {
        %>
        <option value="<%=result.getString("domain_name")%>"><%=result.getString("domain_name") %></option>    
        <%
        }
   
%>
            </select></td></tr>
          <tr><td>Department</td> <td><select id="asd" name="dept">
              <%  
  
        ResultSet result2 = null;
        result2 = st.executeQuery("select * from dept");
        while(result2.next())
        {
        %>
        <option value="<%=result2.getString("dept_name")%>"><%=result2.getString("dept_name") %></option>    
        <%
        }
   
%>
            </select></td></tr>        
            <br>
		<tr><td>Year </td><td><select id="asd" name="year">
        <%
      
       yr = st.executeQuery("select distinct year from class");
       while(yr.next())
        {
           %>
           <option value="<%=yr.getString("year")%>"><%=yr.getString("year")%></option>
           <%}%>
           
       </select></td></tr>  
    </table>
    <br>
    <input type="submit" value="ADD" id="add1" class="btn" name="addclick">
    </form>
    <%  
    String addbtn = request.getParameter("addclick");
    String name = request.getParameter("subject");
    String subid = request.getParameter("subjectID");
    String domain = request.getParameter("domain");
    String dept_id = request.getParameter("dept");    
    String year = request.getParameter("year");
    
	    if(addbtn != null)
	    {                 
	        if(name.isEmpty())
	        {
	            %><script>alert("Please Enter the name")</script><%
	        }
	        else
	        {	
	           
	        	try
	        	{
		        	st.executeUpdate("INSERT INTO subject(subject_id,subject_name,domain_name,yr,dept_id) VALUES('"+subid+"','"+name+"','"+domain+"','"+year+"','"+dept_id+"')");
					
					%>
				    <p style="color:#0000FF"><%out.println("SUBJECT ADDED");%></p>
				    <%	       
		        }
	        	catch(SQLException e)
	        	{
	        		%>
	        	    <p style="color:#FF0000"><%out.print("INVALID INPUT!");%></p>
	        	    <%	       
	        	}
	        }
	    }
    %>
    </div>
    <div class="col" style="border-left: 1px; border-left-color: black">
    <div class="center">
    
	<form action="subject_upload.jsp" enctype="multipart/form-data"
		method="post">
		<h3>Choose Excel Sheet</h3>
		<input name="upload" id="file" class="form-control" type="file" accept=".xls, .xlsx">
		<br>
		<br>
		<button type="submit" onclick="return check()" id="add2" class="btn">ADD</button>

	</form>
	</div>
</div>
    </div>
    <form action="#" method=post>
		<input class="btn" type="submit" id="del" name="delete" value="Delete"/>
			<%
				if (request.getParameter("delete") != null) {
					sammdao obj = new sammdao();
					
					String[] arr = (String[]) request.getParameterValues("selected");
					obj.subjectdel(arr, database);
				}
			if(request.getParameter("error")!=null&&request.getParameter("error")!="")
			{
				%>
        	    <p style="color:#FF0000"><%out.print("INVALID INPUT!");%></p>
        	    <%	       
			}
			else if(request.getParameter("error")==" ")
			{
				out.println("SUBJECT DELETED");
			}
   			%>
   	
    <div class="table-responsive">
    <table class="table">
         <tr>
         	<th>Delete</th>
		    <th>Subject ID</th>
		    <th>Subject Name</th> 
		    <th>Domain</th>
		    <th>dept_id</th>
		    <th>year</th>
		    <th>Edit</th>
  		</tr>
            <% 
            result = st.executeQuery("select * from subject,domain where subject.domain_name = domain.domain_name");
            int i = 0;
            while(result.next()){
            %>
            	<tr>
	            	<td><input style="width:60px;" type="checkbox" name="selected" value='<%=result.getString("subject_ID")%>'/></td>
		    		<td><input style="width:90px;" type="text" disabled="true" id="<%=i+result.getString("subject_ID")%>" value="<%=result.getString("subject_ID")%>"/></td>
		    		<td><input style="width:100px;" type="text" disabled="true" id="<%=i+result.getString("subject_name")%>" value="<%=result.getString("subject_name")%>"/></td>
		    		<td><input style="width:100px;" type="text" disabled="true" id="<%=i+result.getString("domain_name")%>" value="<%=result.getString("domain_name")%>"/></td>
		    		<td><input style="width:80px;" type="text" disabled="true" id="<%=i+result.getString("dept_id")%>" value="<%=result.getString("dept_id")%>"/></td>
		    		<td><input style="width:50px;" type="text" disabled="true" id="<%=i+result.getString("yr")%>" value="<%=result.getString("yr")%>"/></td>
		    		<td><input style="width:80px;" type="button" onclick="fun1(this,'<%=i+result.getString("subject_ID")%>','<%=i+result.getString("subject_name")%>','<%=i+result.getString("domain_name")%>','<%=i+result.getString("dept_id")%>','<%=i+result.getString("yr")%>')" value="EDIT"/></td>
	            <tr>
            <%
            i++;
            }
    %>
	</table>
	 
	</div>
</form>      
</form>
    <%@ include file = "downbar.jsp" %>
<%}
    catch(Exception e)
    {
        out.println("Exception Occured..:"+e);
    }
%>

<script>
var prev = []
var osid = null

function fun1(el,el_id1,el_id2,el_id3,el_id4,el_id5){
	if(el.value == "UPDATE"){
		var sid = document.getElementById(el_id1).value
		var sname = document.getElementById(el_id2).value
		var dept = document.getElementById(el_id4).value
		var yr = document.getElementById(el_id5).value
		var dname = document.getElementById(el_id3).value
		
		var urlstr = "edits/subjectEdit.jsp?osid="+ osid +"&sid="+ sid+"&sname="+ sname+"&yr="+ yr+"&dept="+ dept+"&dname="+ dname;
		window.location.replace(urlstr)
		el.value = 'EDIT'
		prev.disabled = true
	}
	else{	
		if(prev.length != 0){
			for(var i; i < prev.length; i++)
				prev[i].disabled = true	
		}
		osid = document.getElementById(el_id1).value
		
		var cur = []
			
		cur.push(document.getElementById(el_id1))
		cur.push(document.getElementById(el_id2))
		cur.push(document.getElementById(el_id3))
		cur.push(document.getElementById(el_id4))
		cur.push(document.getElementById(el_id5))

		for(var i=0; i < cur.length; i++){
			cur[i].disabled = false
		}
		
		el.value = "UPDATE"
		
		for(var i=0; i < cur.length; i++)
			prev.push(cur[i])
	}
}
</script>