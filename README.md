# ExamApp

[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/YahyaEltayeeb/examapp)

ExamApp is a cross-platform online examination application built with Flutter. This project serves as a starting point, featuring a clean architectural structure, dependency injection, and localization support for both English and Arabic.

## Features

- **Cross-Platform:** Single codebase for Android, iOS, Web, Windows, macOS, and Linux.
- **Clean Architecture:** Organized code with a clear separation between core logic, UI (view), and services.
- **Localization (i18n):** Pre-configured for English and Arabic languages using the `intl` package.
- **Custom Theming:** Includes a predefined color palette and theme for a consistent user interface.
- **Routing:** A centralized system (`Routes.generateRoutes`) manages navigation throughout the app.
- **Dependency Injection:** Utilizes `get_it` and `injectable` for managing dependencies and decoupling components.
- **Networking Ready:** Integrated with `retrofit` and `dio` for making type-safe API calls.

## Project Structure

The project's `lib` directory is organized to promote a clean and scalable architecture:

```
lib/
├── core/
│   ├── l10n/                  
│   │   └── app_localizations.dart
│   ├── route/                 
│   │   └── app_routes.dart
│   └── theme/                 
│       ├── app_colors.dart
│       └── app_theme.dart
├── view/
│   ├── auth/
│   │   ├── login_screen.dart
│   │   ├── signin_screen.dart
│   │   ├── forget_password_screen.dart
│   │   └── reset_password_screen.dart
│   ├── home/
│   │   └── home_screen.dart
│   ├── exam/
│   │   ├── exam_by_id_screen.dart
│   │   ├── exam_by_subject_screen.dart
│   │   ├── question_screen.dart
│   │   ├── score_screen.dart
│   │   ├── result_screen.dart
│   │   └── result_question_screen.dart
├── widgets/                          
│   ├── custom_button.dart
│   └── custom_text_field.dart
├── models/                           
│   ├── user_model.dart
│   ├── exam_model.dart
│   └── question_model.dart
├── services/                         
│   └── auth_service.dart
└── main.dart

```

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have the Flutter SDK installed on your machine. For installation instructions, see the [official Flutter documentation](https://docs.flutter.dev/get-started/install).

### Installation & Setup

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/YahyaEltayeeb/examapp.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd examapp
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4. **Generate necessary code (for dependency injection and localization):**
    ```sh
    flutter pub run build_runner build
    ```
### Running the Application

Launch the application on your connected device or emulator:
```sh
flutter run
 ```
### Screenshots

<div align="center">

<img src="https://github.com/user-attachments/assets/42027014-24e7-4acf-b5b2-61011aa972eb" alt="SignUp" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/6c70270a-734b-4b18-9285-0c5e3d2afbab" alt="Login" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/7172037f-ca35-4ae5-88df-75349b5fc53a" alt="Home" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/77a7808b-ef0b-43b1-92ef-3b8927137ef3" alt="Shocce Quiz" width="200px"/>

</div>

<div align="center" style="margin-top:10px">

<img src="https://github.com/user-attachments/assets/d4d2b37f-adf6-4799-bb1a-9aec2f90ee39" alt="Start Quiz" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/480c9452-ad1c-4cae-a17a-4e2251894cef" alt="Question" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/d5597532-b91f-42eb-bfc0-3e6c2891f680" alt="Choice Answer" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/4684b6ab-c946-4eb0-bb71-4f8b4fdde341" alt="Result" width="200px"/>

</div>

<div align="center" style="margin-top:10px">

<img src="https://github.com/user-attachments/assets/4ad9c387-825c-49e1-a6d3-124590f02ce0" alt="Answer" width="200px" style="margin-right:10px"/>
<img src="https://github.com/user-attachments/assets/6a065959-40cb-49a6-b9a5-b908c074fba1" alt="Profile" width="200px"/>

</div>
