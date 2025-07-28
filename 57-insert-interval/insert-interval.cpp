class Solution {
public:
    vector<vector<int>> insert(vector<vector<int>>& a, vector<int>& newInterval) {
        vector<vector<int>> result;
        int i = 0, n = a.size();
        while(i < n && a[i][1] < newInterval[0]) {
            result.push_back(a[i]);
            i++;
        }

        while(i < n && a[i][0] <= newInterval[1]) {
            newInterval[0] = min(a[i][0], newInterval[0]);
            newInterval[1] = max(a[i][1], newInterval[1]);
            i++;
        }
        result.push_back(newInterval);

        while(i < n) {
            result.push_back(a[i]);
            i++;
        }
        return result;  
    }
};
