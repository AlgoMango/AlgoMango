// LeetCode 206 Reverse Linked List
// https://leetcode.com/problems/reverse-linked-list/description/


/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 0 -> 1 -> 2 : 0(next: 1), 1(next: 2), 2(next: nil)
        // 2 -> 1 -> 0 : 2(next: 1), 1(next: 0), 0(next: nil)
        var cur: ListNode? = head // 현재 루프를 돌리는 노드 / 0 / 1 
        var temp: ListNode? = nil // 들어온 노드의 next 노드를 저장한다. / 0.next = 1을 저장 - 여기에 저장되는 1은 1(next: 2) / 1.next = 2 - 2(next: 3)
        // cur.next의 값을 이전 노드로 바꾼다. (0의 경우는 nil로 바꿈) / 1.next = next = 0(next: nil)
        var next: ListNode? = nil // 현재 들어온 노드를 next값을 바꿔서 저장한다. (다음 노드의 next가 될 녀석임) / 0(next: nil)
        
        
        head: ListNode(next: ?)
        0(next: 1)
        
        // 0.next = 1 을
        // 1.next = 0 으로 바꿔야 한다 -> prev를 기억해야 함
        while cur != nil {
            // cur = 0 / 1 / 2 / 3
            temp = cur?.next // temp = 1 / 2   : temp = 1(next: 2).   / temp = 2(next: 3) / temp = nil
            cur?.next = next // cur?.next = nil / 0.  : 0.next = nil -> 0(next: nil).  / 1(next: 0) / 3(next: 2)
            next = cur // next = 0 / 1.  : next = 0(next: nil).  / next = 1(next: 0) / next = 3(
            cur = temp // cur = 1 / 2.  : cur = temp = 1(next: 2). / cur = 2(next: 3)
        }
        
        return next
    }
}
