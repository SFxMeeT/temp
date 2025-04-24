<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession sessionCheckout = request.getSession();
    ArrayList<String> cart = (ArrayList<String>) sessionCheckout.getAttribute("cart");
    ArrayList<Integer> cartPrices = (ArrayList<Integer>) sessionCheckout.getAttribute("cartPrices");
    int total = 0;
    if (cart != null) {
        for (int price : cartPrices) {
            total += price;
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <style>
            table {
                width: 50%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            th, td {
                border: 1px solid black;
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #f4f4f4;
            }
        </style>
    </head>
    <body>
        <h2>Checkout Summary</h2>
        <% if (cart == null || cart.isEmpty()) {%>
        <p>Your cart is empty.</p>
        <% } else {%>
        <table>
            <tr>
                <th>Product</th>
                <th>Price (₹)</th>
            </tr>
            <% for (int i = 0; i < cart.size(); i++) {%>
            <tr>
                <td><%= cart.get(i)%></td>
                <td>₹<%= cartPrices.get(i)%></td>
            </tr>
            <% }%>
            <!-- Row for Total -->
            <tr>
                    <td colspan="2" style="font-weight: bold; text-align: right;">Total Amount: ₹<%=total%></td>
            </tr>
        </table>
        <br>
        <a href="index.html">Go Back to Shopping</a>
        <% }%>
    </body>
</html>