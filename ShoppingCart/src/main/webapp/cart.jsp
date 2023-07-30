<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Collection" %>
<%@ page import="com.cart.CartItem" %> 

<%
    @SuppressWarnings("unchecked")
    Collection<CartItem> cart = (Collection<CartItem>) request.getAttribute("cart");
    int cartValue = (int) request.getAttribute("cartValue");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Shopping Cart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand">Online Shopping Cart</a>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container" style="padding: 20px;">
        <table class="table table-bordered">
            <tr>
                <th>Item</th>
                <th>Quantity</th>
                <th>Price</th>
                <th>Total</th>
                <th>Actions</th>
            </tr>
            <% for (CartItem item : cart) { %>
                <tr>
                    <td><%= item.getName() %></td>
                    <td>
                        <form action="cart" method="get">
                            <input type="hidden" name="item" value="<%= item.getName() %>">
                            <input type="hidden" name="action" value="add">
                            <input type="hidden" name="price" value="<%= item.getPrice() %>">
                            <input type="number" class="form-control" name="quantity" value="<%= item.getQuantity() %>" onchange="this.form.submit()">
                        </form>
                    </td>
                    <td>$<%= item.getPrice() %></td>
                    <td>$<%= item.getPrice() * item.getQuantity() %></td>
                    <td>
                        <form action="cart" method="get">
                            <input type="hidden" name="item" value="<%= item.getName() %>">
                            <input type="hidden" name="action" value="remove">
                            <button type="submit" class="btn btn-danger">Remove</button>
                        </form>
                    </td>
                </tr>
            <% } %>
        </table>
        <p style="font-weight: bold;">Cart Value:</p><p> $<%= cartValue %></p>
        <a href="index.jsp" class="btn btn-primary">Continue Shopping</a>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
