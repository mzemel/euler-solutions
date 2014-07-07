#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

int factors_sum(int a){
	int sum = 1;
	for (int i = 2; i <= floor(sqrt(a)); i++){
		if (a%i == 0){
			sum += (i + a/i);
		}
	}
	if (floor(sqrt(a)) == float(sqrt(a))){
		sum -= sqrt(a);
	}
	return sum;
}

int is_abundant(int a){
	if (factors_sum(a) > a) {return true;}
	else {return false;}
}

int main(){
	vector<int> abundants;
	vector<int> possibles;
	for (int j = 1; j < 28124; j++){
		if (is_abundant(j)){
			abundants.push_back(j);
		}
	}
	for (int k = 0; k < abundants.size(); k++){
		for (int l = 0; l < abundants.size(); l++){
			if (abundants[l] + abundants[k] > 28123){break;}
			possibles.push_back(abundants[l] + abundants[k]);
		}
	}
	cout << possibles.size();
	return 0;
}