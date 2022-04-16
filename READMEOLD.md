# Civility Optics iOS Installation Guide

### 1. Required Software

On MacOS Big Sur (12+), install Xcode (12.3+) from the App Store to get started.

### 2. Clone the Code

Use git to clone this repository:

```
git clone https://github.com/vibestudios/civility-optics-ios.git
```

### 3. Open and build the Project.

Open `Civility Optics.xcodeproj`. Use Command+B to build the project, which will automatically resolve Swift package dependencies.

### 4. Change Settings

In `NetworkingService.swift`, change `NetworkingService.baseURL` to the url of the backend. The current code points to `http://localhost:5001/`. 

## Troubleshooting

### I can't load the app on my phone.

If you attempted to install this app on your phone, you might need an [Apple Developer account](https://developer.apple.com). Sign in to your developer account on your Mac to resolve the issue.

### The app does not connect to the backend.

If you are running the backend locally, ensure `NetworkingService.baseURL` matches the port selected by your backend, and make sure the backend is running. This will connect simulator instances to the backend, and will not work for apps installed to a physical device.

If you are hosting the backend online, change this url to the public url. This public url will work for app instances on the simulators and on physical devices.

# Civility Optics iOS Release Notes

#### v 1.0.0, build 1

## Features
- Create new accounts
- Login to existing accounts
- Search for nearby venues
- View venue ratings and comments
- Submit a Five Fist Rating
- Select a date visited for ratings
- Add tags to ratings
- Add a comment to ratings

## Known Issues and Limitations
- The login page is unintentionally accessible through the back navigation arrow. This may freeze the app and require a reboot.
- Errors related to login or account creation (such as invalid password or failed attempts) are not shown to the user. Instead, only valid login and registration attempts change the page.
