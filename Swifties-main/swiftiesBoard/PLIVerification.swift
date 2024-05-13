//
//  PLIVerification.swift
//  swiftiesBoard
//
//  Created by Pavneet Cheema on 3/28/24.
//

import Foundation
//import Foundation
class PLIVerification{
    func isValidCreditCardNumber(_ cardNumber: String) -> Bool {
        if(cardNumber.count == 16){
            let reversedCardNumber = cardNumber.reversed().map { String($0) }
            var sum = 0
            for (index, digitString) in reversedCardNumber.enumerated() {
                guard let digit = Int(digitString) else { return false }
                if index % 2 == 1 {
                    let doubledDigit = digit * 2
                    sum += (doubledDigit > 9) ? (doubledDigit - 9) : doubledDigit
                } else {
                    sum += digit
                }
            }
            return sum % 10 == 0
        }
        else{
            return false
        }
    }
    
    func isSocialSecurityNumber(_ number: String) -> Bool {
        // Check if the number has the correct length
        guard number.count == 9 else {
            return false
        }
        
        // Check if the number contains only digits
        guard let _ = Int(number) else {
            return false
        }
        
        // Check if the first three digits are between 001 and 899
        let firstThreeDigits = Int(number.prefix(3)) ?? 0
        guard firstThreeDigits >= 1 && firstThreeDigits <= 899 else {
            return false
        }
        
        // Check if the next two digits are between 01 and 99
        let nextTwoDigits = Int(number.prefix(5).suffix(2)) ?? 0
        guard nextTwoDigits >= 1 && nextTwoDigits <= 99 else {
            return false
        }
        
        // Check if the last four digits are between 0001 and 9999
        let lastFourDigits = Int(number.suffix(4)) ?? 0
        guard lastFourDigits >= 1 && lastFourDigits <= 9999 else {
            return false
        }
        
        return true
    }
    func verifyMedicareID(medicareID: String) -> Bool {
        // Define the pattern for each position
        let position1Pattern = "[1-9]"
        let position2Pattern = "[A-PR-TV-Y]"
        let position3Pattern = "[0-9A-PR-TV-Y]"
        let position4Pattern = "[0-9]"
        let position5Pattern = "[A-PR-TV-Y]"
        let position6Pattern = "[0-9A-PR-TV-Y]"
        let position7Pattern = "[0-9]"
        let position8Pattern = "[A-PR-TV-Y]"
        let position9Pattern = "[A-PR-TV-Y]"
        let position10Pattern = "[0-9]"
        let position11Pattern = "[0-9]"
        
        // Combine all patterns to form the complete pattern
        let completePattern = "\(position1Pattern)\(position2Pattern)\(position3Pattern)\(position4Pattern)\(position5Pattern)\(position6Pattern)\(position7Pattern)\(position8Pattern)\(position9Pattern)\(position10Pattern)\(position11Pattern)"
        
        // Create a regular expression object with the complete pattern
        guard let regex = try? NSRegularExpression(pattern: completePattern) else {
            return false  
        }
        
        // Match the Medicare ID against the regular expression
        let range = NSRange(location: 0, length: medicareID.utf16.count)
        return regex.firstMatch(in: medicareID, options: [], range: range) != nil
    }

    
}
