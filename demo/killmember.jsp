<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>

</head>


<body>



    <%

                    String id =request.getParameter("id");
					if(id.equals("admin"))
					{
	%>
不能刪除管理員帳號3秒後自動跳轉<meta http-equiv="refresh" content="3; url=manager.jsp">
   </br><h2> <a href="manager.jsp" style="text-decoration:none;">後臺管理</a></h2>
	<%
					}
					else
					{					                    
                    sql = "DELETE FROM `member` WHERE id = '" + id + "'";	
					con.createStatement().executeUpdate(sql);
    %>
成功移移除會員3秒後自動跳轉<meta http-equiv="refresh" content="3; url=manager.jsp">
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
