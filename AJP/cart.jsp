<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Shopping Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            margin-top: 30px;
        }
        ul {
            list-style-type: none;
        }
    </style>
</head>
<body>
    <h1>Item List</h1>
    <ul>
        <%
            java.util.Enumeration<String> itemNames = session.getAttributeNames();
            boolean hasItems = false;
            while (itemNames.hasMoreElements()) {
                String item = itemNames.nextElement();
                String value = (String) session.getAttribute(item);
                hasItems = true;
        %>
            <li><strong><%= item %></strong>: Quantity <%= value %></li>
        <%
            }
            if (!hasItems) {
        %>
            <li>No items in the cart.</li>
        <%
            }
        %>
    </ul>
    <br>
    <a href="index.jsp">Continue Shopping</a>
</body>
</html>
