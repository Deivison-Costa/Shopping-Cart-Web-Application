package com.cart;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cart")
public class ShoppingCartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Map<String, CartItem> cart = new HashMap<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String item = request.getParameter("item");
        String price = request.getParameter("price"); // Get the price input from the form
        String quantity = request.getParameter("quantity"); // Get the quantity input from the form

        if (action != null && item != null && price != null && quantity != null) {
            double itemPrice = Double.parseDouble(price);
            int itemQuantity = Integer.parseInt(quantity);
            if (action.equals("add")) {
                addToCart(item, itemPrice, itemQuantity);
            } else if (action.equals("remove")) {
                removeFromCart(item);
            }
        }

        int cartValue = calculateCartValue();
        request.setAttribute("cart", cart.values());
        request.setAttribute("cartValue", cartValue);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    private void addToCart(String item, double price, int quantity) {
        CartItem cartItem = cart.get(item);
        if (cartItem == null) {
            cartItem = new CartItem(item, quantity, price);
            cart.put(item, cartItem);
        } else {
            cartItem.setQuantity(cartItem.getQuantity() + quantity);
        }
    }

    private void removeFromCart(String item) {
        CartItem cartItem = cart.get(item);
        if (cartItem != null) {
            int quantity = cartItem.getQuantity();
            if (quantity > 1) {
                cartItem.setQuantity(quantity - 1);
            } else {
                cart.remove(item);
            }
        }
    }

    private int calculateCartValue() {
        int cartValue = 0;
        for (CartItem item : cart.values()) {
            cartValue += item.getQuantity() * item.getPrice();
        }
        return cartValue;
    }
}