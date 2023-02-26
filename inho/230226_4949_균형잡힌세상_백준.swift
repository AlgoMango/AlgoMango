while true {
    guard let input = readLine(),
          input != "."
    else {
        break
    }

    var brackets: [Character] = []

    for letter in input {
        if letter == ")" {
            if brackets.isEmpty {
                brackets.append(letter)
                break
            } else if brackets.last! == "(" {
                brackets.removeLast()
            } else {
                break
            }
        } else if letter == "]" {
            if brackets.isEmpty {
                brackets.append(letter)
                break
            } else if brackets.last! == "[" {
                brackets.removeLast()
            } else {
                break
            }
        } else if letter == "(" || letter == "[" {
            brackets.append(letter)
        } else if letter == "." { // . 만나면 문장 끝으로 간주
            break
        }
    }

    print(brackets.isEmpty ? "yes" : "no")
}
