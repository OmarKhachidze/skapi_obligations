# Skapi Obligations App

A Flutter application for Skapi app.

## 📸 Demo

|    Iphone (Standard)	     |     	Android (Small)	      |
|:-------------------------:|:--------------------------:|
| ![](demo/iphone_demo.gif) | ![](demo/android_demo.gif) |  


## ✨ Features

- 🌐 **Localization**: Supports both **Georgian 🇬🇪** and **English 🇺🇸**
- 🎨 **Dynamic Theming**: Material 3 theme with dynamic color support via [`dynamic_color`](https://pub.dev/packages/dynamic_color)
- 🔀 **Navigation**: Declarative navigation using [`go_router`](https://pub.dev/packages/go_router)
- 🧱 **State Management**: Business logic is managed using the [`bloc`](https://pub.dev/packages/flutter_bloc) pattern
- 💉 **Dependency Injection**: Simple and clean DI using [`get_it`](https://pub.dev/packages/get_it)
- 📡 **Networking**: RESTful communication handled with [`dio`](https://pub.dev/packages/dio)
- 📄 **PDF Viewing**: Embedded document viewer powered by [`syncfusion_flutter_pdfviewer`](https://pub.dev/packages/syncfusion_flutter_pdfviewer)
- 🖼️ **Icons**: SVG assets rendered using [`flutter_svg`](https://pub.dev/packages/flutter_svg)
- 🧪 **Linting**: Code style enforced with [`flutter_lints`](https://pub.dev/packages/flutter_lints)
- 🛠️ **Makefile**: Project tasks simplified via a custom `Makefile`

---


## 🚀 Getting Started

### Install Dependencies

```bash
make get
```

### Run the App

```bash
make l10n
cd ios && pod install && cd ..
make run
```

## 🛠️ Development Summary

In the first 10 hours, I completed the app architecture and design. I then spent a few additional hours finalizing and polishing the full application.

All issues, pull requests, and implementation details are documented in the current repository.

There are two branches in the repository:

- `design` – Initial UI/UX design implementation
- `main` – Finalized application with complete functionality

## 🎨 Design Adjustments

- **Font**: My Helvetica Neue does not support Uppercase Georgian characters. To solve this, I used `SansSerifGeorgia` for uppercase text. More details are documented in the [pull request](https://github.com/OmarKhachidze/skapi_obligations/pull/20).
- **Button Label Capitalization**: Some [bottom sheet buttons](https://www.figma.com/design/aeNbVXEOloKbcUlNVeDptZ/Omedia-Flutter-Assessment?node-id=6314-8449&t=2ylDbB4blzCaEuZF-0) were uppercase, while others (e.g., PDF button, others) were lowercase. To maintain consistency, I converted all button labels to uppercase.

Other than these changes, the design has been preserved as-is, and everything functions as expected.

## 📱 Future Screens

The bottom navigation includes additional placeholder screens that are currently empty and can be implemented later.

