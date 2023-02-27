// https://leetcode.com/problems/simplify-path

/*
문제이해
    파일, 디렉토리 경로가 주어질 때,
    ".."은 상위 디렉토리(다만 바로 위가 루트디렉토리면 이동불가)
    "."은 현재 디렉토리를 나타낸다
    "..."은 그냥 파일 이름으로 처리한다.
    "//" 은 "/" 처리해야한다.
 --------------------------------------------------
 풀이
    "/" 로 split해서 배열로 만들어처리한다
    배열에 ".", ".." 포함되어 있으면 처리하고
    마지막에 맨앞에 / 를 붙여서 프린트한다

 다른추천풀이
    "/" 로 split해서 배열로 만들어처리하는데
    배열을 돌면서 stack에 담아주며 처리한다
    ex) ".."을 만나면 스택 마지막 삭제
*/

import Foundation

func simplifyPath(_ path: String) -> String {
    var answer: String = ""

    var splitPath: [String] = path.split(separator: "/").map { String($0) }

    while splitPath.contains(".") {
        let index: Int = splitPath.firstIndex(of: ".")!
        splitPath.remove(at: index)
    }

    while splitPath.contains("..") {
        let index: Int = splitPath.firstIndex(of: "..")!

        if index == 0 {
            splitPath.removeFirst()
        } else {
            splitPath.remove(at: index - 1)
            splitPath.remove(at: index - 1)
        }
    }

    answer = splitPath.joined(separator: "/")

    return "/"+answer
}
