import Foundation

let exceptCharacter: [String] = [
    "~", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "=", "+", "[", "{", "]", "}", ":", "?", ",", "<", ">", "/"]

func solution(_ new_id: String) -> String {
    return new_id
        .firstStep()
        .secondStep()
        .thirdStep()
        .fourthStep()
        .fifthStep()
        .sixthStep()
        .seventhStep()
}

extension String {
    func firstStep() -> Self {
        return self.lowercased()
    }
    
    func secondStep() -> Self {
        var temp = self
        
        exceptCharacter.forEach {
            temp = temp.replacingOccurrences(of: $0, with: "")
        }
        
        return temp
    }
    
    func thirdStep() -> Self {
        let temp: [String] = self.map { String($0) }.reversed()
        var stack: [String] = []
        var dotCount = 0
        
        for element in temp {
            if element == "." {
                dotCount += 1
            } else {
                if dotCount > 1 {
                    (1...dotCount).forEach { _ in stack.popLast() }
                    stack.append(".")
                    dotCount = 0
                } else {
                    dotCount = 0
                }
            }
            
            stack.append(element)
        }
        
        if dotCount > 1 {
            (1...dotCount).forEach { _ in stack.popLast() }
            stack.append(".")
        }
        
        return stack.reversed().joined()
    }
    
    func fourthStep() -> Self {
        return self.trimmingCharacters(in: ["."])
    }
    
    func fifthStep() -> Self {
        if self.isEmpty {
            return "a"
        }
        
        return self
    }
    
    func sixthStep() -> Self {
        if self.count > 15 {
            return Array(self)[0...14].map { String($0) }.joined().trimmingCharacters(in: ["."])
        }
        
        return self
    }
    
    func seventhStep() -> Self {
        if self.count < 3 {
            var temp = self
            while temp.count != 3 {
                temp += String(temp.last!)
            }
            return temp
        }
        
        return self
    }
}
