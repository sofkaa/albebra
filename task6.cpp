#include <iostream>
#include <vector>
#include <list>

using namespace std;

const int MAX_N = 1000;
const int num_pockets = 50;

int inverse (vector <int > &a) { // определение кол-ва инверсий
    int res = 0, i = 0;
    vector <list <int > > lst_pockets(num_pockets);
    for (i = 0; i < a.size(); i++) {
        int pos = (a[i] - 1) / (MAX_N / num_pockets);
        auto iteration = lst_pockets[pos].begin();
        int next = 0;
        while (iteration != lst_pockets[pos].end() && *iteration < a[i]) {
            iteration++;
            next++;
        }
        res += lst_pockets[pos].size() - next;
        lst_pockets[pos].insert(iteration, a[i]); 
        for (int j = pos + 1; j < num_pockets; j++) {
            res += lst_pockets[j].size();
        }
    }
    return res;
}

int main ()
{
    int N; 
    cout << "Введите длину перестановки: "; 
    cin >> N;
    vector <int > a(N);
    cout << "Введите перестановку :";
    for (int i = 0; i < N; i++) cin >> a[i];
    int res = inverse(a);
    if (res % 2 == 0) cout << "Четная";
    else cout << "Нечетная\n";
    return 0;
}