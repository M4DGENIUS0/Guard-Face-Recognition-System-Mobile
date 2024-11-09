
<!-- PROJECT LOGO -->
<br />
<div align="center">
  <img src="https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/logo.png?raw=true" alt="Logo" style="width:250px;height:128px;">

  <h3 align="center">Mandarin, Providing Solution</h3>

  <p align="center">
    An Facial Attendance System for Gaurds.
    <br />
<!--     <a href="https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/"><strong>Explore the docs »</strong></a> -->
    <br />
    <br />
    <a href="">View Demo</a>
    ·
    <a href="">Privacy & Policies</a>
    ·
    <a href="">Request Feature</a>
  </p>
</div>




## ❓ About

Mandarin is an application that uses Custom Face Detection Service to mark Attendance of Guard and Employees, built for only Android Plateform.


## 💪 Features

Some of the features Mandarin provides are:

- 💉 **Loading State**: Show loading States while calling the API
- 📱 **Timeout**: It can handle timeouts(Connect Timeout, Recieve Timeout) duration is 30 sec.
- 🤗 **Simple UI**: Quickly understand the ins and outs of Mandarin
- 🛠️ **Offline Scenario**: Handle offline scenrio incase of Device not Connected to Internet or Internet Glitchs. A alert box will Appear and ask you to leave the app.

## 📸 Android Screenshots

  HomePage                 |      API Input            |    Internet Issue
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/Home%20Screen.jpeg?raw=true)|![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/api.jpeg?raw=true)|![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/Internet%20Connectivity%20Issue.jpeg?raw=true)

  Loading Screen           |  Record Not Found         |  Attendance Mark
:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/Status%20Checking.jpeg?raw=true)|![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/record%20not%20found.jpeg?raw=true)|![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/Success.jpeg?raw=true)

## Diagram 
  App Flow Chart               
:-------------------------:
![](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/blob/master/assets/Documentation/diagram.png?raw=true)|



<!-- GETTING STARTED -->
## 💻 Requirements

- Any Operating System (ie. MacOS X, Linux, Windows)
- Any IDE with Flutter SDK installed (ie. IntelliJ, Android Studio, VSCode etc)
- A little knowledge of Dart and Flutter

## Installation Guide

Before beginning with the installation, you will need the following with the mentioned versions

- Android Studio Version - Ladybug | 2024.2.1
- Flutter Version - 3.24.2
- Dart - 3.7.0
- Xcode - 16.0
- VS Code - 1.95



## Installation

> NOTE: It is recommended that you run a simple Hello World program in Flutter first before proceeding further so that you are sure that the environment is properly set up.

### API Key

Make sure your API must be working properly and active.

1. Get a API Key.

## Clone the repository

- Open your terminal or command prompt or Windows PowerShell
- Navigate to the directory where you want to save the project
- Use the git clone command followed by the repository URL

```sh
git clone https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile.git
```
## Install dependencies

- Navigate to the project's directory

```sh
cd <repository-name>
```

- Run the following command to install the required packages

```sh
flutter pub get
```
<!--
## Configure API

- Enter your API key at `lib/repository/service.dart` at Line 09, Col 25

```dart
String APIKey = 'Your-API-Key';
```
   
> Note: Add the value of the complete URL ending with the API endpoint.In case of ngrok  E.g - https://0000-00-000-000-000.ngrok-free.app
-->
### Connect a device or emulator

* Physical Device

  1. Enable USB debugging on your device
  2. Connect it to your computer using a USB cable.

* Emulator

  1. Start an Android or iOS emulator using your preferred IDE or tools.

### Run the Project

- Use the following command to build and run the project

- Use it for Testing.
```sh
flutter run
```
<p align="center">OR</p>

- Use it to Official Release the APK

```sh
flutter build apk --release
```
- Flutter will automatically Build and Release, store it into `(Project-Name)/build/app/outputs/flutter-apk/app-release.apk` change Apk name. Enjoy! 

## Configure API

- Enter your API key when Marking Attendance in App.

> Note: Add the value of the complete URL ending with the API endpoint.In case of ngrok  E.g - https://0000-00-000-000-000.ngrok-free.app

## Minimum Versions

- Android: 06
  
## Maximum Versions

- Android: 18

## API Documentation

For the API Documentation, please go through - https://drive.google.com/file/d/1cYxa58H9n-Pkh1q6CwGNScEQoB1Ky0ck/view?usp=drive_link

## 🔽 Download

You can download the APP at [Mandarin App](https://drive.google.com/file/d/1wItp35WbRITIzUVU9NFWrXjEDdeSBs6s/view?usp=drive_link) 

## Directory Structure
```
lib
│───main.dart    
└───src
    │───views
    |    └──GaurdScreen.dart
    │───repository    
    |    └──service.dart
    │───Provider
    |    └──AttendieProvider.dart
    │───Utils
    |    └──assets.dart
    └───Component
         │──widget
         |   |──AskPermission.dart
         |   └──NetworkFailue.dart
         └──AlertDialog.dart
```


<!-- LICENSE -->
## 🔖 LICENCE

Distributed under the MIT License. See `LICENSE.txt` for more information.



<!-- CONTACT -->
## 🤓 Author(s)

Ahmad Nasir - [@ahmad-nasir001](https://linkedin.com/in/ahmad-nasir001) - an7539661@gmail.com

Project Link: [https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile](https://github.com/M4DGENIUS0/Guard-Face-Recognition-System-Mobile/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



