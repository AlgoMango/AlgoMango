// 재귀 못하겠습니다,,,,

class Solution {
   func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
       if (p == nil && q != nil) || (p != nil && q == nil) {
           return false
       } else if (p == nil) && (q == nil) {
           return true
       }
       
       var needVisitQueue1: [TreeNode] = [p!]
       var needVisitQueue2: [TreeNode] = [q!]

       while !needVisitQueue1.isEmpty && !needVisitQueue2.isEmpty {
           let node1 = needVisitQueue1.removeFirst()
           let node2 = needVisitQueue2.removeFirst()
           
           if node1.val != node2.val {
               return false
           }
           
           if (node1.right != nil && node2.right == nil) || (node1.right == nil && node2.right != nil) {
               return false
           }
           
           if (node1.left != nil && node2.left == nil) || (node1.left == nil && node2.left != nil) {
               return false
           }
           
           if let node1Left = node1.left,
              let node2Left = node2.left {
               needVisitQueue1.append(node1Left)
               needVisitQueue2.append(node2Left)
           }
           
           if let node1Right = node1.right,
              let node2Right = node2.right {
               needVisitQueue1.append(node1Right)
               needVisitQueue2.append(node2Right)
           }
       }
       
       return true
   }
}
