// https://leetcode.com/problems/remove-nth-node-from-end-of-list/description/

/*
문제이해
    링크드리스트의 head가 주어지고, 맨 뒤에서 n번째를 삭제한 링크드리스트를 리턴하는 문제다.
풀이
    링크드 리스트의 전체 갯수를 리턴하는 countNode() 메서드를 만들고
    앞에서 몇번째인지 알기위해 전체갯수에서 n을 뺀다. (이 때, +1을 해줘야하는데, 4번째를 삭제하려면 3번째에서 3번째 next를 5번째로 바꿔야하므로 +1 하지않는다)
    다만, 중간값 삭제는 이렇게되는데, 첫번째값을 삭제해야할때는 첫번째의 next를 바꾸는 게아니라 본인을 next르 바꿔야하므로 중간에 한번 확인한다.

다른풀이 중 괜찮은것
    
*/

class Solution {

    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard var head = head,
              head.next != nil || n != 1 else { 
            return nil 
        }

        let count = countNode(head)
        let removeNumber = count - n // 5 - 2 = 3 => 노드 4를 없애려면 노드3에서 next를 5로 바꿔야함
        var currentNode: ListNode = head

        if removeNumber == 0 {
            head = head.next!
            return head
        }

        for index in 0..<removeNumber {
            if index == 0 { continue }      
            currentNode = currentNode.next! // 1일때 노드2, 2일때 노드3
        }

        currentNode.next = currentNode.next?.next

        return head
    }

    func countNode(_ head: ListNode) -> Int {
        var count: Int = 1
        var currentNode: ListNode? = head

        while currentNode?.next != nil {
            count += 1
            currentNode = currentNode?.next
        }
        
        return count
    }

}
