<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>

</head>


<body>


    <%

				String memberid = (String)session.getAttribute("member");

                String op = request.getParameter("op");
				String productid = request.getParameter("productid");
                if (op.equals("add")) 
				{

                    int num= Integer.parseInt(request.getParameter("num"));
                    int stock = Integer.parseInt(request.getParameter("stock"));
					int price = Integer.parseInt(request.getParameter("price"));
                    if (num > stock) 
					{
    %>
   庫存不足3秒後自動跳轉<meta http-equiv="refresh" content="3; url=mouse.jsp?page=<%=productid%>">
   </br><h2> <a href="mouse?page=<%=productid%>" style="text-decoration:none;">點我立即跳轉</a></h2>
    <%
                    }

                    else 
					{
						    
							
							int carid=0;
							
							String sql1 = "SELECT countcar FROM counter" ; 
							ResultSet rs =  con.createStatement().executeQuery(sql1);
							rs.next();
							int count=rs.getInt("countcar");
							count++;
							carid=count;
							sql = "UPDATE counter SET countcar="+String.valueOf(count);
							con.createStatement().executeUpdate(sql);





                        sql = "INSERT INTO car(carid,productid, memberid, price, num, total) VALUES";
                        sql += "('" + carid + "','" + productid + "', '" + memberid + "', '" + price + "', '" + num + "', '" + price*num + "')";
                        con.createStatement().execute(sql);
    %>
成功加入購物車3秒後自動跳轉<meta http-equiv="refresh" content="3; url=mouse.jsp?page=<%=productid%>">
   </br><h2> <a href="mouse.jsp?page=<%=productid%>" style="text-decoration:none;">繼續購物</a></h2>
    <%

                    }
                }

                if (op.equals("del")) 
				{

                    String carid =request.getParameter("carid");
                    sql = "DELETE FROM car WHERE carid = " + carid;
                    con.createStatement().executeUpdate(sql);
    %>
成功移出購物車3秒後自動跳轉<meta http-equiv="refresh" content="3; url=car.jsp">
   </br><h2> <a href="car.jsp" style="text-decoration:none;">繼續結帳</a></h2>
    <%

                }

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
