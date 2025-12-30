# Login Using Firebase

A Flutter application demonstrating user authentication and management using Firebase Authentication. This project provides a complete authentication system with login, signup, password reset, and home screen functionality.

## Features

- 🔐 **User Authentication** - Secure login and signup with Firebase Auth
- 📧 **Email Verification** - Email-based user accounts with verification support
- 🔑 **Password Reset** - Forgot password functionality with email recovery
- 🎯 **User Dashboard** - Protected home screen for authenticated users
- 📱 **Cross-Platform** - Supports Android, iOS, Web, Windows, macOS, and Linux
- ⚡ **Firebase Integration** - Direct Firebase backend integration

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── auth/
│   ├── loginScreen.dart      # Login UI
│   ├── signUpScreen.dart     # Registration UI
│   └── forgetscreen.dart     # Password reset UI
├── screen/
│   └── homeScreen.dart       # Main app screen (authenticated)
└── widget/
    └── uiHelper.dart         # Reusable UI components
```

## Prerequisites

Before you begin, ensure you have the following installed:

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- Firebase account with a project configured

## Getting Started

### 1. Clone the Repository
```bash
git clone <repository-url>
cd login_using_firebase
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Firebase

**For Android:**
- Download `google-services.json` from Firebase Console
- Place it in `android/app/` directory
- Update `android/build.gradle.kts` if needed

**For iOS:**
- Download `GoogleService-Info.plist` from Firebase Console
- Add it to Xcode under `Runner/Runner`

**For Web:**
- Follow Firebase web setup instructions in your Firebase console

### 4. Run the App
```bash
flutter run
```

## Authentication Screens

### Login Screen
- Email and password input fields
- "Forgot Password" link for password recovery
- "Sign Up" link for new users
- Login error handling

### Sign Up Screen
- Email and password validation
- Password confirmation field
- Account creation with Firebase Authentication
- Navigation to home screen on success

### Forgot Password Screen
- Email input for password reset
- Firebase-powered email recovery
- User-friendly feedback messages

### Home Screen
- Authenticated user dashboard
- Logout functionality
- Secure user data access

## Dependencies

Key packages used in this project:
- `firebase_core` - Firebase initialization
- `firebase_auth` - Authentication services
- `flutter` - UI framework

See `pubspec.yaml` for complete dependencies.

## Troubleshooting

**Common Issues:**

1. **Firebase Connection Error**
   - Verify Firebase project is active
   - Check `google-services.json` is in correct location
   - Ensure Firebase authentication is enabled

2. **Build Issues**
   - Run `flutter clean` then `flutter pub get`
   - Clear build cache and rebuild

3. **App Won't Run**
   - Check Flutter/Dart SDK versions
   - Verify device/emulator is running
   - Review console for error messages

## Resources

- [Firebase Documentation](https://firebase.google.com/docs)
- [Flutter Firebase Plugin](https://pub.dev/packages/firebase_core)
- [Flutter Authentication Guide](https://docs.flutter.dev/development/data-and-backend/firebase)
- [Firebase Authentication Best Practices](https://firebase.google.com/docs/auth/best-practices)

## License

This project is open source and available under the MIT License.

## Support

For issues or questions, please create an issue in the repository or contact the maintainers.
