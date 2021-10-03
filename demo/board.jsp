<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.Date, java.text.SimpleDateFormat, java.text.DecimalFormat"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>board</title>
</head>
<body>



    <%

				int boardid=0;
				String productid = request.getParameter("id");
                String id = String.valueOf(session.getAttribute("member"));
				Date submittime = new Date();
                SimpleDateFormat dateft = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
				String star="";
				star = request.getParameter("star");
                String feadback = request.getParameter("feadback");
				
				
				String sql1 = "SELECT countboard FROM `counter`" ; 
				ResultSet rs =  con.createStatement().executeQuery(sql1);
				rs.next();
				int count=rs.getInt("countboard");
				count++;
				boardid=count;
				sql = "UPDATE `counter` SET countboard="+String.valueOf(count);
				con.createStatement().executeUpdate(sql);
				
			    sql = "INSERT  `board`(boardid,productid, id, star, submittime, feadback) VALUES('" + boardid + "','" + productid + "', '" + id + "', '" + star + "', '" + (dateft.format(submittime)).toString() + "', '" + feadback+  "')";
                con.createStatement().execute(sql);

                

    %>
  

			<span  >留言成功!</br>ξ( ✿＞◡❛)</span>
			
			<meta http-equiv="refresh" content="3; url=mouse.jsp?page=<%=productid%>"></br>
			
			
	    

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