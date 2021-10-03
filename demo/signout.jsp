<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

	
<head>
    
</head>


<body>
   
    <%
                session.removeAttribute("member");
                session.removeAttribute("admin");
    %>
    登出成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp"></br>
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
	
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
