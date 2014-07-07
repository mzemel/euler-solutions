#include <iostream>
#include <math.h>

using namespace std;

int factors(int val){
	int sum = 0;
	for (int i = 2; i < floor(sqrt(val)); i++){
		if (val % i == 0){
			sum += i;
			sum += val / i;
		}
	}
	sum++;
	if (floor(sqrt(val)) == sqrt(val)){
		sum += sqrt(val);
	}
	return sum;
}

int main(){
	int am_sub = 0;
	for (int i = 2; i < 10000; i++){
		for (int j = 2; j < 10000; j++){
			if (factors(i) == j && factors(j) == i && j != i){
				am_sub += i;
			}
		}
	}
	cout << am_sub;
	return 0;
}