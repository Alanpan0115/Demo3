<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>

<head>

</head>


<body>

    <%			
					sql = "SELECT * FROM `member` WHERE id = '" + session.getAttribute("member") + "'";
					ResultSet rs = con.createStatement().executeQuery(sql);
					rs.next();
					String oldpsw="";
					oldpsw=request.getParameter("oldpsw");
					String newpsw="";
					newpsw=request.getParameter("newpsw");
					String newpsw2="";
					newpsw2=request.getParameter("newpsw2");
					String psw=rs.getString("psw");
					if(oldpsw.equals(psw))
					{
						if(newpsw.equals(newpsw2))
						{
						sql = "UPDATE `member` SET psw = '" + newpsw + "' WHERE id = '" +session.getAttribute("member")+ "'";
						con.createStatement().executeUpdate(sql);

    %>
修改成功3秒後自動跳轉<meta http-equiv="refresh" content="3; url=member.jsp">
</br><h2> <a href="member.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
</body>
    <%						
						}
						else
						{
	%>
兩次密碼輸入不同3秒後自動跳轉<meta http-equiv="refresh" content="3; url=member.jsp">
</br><h2> <a href="member.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
	<%							
						}
					}
					else
					{
	
	%>
密碼輸入錯誤3秒後自動跳轉<meta http-equiv="refresh" content="3; url=member.jsp">
</br><h2> <a href="member.jsp" style="text-decoration:none;">點我立即跳轉</a></h2>
    <%		
					}
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
