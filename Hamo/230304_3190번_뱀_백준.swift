import Foundation

struct Location: Equatable {
    var row: Int
    var column: Int
}

class SnakeDeque {
    var snakeLeft: [Location]
    var snakeRight: [Location] = []
    var count: Int {
        return snakeLeft.count + snakeRight.count
    }
    
    init(snakeLeft: [Location]) {
        self.snakeLeft = snakeLeft
    }
    
    func pushBack(snakeLength: Int, element: Location) {
        snakeRight.append(element)
        
        while snakeLength < count {
            popFront()
        }
    }
    
    func popFront() -> Location {
        if snakeLeft.isEmpty {
            snakeLeft = snakeRight.reversed()
            snakeRight.removeAll()
        }
        
        return snakeLeft.popLast()!
    }
    
    func contains(_ element: Location) -> Bool {
        return snakeLeft.contains(element) || snakeRight.contains(element)
    }
}

enum Direction {
    case row
    case column
    
    mutating func toggle() {
        switch self {
        case .column:
            self = .row
        case .row:
            self = .column
        }
    }
}

func changeDirection(_ direction: String) {
    switch currentDirection {
        // 행
    case .row:
        if (isIncrease && direction == "D") || (!isIncrease && direction == "D") {
            isIncrease.toggle()
        }
        
        currentDirection.toggle()
        // 열
    case .column:
        if (isIncrease && direction == "L") || (!isIncrease && direction == "L") {
            isIncrease.toggle()
        }
        
        currentDirection.toggle()
    }
}

// 인풋
let boardSize = Int(readLine()!)!
let appleCount = Int(readLine()!)!
var appleLocations: [Location] = []

if appleCount != 0 {
    for _ in 1...appleCount {
        let location = readLine()!.components(separatedBy: " ").map { Int($0)! }
        
        appleLocations.append(Location(row: location[0], column: location[1]))
    }
}

var changeDirectionCount = Int(readLine()!)!
var directions: [(second: Int, direction: String)] = []

for _ in 1...changeDirectionCount {
    let input = readLine()!.components(separatedBy: " ")
    let second = Int(input[0])!
    let direction = input[1]
    
    directions.append((second, direction))
}

directions = directions.reversed()

// 뱀
var currentDirection = Direction.column
var currentLength = 1
var currentHeadLocation: Location = Location(row: 1, column: 1)
var snakeLocation: SnakeDeque = SnakeDeque(snakeLeft: [Location(row: 1, column: 1)])
var totalTime = 0
var isIncrease = true

var isGameOver = false

while !isGameOver {
    totalTime += 1
    
    switch currentDirection {
    case .row:
        if isIncrease {
            currentHeadLocation.row += 1
        } else {
            currentHeadLocation.row -= 1
        }
    case .column:
        if isIncrease {
            currentHeadLocation.column += 1
        } else {
            currentHeadLocation.column -= 1
        }
    }
    
    if snakeLocation.contains(currentHeadLocation) {
        isGameOver = true
    } else if currentHeadLocation.row > boardSize || currentHeadLocation.column > boardSize {
        isGameOver = true
    } else if currentHeadLocation.row == 0 || currentHeadLocation.column == 0 {
        isGameOver = true
    }
    
    if appleLocations.contains(currentHeadLocation) {
        let index = appleLocations.firstIndex(of: currentHeadLocation)
        
        appleLocations.remove(at: index!)
        
        currentLength += 1
    }
    
    snakeLocation.pushBack(snakeLength: currentLength, element: currentHeadLocation)
    
    if directions.last?.second == totalTime {
        let temp = directions.removeLast()
        
        changeDirection(temp.direction)
    }
}

print(totalTime)
