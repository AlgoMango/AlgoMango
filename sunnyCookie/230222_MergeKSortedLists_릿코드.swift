// https://leetcode.com/problems/merge-k-sorted-lists/description/


// 1️⃣ 두 개를 머지하는 함수를 따로 만들어서 사용

import Foundation

func mergerTwoList(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
    guard list1 != nil else { return list2 }
    guard list2 != nil else { return list1 }

    var list1: ListNode? = list1
    var list2: ListNode? = list2
    var head: ListNode? = nil
    var trail: ListNode? = nil

    while true {
        var newNode: ListNode? = nil

        guard let val1 = list1?.val else {
            trail?.next = list2
            return head
        }

        guard let val2 = list2?.val else{
            trail?.next = list1
            return head
        }

        if val1 <= val2 {
            newNode = ListNode(val1)
            list1 = list1?.next
        } else {
            newNode = ListNode(val2)
            list2 = list2?.next
        }

        if head == nil {
            trail = newNode
            head = trail
        } else {
            trail?.next = newNode
            trail = trail?.next
        }
    }

    return head
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    guard lists.first != nil else {
        return nil
    }

    var orderedLists: [ListNode?] = lists.filter { $0?.val != nil }.sorted { $0!.val < $1!.val }

    while orderedLists.count > 1 {
        var leftIndex: Int = 0
        var rightIndex: Int = orderedLists.count - 1

        while leftIndex < rightIndex {
            orderedLists[leftIndex] = mergerTwoList(orderedLists[leftIndex], orderedLists[rightIndex])
            orderedLists.removeLast()
            leftIndex += 1
            rightIndex -= 1
        }
    }

    return orderedLists.first ?? nil
}

/* 
------------------------------------------------------------------------------------------
*/

// 2️⃣ 배열에 모든 밸류를 담은 후, sorted해서 linkedList로 만들어서 리턴

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var listArray: [Int] = []
    var head: ListNode? = nil
    var trail: ListNode? = nil

    for list in lists {
        var list = list
        while true {
            guard list?.val != nil else {
                break
            }

            listArray.append(list!.val)
            list = list?.next
        }
    }

    for value in listArray.sorted() {
        if head == nil {
            trail = ListNode(value)
            head = trail
        } else {
            trail?.next = ListNode(value)
            trail = trail?.next
        }
    }

    return head
}
