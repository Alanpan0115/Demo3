<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>
    
</head>


<body>
  


    <%
				String id = request.getParameter("id");
                String psw = request.getParameter("psw");
				String psw2 = request.getParameter("psw2");
                String email = request.getParameter("email");


                if(psw.equals(psw2))
				{   

                        sql = "SELECT * FROM `member` WHERE id = '" + id + "'";
                        ResultSet rs2 = con.createStatement().executeQuery(sql);


                        if (rs2.next()) 
						{
    %>
   此帳號已經有人使用過囉!!3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
    <%
                        }
						else
						{
							sql = "SELECT * FROM `member` WHERE email = '" + email + "'";
							ResultSet rs3 = con.createStatement().executeQuery(sql);
							if (rs3.next()) 
							{
    %>
   此電子郵件已經有人使用過囉!!3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
    <%
							}
						 

                       

							else 
							{
								sql = "INSERT `member`(id, psw, email,total) VALUES('" + id + "', '" + psw + "', '" + email + "','0')";
								con.createStatement().execute(sql);
								session.setAttribute("member", id);
    %>
    註冊成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
    <%
							}
						}
					
			
				}
				else
				{
    %>
								
	兩次密碼輸入不同3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	</br><h2> <a href="index.jsp" style="text-decoration:none;">點我回到首頁</a></h2>
		
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
