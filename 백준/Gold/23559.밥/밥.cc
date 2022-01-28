#include<bits/stdc++.h>

using namespace std;

vector<pair<int, int>> v;

int main()
{
	int n, x;
	cin >> n >> x;
	v.resize(n);

	int sum = 0;
	for (int i = 0; i < n; i++) {
		cin >> v[i].first >> v[i].second;
		sum += v[i].second;
        x-=1000;
	}
	sort(v.begin(), v.end(), [](const pair<int, int > a, const pair<int, int> b) {
		return abs(a.first - a.second) > abs(b.first - b.second);
		});
	
	for (int i = 0; i < n; i++) {
		if (x >= 4000 && v[i].first - v[i].second >= 0) {
			x -= 4000;
			sum += v[i].first - v[i].second;
		}
	}
	cout << sum;
}