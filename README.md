# E-Commerce App - HavaHavai Challenge

This is an E-Commerce product and cart page application developed for the **HavaHavai Challenge**. The app fetches products from an API, allows users to add them to a cart, and utilizes state management for efficient updates.

## Features

- **Product Listing**: Fetches products dynamically from the given API.
- **Cart Management**: Add and remove items from the cart.
- **State Management**: Implemented using the `Provider` package.
- **API Integration**: Used `http` package for fetching product data.
- **Notifications**: Integrated `ElegantNotification` package to show success messages when adding products to the cart.

## Technologies Used

- **Flutter**
- **Dart**
- **Provider (State Management)**
- **http (API Requests)**
- **ElegantNotification (User Notifications)**

## Project Directory Structure

```
EcommerceApp/
│── lib/
│   ├── main.dart                    # Entry point of the app
│   ├── Screen/
│   │   ├── productpage.dart         # Displays list of products
│   │   ├── addtocartpage.dart       # Displays cart contents
│   ├── models/
│   │   ├── product.dart             # Product model
│   │   ├── cart_item.dart           # Cart item model
│   │   ├── product_tile.dart        # UI component for product listing
│   │   ├── addtocart_tile.dart      # UI component for cart items
│   │   ├── notification.dart        # Manages notifications
│   │   ├── cart_model.dart          # Manages cart data
│   ├── provider/
│   │   ├── cart_provider.dart       # Manages cart state
│── pubspec.yaml                     # Dependencies and project configuration
│── README.md                        # Project documentation
```

## Installation & Setup

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/ecommerce-app.git
   cd ecommerce-app
   ```

2. **Install Dependencies**:
   ```sh
   flutter pub get
   ```

3. **Run the App**:
   ```sh
   flutter run
   ```

## API Used
- **Endpoint**: `https://dummyjson.com/products`
- **Data Fetched**: Product details such as title, price, discount percentage, brand, and images.
<img width="365" alt="Screenshot 2025-03-26 010906" src="https://github.com/user-attachments/assets/11e34b08-cc3c-4a69-8c73-004c63283c1b" />
<img width="367" alt="Screenshot 2025-03-26 010849" src="https://github.com/user-attachments/assets/ffe2c13c-35c8-4566-8866-238c67eb78bb" />

<img width="365" alt="Screenshot 2025-03-26 010918" src="https://github.com/user-attachments/assets/c39012dc-3185-43ad-aefe-a1b86e8f4b93" />
<img width="367" alt="Screenshot 2025-03-26 010928" src="https://github.com/user-attachments/assets/c957a6fa-5c7e-4fd0-b432-b1d962232c55" />

## Screenshots

