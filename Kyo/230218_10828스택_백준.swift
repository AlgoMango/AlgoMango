//230218_10828스택_백준

var cnt = Int(readLine()!)!
var stack: [String] = []

while cnt > 0 {
    cnt -= 1
    
    let input = readLine()!.split(separator: " ").map { String($0) }
    if input[0] == "push" {
        add(input[0], input[1])
    } else {
        let execute = command(input[0])
        print(execute)
    }
}

func command(_ command: String) -> String {
    switch command {
    case "top":
        return stack.last ?? "-1"
    case "size":
        return String(stack.count)
    case "empty":
        if stack.count == 0 {
            return "1"
        }
        return "0"
    case "pop":
        if stack.count > 0 {
            return stack.removeLast()
        }
        return "-1"
    default:
        return ""
    }
}

func add(_ command: String, _ number: String) {
    stack.append(number)
}
