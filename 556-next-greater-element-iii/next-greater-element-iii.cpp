class Solution {
public:
    int ans(int n) {
        vector<int> a;
        while(n > 0) {
            int digit = n % 10;
            a.push_back(digit);
            n = n/10;
        }
        reverse(a.begin(), a.end());
        int index = -1;
        for(int i=a.size()-2; i>=0; i--) {
            if(a[i+1] > a[i]) {
                index = i;
                break;
            }
        }
        if(index == -1) return -1;
        for(int i=a.size()-1; i>index; i--) {
            if(a[i] > a[index]) {
                swap(a[i], a[index]);
                break;
            }
        }
        reverse(a.begin()+index+1, a.end());
        long long result = 0;
        for(int i = 0; i < a.size(); i++) {
            result = result * 10 + a[i];
        }
        if(result > INT_MAX) return -1;
        return (int)result;
    }
    int nextGreaterElement(int n) {
        return ans(n);
    }
};