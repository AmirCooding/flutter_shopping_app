<div style="display: flex; align-items: center;">
  <!-- Linke Seite mit Titel -->
  <h1>UStore</h1>

  <!-- Rechte Seite mit Logo -->
  <img src="https://github.com/user-attachments/assets/cbd7f3e0-8f17-46c7-b8f6-a83cc76d4de9" style="width: 100px; height: 100px; margin-left: 10px;" alt="Logo">
</div>





## Overview

This project is a comprehensive online shopping application designed to provide users with a seamless shopping experience. Leveraging the power of Flutter, this app offers a variety of features to enhance user interaction and convenience.




## Features

- **Product Browsing**:  
  Explore a wide range of products across various categories. The product data (including names, prices, and images) is dynamically pulled from Firestore to ensure that the app can easily scale with more products without requiring code changes.

- **Dynamic Images**:  
  Product images are served dynamically from Firestore, allowing you to update, add, or remove images in real-time without modifying the app. This ensures the app stays up-to-date with minimal maintenance.

- **Shopping Cart**:  
  Add desired products to the shopping cart for a streamlined purchasing process. Cart data is stored locally to optimize performance, with syncing capabilities for user accounts once logged in.

- **Secure Checkout**:  
  Complete your purchase with a secure and easy-to-follow checkout process. This feature integrates with Firebase for user authentication and payment processing, ensuring security and reliability.

- **User Authentication**:  
  Secure login and registration using Firebase Authentication. Supports Google, Facebook, and email/password login methods, providing users with flexibility and security.

- **Wishlist**:  
  Save favorite products for later purchases. The wishlist data is synced across devices using Firestore, allowing users to access their saved items anytime, anywhere.

- **Order Tracking**:  
  Users can track their order status in real-time. Order status and shipping data are fetched from Firestore, ensuring that updates are instantly reflected in the app.

- **Push Notifications**:  
  Stay updated with the latest deals, discounts, and order updates. Push notifications are integrated with Firebase Cloud Messaging to ensure timely alerts.

- **Search Functionality**:  
  Easily find products with an advanced search and filter system. The search is optimized to handle large datasets and provide fast, relevant results, even as the number of products grows.

- **Multi-language Support**:  
  Supports multiple languages using internationalization. The app dynamically loads the correct translations from Firestore, making it easy to add new languages without requiring code changes. This ensures scalability for global audiences.

- **Favorites**:  
  Easily mark products as favorites for quick access later. This feature stores user preferences in Firestore for persistence across sessions.

- **Dark and Light Theme**:  
  Toggle between dark and light modes to suit your preferences. The theme preference is stored locally and can be synced with the user's account, ensuring consistency across devices.

- **Localization via Firestore**:  
  All app text, labels, and messages are dynamically fetched from Firestore, making localization efficient and easily updatable. This means adding new languages or modifying existing ones doesn't require a code release, enabling a truly scalable global solution.

- **Scalable and High-Performance Architecture**:  
  The application is built to scale easily with an optimized Firebase Firestore backend, making it capable of handling large amounts of data (products, orders, etc.) and many concurrent users without performance degradation.

- **Testable and Maintainable Codebase**:  
  The application is built following best practices for scalability, modularity, and testability. It includes unit and integration tests to ensure reliability and maintainability as the app grows and evolves.

- **And More**:  
  Additional features and enhancements are continuously being developed to provide an optimized shopping experience.



## Technologies Used

- **State Management**: Bloc & Cubit
- **Dependency Injection**: GetIt
- **pattern**: Repository Pattern
- **Architecture**: Architecture is based on feature-based approach.
- **Localization**: Intl
- **Local Storage**: Shared Preferences
- **Image Optimization**: Cached Network Image
- **Navigation**: Persistent Bottom Navbar
- **Network Requests**: Dio
- **Database**: Firebase Firestore
- **API**: [fakestoreapi](https://fakestoreapi.com/)
- **Debugging & Logging**: Logger
- **Data Synchronization**: Synchronize
- **UI Enhancements**:
  - Flutter Sliders
  - Flutter HTML (for rendering HTML content)
- **External Services**:
  - Google Maps Flutter (for map integration)
- **Utilities**:
  - Android SMS Retriever (for auto-filling OTPs)
  - Image Picker (for image selection)
  - Shamsi Date (for Persian calendar support)
  - Currency Text Input Formatter (for formatted currency inputs)



## Modern Light Theme – German Edition

<div style="display: flex; justify-content: space-between; flex-wrap: nowrap;">
  <img src="https://github.com/user-attachments/assets/33228f24-5aea-47c7-a442-6c6077211818" style="width: 150px; height: 300px;" alt="Bild 1">
  <img src="https://github.com/user-attachments/assets/7aad5519-44f4-49b8-b60d-095b0d2f0e6f" style="width: 150px; height: 300px;" alt="Bild 2">
  <img src="https://github.com/user-attachments/assets/b92ea2c4-e2ab-4567-ba97-626a1b18cdd4" style="width: 150px; height: 300px;" alt="Bild 3">
  <img src="https://github.com/user-attachments/assets/92b9c503-8ab3-4f3b-a3f5-a4c5918d0d1c" style="width: 150px; height: 300px;" alt="Bild 4">
  <img src="https://github.com/user-attachments/assets/337e3063-253a-42f2-9055-6e8fe43f3aab" style="width: 150px; height: 300px;" alt="Bild 5">

</div>


## Modern Dark Theme – English Edition

<div style="display: flex; justify-content: space-between; flex-wrap: nowrap;">
   <img src="https://github.com/user-attachments/assets/6bb9ce30-5fa5-4318-8dd4-2a836a7130f4" style="width: 150px; height: 300px;" alt="Bild 1">
   <img src="https://github.com/user-attachments/assets/8454e208-52e1-41f5-ab33-d04cc3b923f9" style="width: 150px; height: 300px;" alt="Bild 2">
   <img src="https://github.com/user-attachments/assets/5fcc001f-67f2-4201-b8b2-def7800fd27c" style="width: 150px; height: 300px;" alt="Bild 3">
   <img src="https://github.com/user-attachments/assets/5d2d93da-8d14-4256-bf17-c904bc0ea4e8" style="width: 150px; height: 300px;" alt="Bild 4">
   <img src="https://github.com/user-attachments/assets/fc8bf12e-5112-4bf7-b0be-9eab951b75d5" style="width: 150px; height: 300px;" alt="Bild 5">
</div>





## Objective

The main goal of this project is to combine practical application development with a deep dive into Flutter’s capabilities, ultimately creating a robust and user-friendly shopping experience.

## Installation & Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/AmirCooding/flutter-shopping-app.git
   ```
2. Navigate to the project directory:
   ```sh
   cd flutter-shopping-app
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the application:
   ```sh
   flutter run
   ```

## Contribution

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch.
3. Make your changes.
4. Submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.


