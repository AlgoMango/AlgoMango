// https://leetcode.com/problems/search-in-rotated-sorted-array/description/

/*
문제설명
     nums배열에 오름차순으로 유니크한 숫자들이 나열되어있고, 
     k번 회전하면 [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] 배열이 된다.
        ex) [0,1,2,4,5,6,7]이 3번 회전하면 [4,5,6,7,0,1,2]이된 다.
     target 숫자는 몇번 회전했을 때 나오는지 리턴하는 함수만들기 (없으면 -1 리턴)


풀이
    몇 번째 인덱스인지를 묻는것과 같으므로 firstIndex(of:) 메서드 사용
*/

func search(_ nums: [Int], _ target: Int) -> Int {
    return nums.firstIndex(of: target) ?? -1
}
