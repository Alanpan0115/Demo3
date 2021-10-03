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
<div class="user" id="mdata">											
				<h2 class="t">會員資料</h2>
				<%
					sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("member") + "'";
					ResultSet rs4 = con.createStatement().executeQuery(sql);
					if (rs4.next()) 
					{
													
				%>
				<p class="solid">帳號:<%=rs4.getString("id")%><br> <br>E-mail:<%=rs4.getString("email")%><br><br>累計消費:<%=rs4.getString("total")%>元 </p>
			
			</div>
				<%
					}
				%>
				
				<div class="user"id="mdata1">
					<h1 class="t">修改密碼</h1>
				<form action="update.jsp">
					<label for="psw" class="te"><b>輸入舊密碼</b></label><br>
					<input type="password" style="width:790px;height:100px  placeholder="Enter Password" name="oldpsw" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required><br>
					<label for="psw" class="te"><b>輸入新密碼</b></label><br>
					<input type="password" style="width:790px;height:100px  placeholder="Enter New Password" name="newpsw" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required>		<br>		
					<label for="psw2"class="te"> <b>再次輸入新密碼</b></label><br>
					<input type="password" style="width:790px;height:100px  placeholder="Repeat New Password" name="newpsw2" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required><br>
					
					
				<button class="but">更改</button>
				</form>
				</div>
				


				<h2 class="t">訂單紀錄</h2>
				<div class="solid1" style="overflow-y:scroll;height:300px;">
				<%
					sql = "SELECT * FROM orderlist WHERE id = '" + session.getAttribute("member") + "'";
					ResultSet rs6 = con.createStatement().executeQuery(sql);
					String productid = "";
					int num = 0;
					String ordertime = "";
					while (rs6.next())
					{	
						productid = rs6.getString("productid");
						num = Integer.parseInt(rs6.getString("num"));
						ordertime = rs6.getString("ordertime");
					
					sql = "SELECT * FROM product WHERE productid = '" + productid + "'";
					ResultSet rs = con.createStatement().executeQuery(sql);
					rs.next();
					String name="";
					name=rs.getString("name");
				%>	
				購買商品:<%=name%>
				購買數量:<%=num%>
				購買時間:<%=ordertime%>
				<%
					}
				%>
				</div>



	
			<div class="user" id="comment">
				<h2 class="t">評分/評論紀錄</h2>
				<p class="solid1" style="overflow-y:scroll;height:300px;" >
												<%
													String member=session.getAttribute("member").toString();
													sql = "SELECT * FROM board WHERE id =  '" + member + "' ORDER BY boardid DESC";
													ResultSet rs8 = con.createStatement().executeQuery(sql);
													String star = "";
													String submitTime = "";
													String feadback = "";													
													if (rs8.next() == false) 
													{
												%>目前並無留言
												
												<%
													}
													else
													{
														
													sql = "SELECT * FROM board WHERE id =  '" + member + "' ORDER BY boardid DESC";
													ResultSet rs9 = con.createStatement().executeQuery(sql);
													rs9.last();
													int total_page = rs9.getRow();
												%>
											
												
												<%
												sql = "SELECT * FROM board WHERE id = '" + member + "' ORDER BY boardid DESC";
												ResultSet rs10 = con.createStatement().executeQuery(sql);
	
												while (rs10.next()) 
												{
												String product = rs10.getString("productid");
												star = rs10.getString("star");
												submitTime = rs10.getString("submitTime");
												feadback = rs10.getString("feadback");

												%>
											
											

													評論商品:100元抽獎券<br>
													評價:<%=star%>顆星<br>
													評論時間:<%=submitTime%><br>
													<%=feadback%><br><br>
												
												
													
												<%
												}
												}
												%>
				</p>
			</div>
			

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