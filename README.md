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

![Splash](https://github.com/user-attachments/assets/286b9c3a-122c-4cd9-9937-ae1076e1b319)
![OnBoarding1](https://github.com/user-attachments/assets/c073b0b3-b0da-48c7-ba05-0e3de459e684)
![OnBoarding2](https://github.com/user-attachments/assets/0e125cd6-49a1-4459-8355-bc166fdd418e)
![OnBoarding3](https://github.com/user-attachments/assets/09253231-e173-4c94-9fe2-508456e39463)
![OnBoarding4](https://github.com/user-attachments/assets/1c133450-e573-43d7-82eb-dceb38492c05)
