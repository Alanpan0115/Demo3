<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp"%>

<!DOCTYPE html>
<html>


<head>

</head>


<body>
<form action="signin-2.jsp">
帳號:<input type="text" name="id" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required><br><br><br>
密碼:<input type="password" name="psw" onkeyup="value=value.replace(/[\W]/g,'') " onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''))" required><br><br><br>
<input type="submit" value="送出"> 
</form>
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
