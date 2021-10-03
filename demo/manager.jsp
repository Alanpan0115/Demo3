<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>
<!DOCTYPE html>
<html lang="en">
	<%
		

        if (session.getAttribute("admin") == null) {
			response.sendRedirect("../nologin.jsp");
		}
	%>
	<head>
		<meta charset="UTF-8">
		<title>Egggg mouse</title>

	<style>
	a{
		color:black;
		text-decoration:none;
	}
	</style>
	</head>
	<body>

				<h2 class="t">會員管理</h2>

				<form action="manager.jsp">
					<select name="member">
						<option value="0">會員姓名</option>
				<%
				sql = "SELECT * FROM `member`  ";
				ResultSet rs = con.createStatement().executeQuery(sql);
				rs.next();
				while (rs.next()) 
				{


				%>
						
						<option  value="<%=rs.getString("id")%>"><%=rs.getString("id")%></option>	
						
				<%
					
				}
				%>					
					</select>					
		
				<button class="but">選擇會員</button><br><br>
				</form>
				<form action="killmember.jsp">
				<%
				if(request.getParameter("member")!=null)
				{
				String member2=request.getParameter("member");
				sql = "SELECT * FROM `member` WHERE id = '" + member2 + "'";
				ResultSet rs2 = con.createStatement().executeQuery(sql);
				rs2.next();
				String id="";
				String psw="";
				String email="";
				id=rs2.getString("id");
				psw=rs2.getString("psw");
				email=rs2.getString("email");



				%>
				<p class="solid">帳號:<%=id%> <br>密碼:<%=psw%> <br>E-mail:<%=email%></p>	
				<button class="but">刪除會員</button>
				<input hidden name="id" value="<%=id%>" >
				
				<%
				}				
				%>
				</form>

		
			<h2 >商品管理</h2>
				<table >
				<tr>
				<td>編號</td>
				<td>產品名稱</td>
				<td>價格</td>
				<td>庫存</td>
				<td></td>
				<td></td>
				</tr>
				<%
				sql = "SELECT * FROM product  ";
				ResultSet rs6 = con.createStatement().executeQuery(sql);
				while(rs6.next())
				{
				


				%>
				<form action="addpro.jsp">
				<tr>
				<td><%=rs6.getString("productid")%></td>
				<td><input type="text" name="name" value="<%=rs6.getString("name")%>"></td>
				<td><input type="text" name="price" value="<%=rs6.getString("price")%>"></td>
				<td><input type="text" name="stock" value="<%=rs6.getString("stock")%>"></td>
				<td><button type="submit">修改</button></td>
				<td><button type="submie"><a href="addpro.jsp?op=del&id=<%=rs6.getString("productid")%>">刪除</a></button></td>
				</tr>					
						<input hidden name="op" value="upd" >
						<input hidden name="id" value="<%=rs6.getString("productid")%>">

				</form>
				<%
				}
					sql = "SELECT countproduct FROM counter" ; 
					ResultSet rs7 =  con.createStatement().executeQuery(sql);
					rs7.next();
				%>
				<form action="addpro.jsp">
				<tr>
				<td><%=rs7.getInt("countproduct")+1%></td>
				<td><input type="text" name="name"> </td>
				<td><input type="text" name="price"> </td>
				<td><input type="text" name="stock"> </td>
				<td columns="2"><button type="submit">新增</button></td>
				</tr>			
				<input hidden name="id"  value="<%=rs7.getInt("countproduct")+1%>" >
				<input hidden name="op" value="add" >					
						</form>	
				</table>

				
		<br><br>
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