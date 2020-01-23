<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%@page import="org.apache.poi.ss.usermodel.*"%>
<%@page import="org.apache.poi.xssf.usermodel.*"%>
<%@page import="org.apache.poi.hssf.usermodel.*"%>
<%@ page import="org.apache.poi.poifs.filesystem.POIFSFileSystem"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String path = "/home/neo/eclipse-workspace/1st_increment_feedback/WebContent/data";
		MultipartRequest mr = new MultipartRequest(request, path);
		//storing the path of the uploaded file

		String filepath = mr.getFile("upload").toString();
		File f = new File(filepath);
		String temp_name = (String)session.getAttribute("tempID");
		System.out.println(temp_name);
		try {
			int i = 0;
			int flag = 0;
			String str = new String();
			String str1 = new String();
			int n = 0, cnt;
			int updateQuery;
			PreparedStatement pstatement = null;
			PreparedStatement pstatement1 = null;
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedback_main", "Deva", "dev123456");
			Statement st = con.createStatement();
			Statement st1 = con.createStatement();
			XSSFRow row;
			FileInputStream fis = new FileInputStream(f);
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			XSSFSheet spreadsheet = workbook.getSheetAt(0);
			Iterator<Row> rowIterator = spreadsheet.iterator();
			String[] names = new String[6];
			int j = 0;
			int maxid;
			String sql = "select max(qid) as mqid from question";
			ResultSet resultSet1 = st1.executeQuery(sql);
			if(resultSet1.next()){
				String temp = resultSet1.getString("mqid");
				if(temp != null)
					maxid = Integer.parseInt(temp);
				else
					maxid = 0;
			}
			else
				maxid = 0;
			System.out.println("MAX: "+maxid);
		
			while (rowIterator.hasNext()) {
				if(flag == 0){
					row = (XSSFRow) rowIterator.next(); //for skipping Header Row	
				}
				flag = 1;
				row = (XSSFRow) rowIterator.next();
				
				Iterator<Cell> cellIterator = row.cellIterator();
				j =0 ;
				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					switch (cell.getCellType()) {
					case NUMERIC:
						n = (int) cell.getNumericCellValue();
						System.out.println(n);
						break;

					case STRING:
						names[j] = cell.getStringCellValue();
						j++;
						break;
					}

					}
					//System.out.println(names[j]);
					
						
					String queryString = "INSERT INTO question(qid,question,option1,option2,option3,option4) VALUES (?,?,?,?,?,?)";
					pstatement = con.prepareStatement(queryString);
					
					pstatement.setInt(1, n+maxid);
					pstatement.setString(2, names[0]);
					pstatement.setString(3, names[1]);
					pstatement.setString(4, names[2]);
					pstatement.setString(5, names[3]);
					pstatement.setString(6, names[4]);
					
					updateQuery = pstatement.executeUpdate();

					Statement stmt = con.createStatement();
					int m = stmt.executeUpdate("insert into temp_ques values('"+temp_name+"',"+(n+maxid)+")");
			}
			

			if (f.delete()) {
						response.sendRedirect("addquestion.jsp");
			}
			
		} catch (Exception e) {
			//out.println(e.getMessage());
			response.sendRedirect("addquestion.jsp");
		}
	%>



</body>
</html>