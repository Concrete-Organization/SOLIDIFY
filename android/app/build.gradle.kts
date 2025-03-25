plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.solidify"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "28.0.13004108"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_21  // Updated to match your JDK 21.0.1
        targetCompatibility = JavaVersion.VERSION_21  // Updated to match your JDK 21.0.1
    }

    kotlinOptions {
        jvmTarget = "21"  // Updated to match your JDK 21.0.1
    }

    defaultConfig {
        applicationId = "com.example.solidify"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}