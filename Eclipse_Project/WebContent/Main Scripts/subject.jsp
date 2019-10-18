<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="jclass.*"%>

<%  
    String addbtn = request.getParameter("addclick");
    String name = request.getParameter("subject");
    String subid = request.getParameter("subjectID");
    String domain = request.getParameter("domain");
    String dept_id = request.getParameter("dept");    
    String year = request.getParameter("year");
    ResultSet yr=null;
        
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_main", "Deva", "dev123456");
    Statement st=conn.createStatement();
     if(addbtn != null)
     {                 
         if(name.isEmpty())
         {
             %><script>alert("Please Enter the name")</script><%
         }
         else
         {
            st.executeUpdate("INSERT INTO subject(subject_id,subject_name,domain_name,yr,dept_id) VALUES('"+subid+"','"+name+"','"+domain+"','"+year+"','"+dept_id+"')");
         }
     }
%>
<script>
	var a = 3
	var title_name = "Subject"
</script>
<%@ include file = "navbar.jsp" %>
        <form action="#" method="POST">
            <input type="number" id="subid" name="subjectID" placeholder="Enter the Subject ID"><br>
            <input type="text" id="subname" name="subject" placeholder="Enter the Subject Name"><br>
            <select id="Area" name="domain">
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
            </select><br>
            <select id="asd" name="dept">
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
            </select>        
            <br>
<select id="asd" name="year">
        <%
      
       yr = st.executeQuery("select distinct year from class");
       while(yr.next())
        {
           %>
           <option value="<%=yr.getString("year")%>"><%=yr.getString("year")%></option>
           <%}%>
           
       </select>  
       <br>
             <br>
    <input type="submit" value="ADD" name="addclick">
    </form>
    <form action="#" method=post>
		<input type="submit" name="delete" value="Delete"/>
			<%
				if (request.getParameter("delete") != null) {
					sammdao obj = new sammdao();
					
					String[] arr = (String[]) request.getParameterValues("selected");
					obj.subjectdel(arr);
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
	            	<td><input type="checkbox" name="selected" value='<%=result.getString("subject_ID")%>'/></td>
		    		<td><input type="text" disabled="true" id="<%=i+result.getString("subject_ID")%>" value="<%=result.getString("subject_ID")%>"/></td>
		    		<td><input type="text" disabled="true" id="<%=i+result.getString("subject_name")%>" value="<%=result.getString("subject_name")%>"/></td>
		    		<td><input type="text" disabled="true" id="<%=i+result.getString("domain_name")%>" value="<%=result.getString("domain_name")%>"/></td>
		    		<td><input type="text" disabled="true" id="<%=i+result.getString("dept_id")%>" value="<%=result.getString("dept_id")%>"/></td>
		    		<td><input type="text" disabled="true" id="<%=i+result.getString("yr")%>" value="<%=result.getString("yr")%>"/></td>
		    		<td><input type="button" onclick="fun1(this,'<%=i+result.getString("subject_ID")%>','<%=i+result.getString("subject_name")%>','<%=i+result.getString("domain_name")%>','<%=i+result.getString("dept_id")%>','<%=i+result.getString("yr")%>')" value="EDIT"/></td>
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