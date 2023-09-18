import Foundation


func formatMobileNumberNew(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
    guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
    
    let maxNumberCount = 11
    
    let regex = try! NSRegularExpression(pattern: "[\\+\\s-(\\)]", options: .caseInsensitive)
    let range = NSString(string: phoneNumber).range(of: phoneNumber)
    var number = regex.stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")
    
    if number.count > maxNumberCount {
        let maxIndex = number.index(number.startIndex, offsetBy: maxNumberCount)
        number = String(number[number.startIndex..<maxIndex])
    }
    if shouldRemoveLastDigit {
        let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
        number = String(number[number.startIndex..<maxIndex])
    }
    
    let maxIndex = number.index(number.startIndex, offsetBy: number.count)
    let regRange = number.startIndex..<maxIndex
    if number.count < 7 {
        let pattern = "(\\d)(\\d{3})(\\d+)"
        number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3", options: .regularExpression, range: regRange)
    } else {
        let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        number = number.replacingOccurrences(of: pattern, with: "$1 ($2) $3-$4-$5", options: .regularExpression, range: regRange)
    }
    
    return "+" + number
}

extension String {
    
    func formatMobileNumber() -> PhoneNumber {
        let cleanPhoneNumber = components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        let mark = "+X (XXX) XXX-XX-XX"
        
        var result = ""
        var startIndex = cleanPhoneNumber.startIndex
        let endIndex = cleanPhoneNumber.endIndex
        
        for charct in mark where startIndex < endIndex {
            if charct == "X" {
                result.append(cleanPhoneNumber[startIndex])
                startIndex = cleanPhoneNumber.index(after: startIndex)
            } else {
                result.append(charct)
            }
        }
        
        let phoneNumber = PhoneNumber(number: result, count: cleanPhoneNumber.count)
        
        return phoneNumber
    }
    
}
