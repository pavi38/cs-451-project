# cs-451-project

Note: This file uses mark down. Here is a markdown cheat sheet. https://github.com/lifeparticle/Markdown-Cheatsheet?tab=readme-ov-file#code-block

# Description

The purpose of the app is to send notification to the Caregiver as soon as Dependent type any sensitive infromation.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)
- [Credits](#credits)
- [Contact Information](#contact-information)

## Installation

Instructions on how to run/install/setup your project. Include any prerequisite software or libraries.

```bash
# Clone this repository
# Navigate to the project directory
# cd Swifties
# Create firebase project on (https://firebase)
# Open the project in Xcode
# Download the google p-list
open Swifities.xcodeproj
# set-up a Open Ai developer account
# Copy the API key into the api caller
```

## Usage

* https://docs.google.com/document/d/1F-__aaGS9SrQiK-xOY_pAxW4E8pMhRrJ/edit?usp=sharing&ouid=111595304176802065163&rtpof=true&sd=true

## Features

A list of features currently implemented and possibly upcoming features.

- Many to Many relation between caregiver and dependent 
- Fully Funcationing GUI
- Keyboard almost indentical to the system keyboard
- fully funcational keyboard with all working special keys (Capslock, delete, space)
- Spell checking and auto-complete
- Upcoming: Push notification.

## Dependencies

List of all dependencies required by the project. Specify versions if necessary.
Example: Firebase, APIs, etc

- Dependency 1 (Firebase)
- Dependency 2 (Keychain Sharing)
- Dependency 3 (Open AI)

### Code Examples

Be careful when inheriting or making instacne of this class. Because it has async calls.

### Swift Code Block Example

```swift
import UIKit

class AuthViewModel: ObservableObject {
    // keeps track of the seesion to keep users log in
   // static var shared = AuthViewModel()
    @Published var userSession: FirebaseAuth.User?
    // keeps track of the user that has an oppen session
    @Published var currentUser: User? //change user to non-optional
    @Published var Dependentfound: String = ""
    @Published var listofCaregiver = [User]()
    @Published var listofDependents = [User]()
    @Published var error: String?
    static var UserId: String? = "123"
    init() {
        //checks if there is a user session to keep the user log in
        self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
            //await fetchDependents()
        }
    }
```

## Credits

Acknowledge those who contributed to the project. This could include team members, contributors, and other third-party resources or libraries used in the project.

- [Pavneet Cheema]
- [Jroge Rosa]
- [William Inzer]
- Special thanks to [UMKC]) for support and resources.

## Contact Information

For any questions, suggestions, or discussions about the project, feel free to reach out to us:

- [Pavneet Cheema](mailto:pscvc3@umsystem.edu)
- [Jorge Rosa](mailto:jlrcwb@umkc.edu)
