//230416_2448별찍기11_백준

let input = Int(readLine()!)!

recursive(number: input, pattern: ["  *  ", " * * ", "*****"])

func recursive(number: Int, pattern: [String]) {
    if number == 3 {
        for line in pattern {
            print(line)
        }
        return
    }
    
    let spacing = String(repeating: "   ", count: pattern.count / 3)
    let top = pattern.map { spacing + $0 + spacing }
    let middle = pattern.map { $0 + " " + $0 }
    
    let newPattern = top + middle
    
    recursive(number: number / 2, pattern: newPattern)
}
