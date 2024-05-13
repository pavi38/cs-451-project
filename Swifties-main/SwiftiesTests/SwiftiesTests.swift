//
//  SwiftiesTests.swift
//  SwiftiesTests
//
//  Created by Pavneet Cheema on 2/14/24.
//

import XCTest
@testable import swiftiesBoard

final class SwiftiesTests: XCTestCase {
    
    //test for cerdit and debit card vaidation funcations
    
    //happy senerio
    
    func sucessful_isValidCreditCardNumber(){
        //given
        let cardNum = "6120109821567337"
        let PliVerifiy = PLIVerification()
        
        //when
        let isVaild = PliVerifiy.isValidCreditCardNumber(cardNum)
        
        XCTAssertTrue(isVaild)
    }
    
    func sucessful_isValidCreditCardNumber2(){
        //given
        let cardNum = "375593280751521"
        let PliVerifiy = PLIVerification()
        
        //when
        let isVaild = PliVerifiy.isValidCreditCardNumber(cardNum)
        
        XCTAssertTrue(isVaild)
    }
    
    //lessthan 16 digit in card number
    func unsucessful_isValidCreditCardNumber(){
        //given
        let cardNum = "3755932807515"
        let PliVerifiy = PLIVerification()
        
        //when
        let isVaild = PliVerifiy.isValidCreditCardNumber(cardNum)
        
        XCTAssertFalse(isVaild)
    }
    
    //invaild card number
    func unsucessful_isValidCreditCardNumber2(){
        //given
        let cardNum = "1234567891012132"
        let PliVerifiy = PLIVerification()
        
        //when
        let isVaild = PliVerifiy.isValidCreditCardNumber(cardNum)
        
        XCTAssertFalse(isVaild)
    }
    
    
    
    //test for ssn checker
    
    func sucessful_isSocialSecurityNumber(){
        //given
        let ssn = "248961471"
        let PliVerifiy = PLIVerification()
        
        //when
        
        let isSsn = PliVerifiy.isSocialSecurityNumber(ssn)
        
        //Then
        XCTAssertTrue(isSsn)
    }
    func sucessful_isSocialSecurityNumber2(){
        //given
        let ssn = "429927484"
        let PliVerifiy = PLIVerification()
        
        //when
        let isSsn = PliVerifiy.isSocialSecurityNumber(ssn)
        
        //Then
        XCTAssertTrue(isSsn)
    }
    
    func unsucessful_isSocialSecurityNumber2(){
        //given
        let ssn = "4299274"
        let PliVerifiy = PLIVerification()
        
        //when
        let isSsn = PliVerifiy.isSocialSecurityNumber(ssn)
        
        //Then
        XCTAssertFalse(isSsn)
    }
    
    func testValidMedicareIDs() {
        let PliVerifiy = PLIVerification()
        XCTAssertTrue(PliVerifiy.verifyMedicareID(medicareID: "1A0B2C3D4E5"))
        XCTAssertTrue(PliVerifiy.verifyMedicareID(medicareID: "9P5X3T7Q2Y1"))
        XCTAssertTrue(PliVerifiy.verifyMedicareID(medicareID: "3U4W5K2H7L0"))
    }
    
    // Test cases for invalid Medicare IDs
    func testInvalidMedicareIDs() {
        let PliVerifiy = PLIVerification()
        XCTAssertFalse(PliVerifiy.verifyMedicareID(medicareID: "00000000000")) // All zeros
        XCTAssertFalse(PliVerifiy.verifyMedicareID(medicareID: "1234567890")) // Incorrect length
        XCTAssertFalse(PliVerifiy.verifyMedicareID(medicareID: "1A0B2C3D4F5")) // Invalid character at position 11
        XCTAssertFalse(PliVerifiy.verifyMedicareID(medicareID: "0A0B2C3D4E5")) // Invalid character at position 1
        XCTAssertFalse(PliVerifiy.verifyMedicareID(medicareID: "9A0B2C3D4E5")) // Invalid character at position 1
    }
}
