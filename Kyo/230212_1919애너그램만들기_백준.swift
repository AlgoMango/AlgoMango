//230212_1919애너그램만들기_백준

var sentenceA = readLine()!.map { String($0) }
var sentenceB = readLine()!.map { String($0) }

var temp: [String] = []

var result = 0
for indexA in 0..<sentenceA.count {
    for indexB in 0..<sentenceB.count {
        if sentenceA[indexA] == sentenceB[indexB] {
            temp.append(sentenceA[indexA])
            sentenceB[indexB] = ""
            
            break
        }
    }
}

print(sentenceA.count + sentenceB.count - 2 * temp.count)
