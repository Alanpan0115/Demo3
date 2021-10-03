<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>

</head>


<body>

    <%			

				String product = request.getParameter("productid");
				int total = Integer.parseInt(request.getParameter("total"));
				sql = "SELECT stock FROM product WHERE productid = '" + product + "'";
				ResultSet rs = con.createStatement().executeQuery(sql);
				int stock = 0;
				rs.next();
				stock = Integer.parseInt(rs.getString("stock"));
				
				sql = "SELECT * FROM car WHERE memberid = '" + session.getAttribute("member") + "'";
                ResultSet rs2 = con.createStatement().executeQuery(sql);
				int orderid=0;       
                int num = 0;
                Date ordertime = new Date();
                SimpleDateFormat dateft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");

                while (rs2.next()) 
				{
                    product  = rs2.getString("productid");     					
                    num = Integer.parseInt(rs2.getString("num"));
					
					String sql1 = "SELECT countsum FROM counter" ; 
					ResultSet rs3 =  con.createStatement().executeQuery(sql1);
					rs3.next();
					int count=rs3.getInt("countsum");
					count++;
					orderid=count;
					sql = "UPDATE counter SET countsum="+String.valueOf(count);
					con.createStatement().executeUpdate(sql);
					
                    sql = "UPDATE product SET stock = '" + (stock-num) + "' WHERE productid = '" + product + "'";
                    con.createStatement().executeUpdate(sql);
					
                    sql = "INSERT INTO orderlist(orderid,id, productid, num, ordertime) VALUES('" + orderid + "','" + session.getAttribute("member") + "', '" + product + "', '" + num + "', '" + (dateft.format(ordertime)).toString() + "')";
                    con.createStatement().executeUpdate(sql);
                }

                sql = "DELETE FROM car WHERE memberid = '" + session.getAttribute("member") + "'";
                con.createStatement().executeUpdate(sql);
				
				sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("member") + "'";
				ResultSet rs4 = con.createStatement().executeQuery(sql);
				rs4.next();
				int total2=Integer.parseInt(rs4.getString("total"));				
					sql = "UPDATE `member` SET total = '" + (total+total) + "' WHERE id = '" +session.getAttribute("member")+ "'";
                    con.createStatement().executeUpdate(sql);					
				
					
				

    %>
購買成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=car.jsp">
   </br><h2> <a href="car.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
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
