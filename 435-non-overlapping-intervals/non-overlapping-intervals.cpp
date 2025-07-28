class Solution {
public:
    int eraseOverlapIntervals(vector<vector<int>>& a) {
        sort(a.begin(), a.end(), [](const vector<int>& a1, const vector<int>& b1) {
            return a1[1] < b1[1]; 
        });
        int i = 0, n = a.size();
        int count = 0;
        int end = a[0][1];
        for(int i=1; i<n; i++) {
            if(a[i][0] < end) {
                count++;
            } 
            else {
                end = a[i][1];
            }
        }
        return count;
    }
};