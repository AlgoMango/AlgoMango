//230219_올바른괄호(스택,큐)_프로그래머스

import Foundation

func solution(_ s:String) -> Bool
{
    var flag = 0
    for item in s {
        if item == "(" {
            flag += 1
        } else {
            flag -= 1
        }
        if flag < 0 { return false }
    }
    
    return flag == 0 ? true : false
}
