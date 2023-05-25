import Foundation

func separateFile(with file: String) -> [String] {
    var NUMBER: String = ""
    var isNUMBERStart: Bool = false
    
    for character in file {
        if NUMBER.count > 5 {
            break
        }
        
        if character.isNumber {
            isNUMBERStart = true
            NUMBER += String(character)
        } else if isNUMBERStart && !character.isNumber {
            break
        }
    }
    
    let temp = file.replacingOccurrences(of: NUMBER, with: "+").split(separator: "+").map { String($0) }
    
    if temp.count == 1 {
        return [temp[0], NUMBER]
    } else {
        return [temp[0], NUMBER, temp[1]]
    }
}

func solution(_ files: [String]) -> [String] {
    var separatedFiles: [[String]] = []
    
    for str in files {
        separatedFiles.append(separateFile(with: str))
    }
    
    separatedFiles = separatedFiles.sorted {
        $0[0].uppercased() < $1[0].uppercased()
    }
    
    var NUMBERSortedFiles: [[String]] = []
    var NUMBERSortedCount = 0
    
    for arr in separatedFiles {
        let sameHeadFiles = separatedFiles.filter { $0[0].uppercased() == arr[0].uppercased() }
        
        if sameHeadFiles.count == 1 {
            NUMBERSortedFiles.append(arr)
        } else {
            NUMBERSortedFiles += sameHeadFiles.sorted { Int($0[1])! < Int($1[1])! }
        }
        
        NUMBERSortedCount += sameHeadFiles.count
        
        if NUMBERSortedCount == separatedFiles.count {
            break
        }
    }
    
    return NUMBERSortedFiles.compactMap { $0.joined() }
}
