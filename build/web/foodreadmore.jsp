<%-- 
    Document   : foodreadmore
    Created on : 11-Apr-2019, 18:16:17
    Author     : Bishnu
--%>
<%@page import="java.sql.ResultSet"%>
<%@include file="customerheader.jsp" %>

<%
    DbUse food = new DbUse();
    String foodId = request.getParameter("foodId").trim();
    String food_name = food.FoodNameById(foodId);
    //out.print(foodId);
    ResultSet result = food.FoodItemById(Integer.valueOf(foodId));
    result.first();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<section class="information">
    <h3 class="heading-three text-center">
        <%=food_name%>
    </h3>
    <div class="container-fluid food-display-table">
        <div class="table-content">
            <table cellspacing="0" class="table table-striped table-responsive table-sm" >
                <div class="row food-row">
                    <div class="col-sm-6 cat_size">
                        <img src="upload/<%=result.getString(6)%>" width="400" height="300" class="cat_image"/>
                    </div>
                    <div class="col-md-6 food-det-row">
                        <label>Food Name: <%= result.getString(3)%></label>
                        <label>Description: <p><%= result.getString(4)%></p></label>
                        <label>Price <p><%= result.getString(5)%></p></label>
                        <br>
                         <a href="addtocart.jsp?&foodId=<%=result.getString(1)%>" class="btn btn-danger order-btn cart-btn" role="button">Add To Cart</a>
                    </div>
                </div>
            </table>
        </div>
    </div>
</section>
<%@include file="footer.jsp" %>
