//230509_둘만의암호_프로그래머스

import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    
    var alphaArray = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
    var skipArray = skip.map { String($0) }
    
    for index in 0..<skipArray.count {
        let skipIndex = alphaArray.firstIndex(of: skipArray[index])!
        alphaArray.remove(at: skipIndex)
    }

    var addIndex = index
    var answer = ""
    var targetArray = s.map { String($0) }
    
    for index in 0..<targetArray.count {
        let targetIndex = alphaArray.firstIndex(of: targetArray[index])!
        var newIndex = targetIndex + addIndex
        
        while newIndex >= alphaArray.count {
            newIndex -= alphaArray.count
        }
        
        answer += alphaArray[newIndex]
    }

    return answer
}
