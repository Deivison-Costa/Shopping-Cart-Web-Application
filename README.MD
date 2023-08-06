# Online Shopping Cart Web Application
- This is a simple online shopping cart web application implemented in Java using the Eclipse Enterprise IDE and deployed on the Apache Tomcat server. The application allows users to add items to their shopping cart, view the cart, and remove items from it. 
- The cart's total value is calculated and displayed on the cart page.

![Figure_1](https://github.com/Deivison-Costa/Tasks-Manager/assets/112001225/f4b7066b-8ea3-4d1c-b8fd-04cf0eb2d585)
![Figure_2](https://github.com/Deivison-Costa/Tasks-Manager/assets/112001225/33f47733-1501-4d87-b95e-8e86dd7b1b17)

# Prerequisites
- Java Development Kit (JDK) 8 or higher;
- Eclipse Enterprise IDE (or any Java IDE of your choice);
- Apache Tomcat server;
- Web browser (e.g., Chrome, Firefox).

# How to Run the Application
- Clone or download the project source code from the repository.

- Import the project into Eclipse Enterprise IDE.

## Configure the Apache Tomcat server in Eclipse:

- Click on the "Window" menu and select "Preferences."
- Expand "Server" and click on "Runtime Environments."
- Click "Add..." and select the Apache Tomcat installation directory.
- Click "Finish" to add the Tomcat server.

## Deploy the application on Apache Tomcat:
- Right-click on the project in Eclipse and select "Run As" > "Run on Server."
- Choose the configured Tomcat server and click "Finish."
- Once the server starts, open your web browser and go to http://localhost:8080/ShoppingCart/.

# Application Description
## ShoppingCartServlet.java
- This class serves as the main servlet for handling user requests. It manages the user's shopping cart, allowing items to be added or removed from it. It also calculates the total value of the cart. The servlet listens for requests on the /cart URL.

## CartItem.java
- This is a simple POJO class representing an item in the shopping cart. It contains properties for the item's name, quantity, and price.

## index.jsp
- This is the homepage of the application, where users can add items to their cart. It contains a form with input fields for the item's name, price, and quantity. When the "Add to Cart" button is clicked, the form data is sent to the ShoppingCartServlet to add the item to the cart.

## cart.jsp
- This page displays the contents of the user's shopping cart. It lists the items, their quantities, individual prices, and total prices. Users can update the quantity or remove items from the cart. The total cart value is also displayed on this page.

# Usage
- Open your web browser and go to the application's homepage (index.jsp).
## To add an item to the cart:
- Enter the item's name, price, and quantity in the input fields.
- Click the "Add to Cart" button.

## To view the cart:
- Click the "View Cart" button on the homepage.
- The cart page (cart.jsp) will display the items in the cart, their quantities, prices, and total prices.

## To update the quantity of an item in the cart:
- In the "Quantity" column of the cart, change the quantity value.
- The cart will automatically update with the new total price.

## To remove an item from the cart:
- Click the "Remove" button next to the item you want to remove.
- The item will be removed from the cart.

## To continue shopping:
- Click the "Continue Shopping" button on the cart page.
- You will be redirected back to the homepage to add more items.
