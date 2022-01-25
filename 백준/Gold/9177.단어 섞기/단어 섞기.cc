#include <bits/stdc++.h>
using namespace std;
using ll = long long;

bool graph[201][201] = {false,};
string stra, strb, strc;

bool words(int a,int b,int c) {
   if (c==strc.length()) return true;
   //if (a > stra.length() || b > strb.length()) return false;
   if (graph[a][b]) return false;

   graph[a][b] = true;
   //stra, strb 두 문자 다 같을 때
   if (stra[a] == strb[b] && stra[a] == strc[c]) {
      return words(a + 1, b, c + 1) || words(a,b+1,c+1);
   }
   // stra만 같을때
   else if (stra[a] == strc[c]) {
      return words(a + 1, b, c + 1);
   }
   // strb만 같을때
   else if (strb[b] == strc[c]) {
      return words(a, b + 1, c + 1);
   }
   else {
      return false;
   }
}

int main() {
   cin.tie(NULL); cout.tie(NULL);
   ios::sync_with_stdio(false);
   int n; cin >> n;
   for (int i = 1; i <= n; i++) {
      cin >> stra >> strb >> strc;
      memset(graph,false,sizeof(graph));

      cout << "Data set "<<i<<": ";
      if (words(0, 0, 0)) cout << "yes\n";
      else cout << "no\n";
      
   }

}