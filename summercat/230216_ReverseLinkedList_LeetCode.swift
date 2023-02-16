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
        var cur: ListNode? = head
        var temp: ListNode? = nil
        var next: ListNode? = nil

        // 0.next = 1 을
        // 1.next = 0 으로 바꿔야 한다 -> prev를 기억해야 함
        while cur != nil {
            // cur = 0 / 1 
            temp = cur?.next // temp = 1 / 2
            cur?.next = next // cur?.next = nil / 0
            next = cur // next = 0 / 1
            cur = temp // cur = 1 / 2
        }
        
        return next
    }
}
