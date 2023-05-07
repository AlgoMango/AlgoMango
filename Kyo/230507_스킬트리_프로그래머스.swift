//230507_스킬트리_프로그래머스
import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var answer = 0
    let skillArray = skill.map { String($0) }
    
    for skill in skill_trees {
        var tempSkillTree = skill.map { String($0) }
        var temp = ""
        
        
        for index in 0..<tempSkillTree.count {
            if skillArray.contains(tempSkillTree[index]) {
                temp += tempSkillTree[index]
            }
        }
        
        // temp는 "BCD", "CBD", "CB", "BD"
        var tempArray = temp.map { String($0) }
        var skillIndex = 0
        var flag = true
        
        for index in 0..<tempArray.count {
            if tempArray[index] == skillArray[skillIndex] {
                skillIndex += 1
            } else {
                flag = false 
            }
        }
        
        if flag { answer += 1 }
    }
    
    return answer
}
