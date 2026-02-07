# 👨‍💻 CodeHub

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![State Management](https://img.shields.io/badge/State%20Management-Bloc-BDAE3B?style=for-the-badge&logo=bloc&logoColor=white)](https://bloclibrary.dev/#/)
[![Architecture](https://img.shields.io/badge/Architecture-Clean-success?style=for-the-badge&logo=layers&logoColor=white)](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

**CodeHub** is a specialized social media application designed specifically for **developers and technology enthusiasts**. Think of it as "Instagram for Coders"—a place to share knowledge, snippets, setup showcases, and tech lifestyle moments.

---

## 🚀 Overview

CodeHub provides a seamless and immersive experience for users to connect through visual content. Built with **Flutter**, this project strictly follows **Clean Architecture** principles and **SOLID** design patterns, ensuring scalability, testability, and maintainability.

---

## ✨ Key Features

| Feature | Description |
| :--- | :--- |
| **🏠 Home Feed** | A dynamic feed displaying Stories and Posts (Images & Videos). |
| **🎥 Smart Video Player** | Intelligent scrolling system that auto-plays/pauses videos based on visibility (using `visibility_detector`). |
| **🎞️ Immersive Stories** | Full features story viewing experience with smooth transitions and navigation between users. |
| **🔍 Explore Page** | Discover new content and trending developers in the tech community. |
| **📤 Post Upload** | A dedicated interface for uploading images and videos to the platform. |

---

## 🏗️ Architecture & State Management

This project demonstrates professional-grade engineering practices:

*   **Clean Architecture**: Separation of concerns into Data, Domain, and Presentation layers.
*   **SOLID Principles**: Adherence to standard design principles for robust code.
*   **BLoC (Business Logic Component)**: Used for predictable and testable state management across the application.
*   **Dependency Injection**: Managed via `get_it` for decoupling dependencies.

---

## 📦 Tech Stack & Packages

The project leverages a robust set of packages to deliver high performance and a great UI:

### **Core**
*   [`flutter_bloc`](https://pub.dev/packages/flutter_bloc) / [`bloc`](https://pub.dev/packages/bloc) - For state management.
*   [`get_it`](https://pub.dev/packages/get_it) - Service locator for Dependency Injection.
*   [`dio`](https://pub.dev/packages/dio) - Powerful HTTP client for API networking.

### **UI & UX**
*   [`shimmer`](https://pub.dev/packages/shimmer) - Loading effects.
*   [`flutter_staggered_grid_view`](https://pub.dev/packages/flutter_staggered_grid_view) - For complex grid layouts (Explore page).
*   [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) - iOS style icons.

### **Media & Player**
*   [`video_player`](https://pub.dev/packages/video_player) & [`fijkplayer`](https://pub.dev/packages/fijkplayer) - For video playback capabilities.
*   [`cached_network_image`](https://pub.dev/packages/cached_network_image) - Efficient image caching.
*   [`story_view`](https://pub.dev/packages/story_view) & [`story`](https://pub.dev/packages/story) - For Instagram-like story presentation.
*   [`visibility_detector`](https://pub.dev/packages/visibility_detector) - To handle video play/pause logic on scroll.
*   [`dashed_circle`](https://pub.dev/packages/dashed_circle) - UI element for story avatars.

---

## 🛠️ Getting Started

Follow these steps to run the project locally:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/codehub.git
    ```

2.  **Navigate to the project directory:**
    ```bash
    cd codehub
    ```

3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

4.  **Run the app:**
    ```bash
    flutter run
    ```

---

## 🤝 Contributing

Contributions are welcome! If you have suggestions for improvements or bug fixes, please feel free to:

1.  Fork the repository.
2.  Create a new branch (`git checkout -b feature/YourFeature`).
3.  Commit your changes.
4.  Push to the branch.
5.  Open a Pull Request.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

<p align="center">
  Developed with ❤️ by [Your Name]
</p>
