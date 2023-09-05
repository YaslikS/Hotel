import Foundation

func invalidEmail(email: String) -> Bool {
    let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
    if !predicate.evaluate(with: email){    //  если почта невалидная
        return false
    }
    return true
}
