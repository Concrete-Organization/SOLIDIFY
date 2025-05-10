# 📱 SOLIDIFY APP OVERVIEW

SOLIDIFY is a mobile application developed using Flutter, designed to revolutionize the construction industry in Egypt by addressing the critical issue of poor concrete quality. The app empowers engineers, concrete companies, and material suppliers with AI-powered tools to estimate concrete strength, a marketplace to source quality materials, and a collaborative community for knowledge sharing. By integrating these features, Solidify aims to reduce building collapses, save costs, and promote sustainable construction practices.

## 🎨  System Design

The app is built using the Clean Architecture pattern, which promotes separation of concerns and makes the codebase more maintainable and testable. This architecture divides the project into three main layers:

UI Layer: Manages the UI and handles user interactions. This layer includes views and widgets.

Logic Layer: Contains state management of app using (flutter_bloc).

Data Layer: Handles data sources such as APIs. This layer includes data models and repositories.

By using Clean Architecture, the project achieves a clear separation between business logic and UI, making it scalable, testable, and easy to maintain.

![SOLIDIFY (1)](https://github.com/user-attachments/assets/e837916d-6476-4bdd-a1d5-d576beecd3e1)

## 📥  Installation

1. **Clone the Repo:**

   Clone the repository to your local machine:

   ```bash
   git clone https://github.com/Concrete-Organization/SOLIDIFY.git

2. **Install Dependencies:**
   ```bash
   flutter pub get

## 📚 **Features**

- **🗺️ App Flows Layouts:**  
A streamlined design for easy navigation between app sections.

- **🔐 Authentication:**  
A secure login system allowing users to create accounts as either concrete companies or engineers. It includes features like "Forgot Password" with OTP (One-Time Password) and password reset for added security.

- **🤖 Chatbot:**  
An AI-powered helper that gives instant answers and advice on topics like concrete quality and project management. Users can ask questions and get personalized tips anytime, making it a handy tool for quick support on the go.

- **🌐 Community:**  
A dedicated space for engineers to connect, share ideas, and solve problems together.

- **🧱 Concrete Strength AI:**  
An intelligent tool that combines concrete mix design with AI-powered strength prediction, ensuring strong and project-appropriate mixes while guaranteeing safety.

- **🏚️ Crack Detection:**  
A smart feature that detects cracks in concrete by analyzing images and suggests solutions to maintain structural integrity.

- **🛒 Marketplace:**  
An in-app store for purchasing high-quality building materials, added by suppliers through their dashboard, with options for comparison and reviews.

- **🌄 Onboarding:**  
A quick guide for new users to easily understand how to use the app from the start.

- **🏢 Company Profile:**  
A space for concrete companies to track their orders (active and completed) and add reviews to completed orders.

- **👷‍♂️ Engineer Profile:**  
A personal space for engineers to change their profile picture and view their posts and comments for easy reference.

## 🧩 Dependencies

The project utilizes various dependencies to enhance functionality and streamline development. These dependencies may be expanded as the project evolves:

- **build_runner:** Build System for Dart code generation and modular compilation.
- **flutter_bloc:** State Management.
- **provider:** State Management.
- **freezed, freezed_annotation:** Code Generation.
- **get_it:** Dependency Injection.
- **json_serializable, json_annotation:** Automatically generate code for converting to and from JSON.
- **dio, retrofit, retrofit_generator, pretty_dio_logger:** Networking.
- **intl, easy_localization:** Localization.
- **flutter_svg:** SVG Rendering.
- **flutter_screenutil:** Screen Adaptation.
- **cached_network_image:** Image Caching.
- **shared_preferences:** Local Storage.
- **flutter_secure_storage:** Secure Storage.
- **Lottie:** Loading Animations Effects.
- **shimmer:** Loading Indicators.
- **google_fonts:** Custom Fonts.
- **image_picker:** Image Selection from Gallery or Camera.
- **file_picker:** File Selection.
- **path_provider:** Access Device File System Paths.
- **path:** Path Manipulation.
- **jwt_decoder:** JWT Token Parsing and Expiration Check.
- **carousel_slider:** Infinite Scroll and Custom Widgets.
- **dio_cookie_manager, cookie_jar:** Cookie Management for HTTP Requests.
- **flutter_native_splash:** Splash Screen Customization.
- **package_info_plus:** App Package Information.
- **image_cropper:** Image Cropping.
- **rxdart:** Reactive Functional Programming for Streams.
- **collection:** Additional collection utilities and enhancements for Dart core collections.

## 🏗️ Solidify App Screens

Solidify App delivers an intuitive user experience through a series of purpose-driven screens tailored to the construction industry. The splash and onboarding screens introduce users to the app’s mission of enhancing construction practices. After secure authentication, engineers and companies are directed to personalized dashboards. Users can estimate concrete strength using AI, detect structural cracks, and explore a marketplace for sourcing construction materials. The app also features a dynamic community hub for knowledge sharing and a responsive chatbot for real-time support. Profile management is streamlined, ensuring easy access to user data and preferences.

## 🌠 Splash & OnBoarding 

<p align="center">
  <img src="https://github.com/user-attachments/assets/286b9c3a-122c-4cd9-9937-ae1076e1b319" width="250"/>
  <img src="https://github.com/user-attachments/assets/c073b0b3-b0da-48c7-ba05-0e3de459e684" width="250"/>
  <img src="https://github.com/user-attachments/assets/0e125cd6-49a1-4459-8355-bc166fdd418e" width="250"/>
  <img src="https://github.com/user-attachments/assets/09253231-e173-4c94-9fe2-508456e39463" width="250"/>
  <img src="https://github.com/user-attachments/assets/1c133450-e573-43d7-82eb-dceb38492c05" width="250"/>
</p>

## 🔐 Authentication
- 🔑 **Login:**
<img src="https://github.com/user-attachments/assets/a6383c14-0907-41a8-8d9e-3654cbcd706d" width="250"/>

- ❓ **Forget Password:**
<img src="https://github.com/user-attachments/assets/06db305d-ec75-4d07-8c19-beeeaaa71882" width="250"/>
<img src="https://github.com/user-attachments/assets/b4b2f449-5e2c-41a5-830b-177654106e6f" width="250"/>
<img src="https://github.com/user-attachments/assets/f3756f05-69a4-4e5a-b509-b41a4afe726d" width="250"/>

- 🏢 **Sign Up as Concrete Company:**
<img src="https://github.com/user-attachments/assets/6901d8ff-2f0e-4370-944a-eb034bc7be0f" width="250"/>
<img src="https://github.com/user-attachments/assets/2495a7a8-4b38-4bc5-a029-cc3b5d4bae84" width="250"/>
<img src="https://github.com/user-attachments/assets/0cb59e0e-979c-4314-910f-3ea974f9fc20" width="250"/>
<img src="https://github.com/user-attachments/assets/8b5354e5-c9b2-40d5-9345-85429a9c46a8" width="250"/>
<img src="https://github.com/user-attachments/assets/c79a9485-41e0-4043-b736-b10eda21047b" width="250"/>
<img src="https://github.com/user-attachments/assets/a88143dd-30be-409e-a509-609175d4824f" width="250"/>

- 🧑‍🔧 **Sign Up as Engineer:**
<img src="https://github.com/user-attachments/assets/03f08834-6c53-4459-8008-8adc2161ffec" width="250"/>
<img src="https://github.com/user-attachments/assets/84d6f459-da94-4275-80d3-98023937ca83" width="250"/>
<img src="https://github.com/user-attachments/assets/4a0e6065-b313-4ebe-bfd4-9d02aee2c48c" width="250"/>
<img src="https://github.com/user-attachments/assets/ab67011f-e542-4fed-86c6-89ecb98ebdea" width="250"/>

## 🛒 MarketPlace
- 🏠 **Home:**
<img src="https://github.com/user-attachments/assets/504837a0-fa9e-4f0d-8c76-3e167e3fe438" width="250"/>
<img src="https://github.com/user-attachments/assets/e9b8a0a5-20fa-4764-b193-611e83eac378" width="250"/>
<img src="https://github.com/user-attachments/assets/a71319d8-19cd-49c0-90fe-fb951c5bad38" width="250"/>

- 🛍️ **Products Details & Favorites:**
<img src="https://github.com/user-attachments/assets/5fc45563-6d11-4f9d-800b-5d1bb2934c3b" width="250"/>
<img src="https://github.com/user-attachments/assets/cb8ebedf-da43-4776-b56b-1e912ec0496d" width="250"/>
<img src="https://github.com/user-attachments/assets/11ea36f3-02a2-4807-b47c-100e10672c09" width="250"/>

- 🔍 **Search & Filters:**
<img src="https://github.com/user-attachments/assets/902edc55-5454-47a9-af54-b364ca2e2f8e" width="250"/>
<img src="https://github.com/user-attachments/assets/9feba023-88d7-4691-ae4e-00ec8e33239d" width="250"/>
<img src="https://github.com/user-attachments/assets/49b10cc3-a86d-47d5-b8b6-32ffb773750c" width="250"/>

- 📝 **Review & Write Review:**
<img src="https://github.com/user-attachments/assets/9accacf5-b662-4e6d-b95d-e358fecb3547" width="250"/>
<img src="https://github.com/user-attachments/assets/e026305d-7ceb-46d8-8377-85605fc1d3c2" width="250"/>
<img src="https://github.com/user-attachments/assets/8fdd1671-414e-4069-97ac-2574fabeb51a" width="250"/>

- 💰 **Cart & Cash on Delivery:**
<img src="https://github.com/user-attachments/assets/6ed37664-74d9-4601-8e33-916293222a15" width="250"/>
<img src="https://github.com/user-attachments/assets/ce086ae2-7643-4b6b-b2a2-4eeff39cdbd1" width="250"/>
<img src="https://github.com/user-attachments/assets/1d0c834f-4688-470c-96e4-8aac629c88db" width="250"/>



