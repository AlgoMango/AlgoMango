import Foundation

func solution(_ numbers:[Int]) -> Int {
    let a = [1, 2, 3, 4, 5, 6, 7, 8, 9].reduce(0, +)
    let b = numbers.reduce(0, +)
    return a - b
}
