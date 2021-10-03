<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Egggg Mouse</title>
	</head>
	<body>
	歡迎來到 Egggg Mouse<br><br>
		<%
											if (session.getAttribute("member") != null) 
											{
												sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("member") + "'";
												ResultSet rs2 = con.createStatement().executeQuery(sql);
												
												if (rs2.next()) 
												{
												
													String member = rs2.getString(1);
													
										%>
				
				<form  action="signout.jsp" method="post">
				<button  >歡迎<%=member%>/登出</button><br><br>
				</form>
										<%
												}
												
													if (session.getAttribute("admin") != null) 
													{
													sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("admin") + "'";
													ResultSet rs3 = con.createStatement().executeQuery(sql);
													
													if (rs3.next()) 
													{
										%>
										<a href="manager.jsp"><button  style="width:auto;">後臺管理</button></a>
										<%
													}
													}
												else
													{
										%>
										<a href="member.jsp"><button  style="width:auto;">會員中心</button></a>
										<a href="product.jsp"><button  style="width:auto;">來去shopping</button></a>
										<a href="car.jsp"><button  style="width:auto;">購物車</button></a><br><br>
										<%
													}
											}
												else
												{
										%>
										
				<a href="signin-1.jsp"><button>登入</button></a>
				<a href="signup-1.jsp"><button>註冊</button></a>
										<%
												}
											
										%>
<%
					
					String sql1 = "SELECT countnum FROM counter" ; 
					ResultSet rs =  con.createStatement().executeQuery(sql1);
					rs.next();
					int count=rs.getInt("countnum");
					
									
					 if(session.isNew()){
						 count++;
						 
						 sql = "UPDATE counter SET countnum="+String.valueOf(count);
						 con.createStatement().executeUpdate(sql);
						 
						 
					 } 
                    out.print("你是第"+count+"位訪客");
					
					

%>
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