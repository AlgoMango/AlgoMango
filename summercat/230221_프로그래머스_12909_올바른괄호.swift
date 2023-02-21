// removeLast하지 않고 (괄호와 )괄호의 개수를 뒤에서부터 세서 

import Foundation

var closes: [Character] = []

func solution(_ s:String) -> Bool {
    var s = s
    while !s.isEmpty {
        let last = s.removeLast()
        if last == "(" {
            if closes.isEmpty { return false }
            else { closes.removeLast() }
        } else {
            closes.append(last)
        }
    }
    
    if closes.isEmpty { return true }
    else { return false }
    return true
}
