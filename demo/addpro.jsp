<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>

</head>


<body>


    <%

				String op = request.getParameter("op");

                if (op.equals("upd")) 
				{
			
					int id = 0;
					int stock=0;
					int price=0;
				    id=Integer.parseInt(request.getParameter("id"));
					stock =Integer.parseInt(request.getParameter("stock"));
					price =Integer.parseInt(request.getParameter("stock"));
					String name =request.getParameter("name");

                    sql = "UPDATE product SET name = '" + name + "' WHERE productid = '" + id + "'";
					con.createStatement().executeUpdate(sql);
                    sql = "UPDATE product SET price = '" + price + "' WHERE productid = '" + id + "'";
                    con.createStatement().executeUpdate(sql);
                    sql = "UPDATE product SET stock = '" + stock + "' WHERE productid = '" + id + "'";
                    con.createStatement().executeUpdate(sql);



    %>
更新成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=manager.jsp">
   </br><h2> <a href="manager.jsp" style="text-decoration:none;">後臺管理</a></h2>
    </script>
    <%
                }				
                else if (op.equals("add")) 
				{

					int id = 0;
					int stock=0;
					int price=0;
				    id=Integer.parseInt(request.getParameter("id"));
					stock =Integer.parseInt(request.getParameter("stock"));
					price =Integer.parseInt(request.getParameter("price"));
					String name=request.getParameter("name");
							
					String sql1 = "SELECT countproduct FROM counter" ; 
					ResultSet rs =  con.createStatement().executeQuery(sql1);
					rs.next();
					int count=rs.getInt("countproduct");
					count++;
					id=count;
					sql = "UPDATE counter SET countproduct="+String.valueOf(count);
					con.createStatement().executeUpdate(sql);

                    sql = "INSERT INTO product(productid,name,price,stock) VALUES";
					sql += "('" + id + "','" + name + "','" + price + "','" + stock + "')";
                    con.createStatement().execute(sql);
    %>
成功新增獎品3秒後自動跳轉<meta http-equiv="refresh" content="3; url=manager.jsp">
   </br><h2> <a href="manager.jsp" style="text-decoration:none;">後臺管理</a></h2>
    <%
				}

				
                else if (op.equals("del")) 
				{

					
                    String id =request.getParameter("id");
                    sql = "DELETE FROM product WHERE productid = " + id;
                    con.createStatement().executeUpdate(sql);
					String sql1 = "SELECT countproduct FROM counter" ; 
					ResultSet rs =  con.createStatement().executeQuery(sql1);
					rs.next();
					int count=rs.getInt("countproduct");
					count--;
					sql = "UPDATE counter SET countproduct="+String.valueOf(count);
					con.createStatement().executeUpdate(sql);
    %>
成功移除商品3秒後自動跳轉<meta http-equiv="refresh" content="3; url=manager.jsp">
   </br><h2> <a href="manager.jsp" style="text-decoration:none;">後臺管理</a></h2>
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
