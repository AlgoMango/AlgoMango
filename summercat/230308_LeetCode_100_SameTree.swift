/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var pQueue: [TreeNode?] = [p]
        var qQueue: [TreeNode?] = [q]
        var idx: Int = 0

        if p == nil && q == nil { return true }
        if p != nil && q == nil { return false }
        if p == nil && q != nil { return false }
        while idx < pQueue.count {
            let curP = pQueue[idx]
            let curQ = qQueue[idx]

            if curP?.val != curQ?.val { return false }
            if curP?.left == nil && curQ?.left != nil { return false }
            if curP?.left != nil && curQ?.left == nil { return false }
            if curP?.right == nil && curQ?.right != nil { return false }
            if curP?.right != nil && curQ?.right == nil { return false }

            if curP?.left != nil && curQ?.left != nil {
                pQueue.append(curP!.left)
                qQueue.append(curQ!.left)
            }
            if curP?.right != nil && curQ?.right != nil {
                pQueue.append(curP!.right)
                qQueue.append(curQ!.right)
            }

            idx += 1
        }
        return true
    }
}

// 재귀 활용한 풀이(외국인형님이 푼거)
class Solution {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        else if p == nil || q == nil { return false }
        else {
            if p?.val == q?.val {
                return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        } else { return false }
      }
    }
}
