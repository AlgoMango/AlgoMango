// https://leetcode.com/problems/same-tree/description/



class Solution {
 func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    guard p != nil || q != nil else {
        return true
    }

    if p?.val != q?.val {
        return false
    }

    return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
    }
}


// 틀린 풀이 이유 모르겠음 ㅎㅎㅎㅎ

// func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
//      var boolValue: Bool = true

//      guard p != nil || q != nil else {
//          boolValue = true
//          return boolValue
//      }

//      if p?.val != q?.val || p?.right?.val != q?.right?.val || p?.left?.val != q?.left?.val {
//          boolValue = false
//          return boolValue
//      }

//     if p?.val == nil {
//          boolValue = isSameTree(p?.left, q?.left)
//     } else if q?.val == nil {
//         boolValue = isSameTree(p?.right, q?.right)
//     } else {
//         boolValue = isSameTree(p?.left, q?.left)
//         boolValue = isSameTree(p?.right, q?.right)
//     }

//      return boolValue
//  }
