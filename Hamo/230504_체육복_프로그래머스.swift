import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lostStudent = lost.sorted(by: <)
    var reserveStudent = reserve.sorted(by: <)
    var attendStudent = n
    
    for student in lost {
        if reserveStudent.contains(student) {
            reserveStudent.remove(at: reserveStudent.firstIndex(of: student)!)
            lostStudent.remove(at: lostStudent.firstIndex(of: student)!)
        }
    }
    
    for student in lostStudent {
        if reserveStudent.contains(student - 1) {
            reserveStudent.remove(at: reserveStudent.firstIndex(of: student - 1)!)
        } else if reserveStudent.contains(student + 1) {
            reserveStudent.remove(at: reserveStudent.firstIndex(of: student + 1)!)
        } else {
            attendStudent -= 1
        }
    }
    
    return attendStudent
}
