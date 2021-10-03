<!DOCTYPE html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<%@include file="config.jsp" %>
<html lang="en">
	<head>
		<meta charset="UTF-8">
		<title>Egggg Mouse</title>
	<style>
	a{
		text-decoration:none;
		color:black;
	}
	</style>
	</head>
	<body>
<%
		String Page = request.getParameter("page");
		String previousPage = "product.jsp?page=" + Page;
		sql = "SELECT * FROM product WHERE productid = '" + Page + "'";
		ResultSet rs = con.createStatement().executeQuery(sql);
		
		String id = "";
		String name = "";
		int price = 0;
		int stock = 0;
		
		

		if (rs.next()) 
		{
			id = rs.getString("productid");
			name = rs.getString("name");
			stock = Integer.parseInt(rs.getString("stock"));
			price = Integer.parseInt(rs.getString("price"));
		}
		
	%>
產品:<%=name%>	價錢:<%=price%> 庫存:<%=stock%>	<br><br><br>
<form action="addcar.jsp">
請輸入購買數量:<input type="number" min="1" name="num"><br><br>
								<%
									if(stock==0)
										{
								%>
										<div class="buy">
					                        	庫存不足
					                    </div>
								
								<%								
										}
										else
										{
								%>
								
										<input class="buy" type="submit" value="加入購物車"><br><br>
										
										<a href="car.jsp">
					                        	結帳
										</a>
					                    				              
								<%
										
										}
								%>
<input name="price" value="<%=price%>" hidden>	
<input name="stock" value="<%=stock%>" hidden>							
<input name="op" value="add" hidden>
<input name="productid" value="<%=id%>" hidden>
</form>
			<form  method="GET" action="board.jsp" style="margin-top:50px;">

                <input type="radio" id="star5" name="star" value="好評" CHECKED hidden/>
                <label for="star5" title="text">好評</label>
                <input type="radio" id="star4" name="star" value="不錯" hidden/>
                <label for="star4" title="text">不錯</label>
                <input type="radio" id="star3" name="star" value="普通" hidden/>
                <label for="star3" title="text">普通</label>
                <input type="radio" id="star2" name="star" value="待加強" hidden/>
                <label for="star2" title="text">待加強</label>
                <input type="radio" id="star1" name="star" value="超爛" hidden/>
                <label for="star1" title="text">超爛</label>


                <div class="contentname" >
					留言者:<%=session.getAttribute("member")%>
                </div> 

                <textarea name="feadback" cols="20" rows="5" wrap="hard" maxlength="100"  style="margin-bottom:50px;" required></textarea>
	

                    <button type="submit">送出留言</button>

			
				<input name="id" value="<%=id%>" hidden>
            </form>

 
		


                
				
               <%
													sql = "SELECT * FROM `board` WHERE productid = '" + Page + "'";
													ResultSet rs4 = con.createStatement().executeQuery(sql);
													String star = "";
													String submittime = "";
													String feadback = "";
													String memberid="";
													if (rs4.next() == false) 
													{
												%>
				<%
													}
													else
													{
														
													
													ResultSet rs5 = con.createStatement().executeQuery(sql);
													rs5.last();
													int total_page = rs5.getRow();
												%>

												<%
												
												ResultSet rs6 = con.createStatement().executeQuery(sql);
	
												while (rs6.next()) 
												{
												memberid = rs6.getString("id");
												star = rs6.getString("star");
												submittime = rs6.getString("submittime");
												feadback = rs6.getString("feadback");

												%>
<br><br>   
                                                <%=memberid%>覺得:<%=star%><br><br>            
                                                留言時間:<%=submittime%><br><br>
												<%=feadback%><br><br>
												<hr width="300px" style="float:left">
												<%
													}
													}
												%>
												 

<br><br>
<a href="product.jsp">看其他商品</a>
<a href="index.jsp">回首頁</a>
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