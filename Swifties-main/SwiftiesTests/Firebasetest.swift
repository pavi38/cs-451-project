//
//  Firebasetest.swift
//  SwiftiesTests
//
//  Created by Pavneet Cheema on 5/8/24.
//

import XCTest
import FirebaseAuth
import FirebaseFirestore
@testable import Swifties

class AuthViewModelTests: XCTestCase {
    
    var authViewModel: AuthViewModel!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        authViewModel = AuthViewModel()
    }
    
    override func tearDownWithError() throws {
        authViewModel = nil
        try super.tearDownWithError()
    }
    
    func testSignIn() async throws {
        let email = "test@example.com"
        let password = "password"
        do {
            try await authViewModel.signIn(withEmail: email, password: password)
            XCTAssertNotNil(authViewModel.userSession)
        } catch {
            XCTFail("Sign in failed with error: \(error.localizedDescription)")
        }
    }
    
    func testCreateUser() async throws {
        let email = "test@example.com"
        let password = "password"
        let fullname = "John Doe"
        let type = "standard"
        do {
            try await authViewModel.createUser(withEmail: email, password: password, fullname: fullname, type: type)
            XCTAssertNotNil(authViewModel.userSession)
        } catch {
            XCTFail("Create user failed with error: \(error.localizedDescription)")
        }
    }
    
    func testSignOut() {
        authViewModel.signOut()
        XCTAssertNil(authViewModel.userSession)
    }
    
    
}
