import Foundation

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
