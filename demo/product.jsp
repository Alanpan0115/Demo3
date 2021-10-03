<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Egggg Mouse</title>
	<style>
	a{
		text-decoration:none;
		color:black;
	}
	</style>
	</head>
	<body>
	<select size="1" onchange="location = this.value;">
					<option value="1" disabled selected hidden>Sort</option>
					<option value="product.jsp?filter=priceHtoL">價格高->低</option>
					<option value="product.jsp?filter=priceLtoH">價格低->高</option>
					<option value="product.jsp?filter=hot">熱門高->低</option>
	</select><br><br><br>
				<form action="">
					<input type="text" placeholder="search something..." name="search" required>
					<button type="submit">搜尋</button>
				</form>
			<br><br><br>

			<div >
				<%
					String filter = request.getParameter("filter");
					String search = request.getParameter("search");

					if (filter != null || search != null) 
					{

						if (filter != null) {
							if (filter.equals("priceHtoL")) {
								sql = "SELECT * FROM product ORDER BY price DESC";
							}
							if (filter.equals("priceLtoH")) {
								sql = "SELECT * FROM product ORDER BY price";
							}
							if (filter.equals("hot")) {
								sql = "SELECT * FROM product ORDER BY stock";
							}

						}

						if (search != null) {
							sql = "SELECT * FROM product WHERE name LIKE '%"+search+"%'";
						}

					}
					else {
						sql = "SELECT * FROM product";
					}

					ResultSet rs = con.createStatement().executeQuery(sql);
					



				

					while (rs.next()) {
						
					String name = "";
					int id=0;
							name = rs.getString("name");
							id = rs.getInt("productid");
				%>
							<p><a href="mouse.jsp?page=<%=id%>"><h1><%=name%></h1></a><p>
									
				<%
						}
				
				%>
				<a href="index.jsp">回首頁</a>
	</body>
	    <%	
                con.close();        
				            }

            catch (SQLException sExec) {
                out.println("SQL錯誤!" + sExec.toString());
            }
        }

        catch (ClassNotFoundException err) {
            out.println("class錯誤" + err.toString());
        }
    %>
</html>