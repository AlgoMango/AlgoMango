// https://leetcode.com/problems/path-sum/

/*
풀이

다더해서 마지막이 targetSum이여야하므로
트리를 타고 내려가면targetSum에서 value를 빼주면서 내려감
마지막까지 TargetSum에서 value를 뺐을 때 0이면 return true
*/

class Solution {

    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        guard let root = root else { return false }
        
        if root.left == nil && root.right == nil {
            return targetSum - root.val == 0
        }

        return hasPathSum(root.right, targetSum - root.val) || hasPathSum(root.left, targetSum - root.val) //✅ ||(또는)을 사용해서 두개 한꺼번에 확인
    }
}
