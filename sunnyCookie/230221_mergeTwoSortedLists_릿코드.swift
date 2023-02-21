//https://leetcode.com/problems/merge-two-sorted-lists/submissions/902144697/

class Solution {

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard list1 != nil else { return list2 }
        guard list2 != nil else { return list1 }
        
        var headList: ListNode? = nil
        var tailList: ListNode? = nil
        var currentList1: ListNode? = list1
        var currentList2: ListNode? = list2

        while true {
            guard let val1 = currentList1?.val else {
                tailList?.next = currentList2 
                return headList
            }

            guard let val2 = currentList2?.val else {
                tailList?.next = currentList1
                return headList
            }

            var newList: ListNode? = nil

            if val1 <= val2 {
               newList = ListNode(val1)
               currentList1 = currentList1?.next
            } else {
               newList = ListNode(val2)
               currentList2 = currentList2?.next
            }

            if headList == nil {
                headList = newList
                tailList = newList
            } else {
                tailList?.next = newList // 연결하고
                
                if headList?.next == nil {
                    headList?.next = tailList
                }
                
                tailList = newList // 마지막을 새로운걸로 바꾸면됌
            }
        }
    
    return nil

    }
}
