class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        int rows = matrix.size();
        int cols = matrix[0].size();
        unordered_set<int> row;
        unordered_set<int> col;
        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                if(matrix[i][j] == 0) {
                    row.insert(i);
                    col.insert(j);
                }
            }
        } 

        for(int i=0; i<rows; i++) {
            for(int j=0; j<cols; j++) {
                if(row.count(i) || col.count(j)) {
                    matrix[i][j] = 0;
                }
            }
        }
        
    }
};