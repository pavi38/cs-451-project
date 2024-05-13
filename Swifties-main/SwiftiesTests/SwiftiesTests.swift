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
}
