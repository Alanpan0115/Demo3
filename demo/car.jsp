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

				<table width="300px">
				<tr>
					<td>產品</td>
					<td>價格</td>
					<td>數量</td>
					<td>小計</td>
					<td>刪除商品</td>
				</tr>
				<form action="addcar.jsp">
					<%
					sql = "SELECT * FROM car WHERE memberid = '" + session.getAttribute("member") + "'";
					ResultSet rs5 = con.createStatement().executeQuery(sql);
					String carid = "";
					String memberid = "";
					int price = 0;
					int total=0;
					int num=0;
					String name="";
					String productid="";
					while(rs5.next())
					{	
						carid = rs5.getString("carid");
						productid = rs5.getString("productid");
						memberid = rs5.getString("memberid");
						price = Integer.parseInt(rs5.getString("price"));
						num = Integer.parseInt(rs5.getString("num"));
						total = Integer.parseInt(rs5.getString("total"));
					sql = "SELECT * FROM product WHERE productid = '" + productid + "'";
					ResultSet rs = con.createStatement().executeQuery(sql);
					rs.next();
					name=rs.getString("name");
					
					%>
					<tr>
					<td><%=name%></td>
					<td><%=price%></td>
					<td><%=num%></td>
					<td><%=total%></td>
					<td><button type="submit">刪除</button></td>
					</tr>					
				
					<%
					}	
					int total1=0;
					sql = "SELECT SUM(total) FROM car WHERE memberid = '" + session.getAttribute("member") + "'";
					ResultSet rs4 = con.createStatement().executeQuery(sql);
					if (rs4.next()) 
					{
					total1=rs4.getInt(1);
					}
					%>	
					<input name="carid" value="<%=carid%>" hidden>
					<input name="op" value="del" hidden>
					</form>
				</table>
				</div>			
				</div>

			

			


			
			<div class="user1" id="book">
				<h2 class="t">立即下單</h2>
				<div class="solid2">
					
						姓名: <input type="text" name="Name" value="<%=session.getAttribute("member")%>"  required><br><br>
						E-mail: <input type="text" name="E-mail"  required><br><br>
						地址: <input type="text" name="addr"  required><br><br>
						<p class="ta">結帳金額:<%=total1%></p>
						<p class="ta">付款方式:</p>
						<select class="opt1">
							<option value="a">ATM轉帳</option>
							<option value="b"> 信用卡轉帳</option>
							<option value="c">銀行匯款</option>
						</select><br><br><br>
					<%
						if (total != 0) 
						{
					%>
						<form action="sum.jsp">
						<button class="but">結帳</button>
						<input hidden" name="num" value="<%=num%>" hidden>
						<input hidden" name="productid" value="<%=productid%>" hidden>
						<input hidden" name="total" value="<%=total1%>" hidden>
						</form>
					<%
						}
						else {
					%>
                    	<a href="product.jsp"><button class="but">請先挑選商品</button></a>
					<%
						}
					
					%>
				<br><br><br>		
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