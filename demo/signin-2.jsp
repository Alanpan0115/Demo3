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
				if ((id != null && !id.equals("")) && (psw != null && !psw.equals(""))) 
			{
				    sql = "SELECT * FROM `member` WHERE id = 'admin' AND id = '" + id + "' AND psw = '" + psw + "'";
                    ResultSet rs  = con.createStatement().executeQuery(sql);
					if (rs.next()) 
					{
                        session.setAttribute("member", id);
                        session.setAttribute("admin", id);
    %>
   管理員來啦3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
   </br><h2> <a href="index.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
    <%
                    }
						
						else
						{
							
											
						sql = "SELECT * FROM `member` WHERE id=? AND psw=?";
						PreparedStatement psmt = null;
						psmt=con.prepareStatement(sql);
						psmt.setString(1,id);
						psmt.setString(2,psw);
						ResultSet rs2 = psmt.executeQuery();
						
                        if (rs2.next()) 
						{
                            session.setAttribute("member", id);
    %>
    登入成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>

    <%

                        }
                    
                        else 
						{
                            sql = "SELECT * FROM `member` WHERE id = '" + id + "' AND psw != '" + psw + "'";
                            ResultSet rs3 = con.createStatement().executeQuery(sql);

                            if (rs3.next()) 
							{
    %>
	密碼錯誤3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
    <%
                            }
                            else 
							{
    %>
    找不到您的帳戶!!3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
    <%
                            }
                        }
						}
             }
                else 
				{
    %>
	請填妥您的資料再送出!!3秒後自動跳轉<meta http-equiv="refresh" content="3; url=index.jsp">
	  </br><h2> <a href="index.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
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
