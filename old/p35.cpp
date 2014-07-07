#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <sstream>
#include <assert.h>

extern void FillPrimeArray (int *, int );

using namespace std;

void rotate(int *num, string *str, ostringstream *c){
	(*c).str("");
	*c << *num;
	*str = (*c).str();
	(*str).append(1,(*str)[0]);
	(*str).erase(0,1);
	*num = atoi((*str).c_str());
}

int main ()
{
	int r;
	string s;
	ostringstream c;

	const int n = 78498;
	int table[n];

	FillPrimeArray (table, n);

	vector<int> rotations; // collection all rotated versions of a prime
	vector<int> circulars;


	for (int i = 0; i < 78498; i++){

		r = table[i];
		rotations.clear();


		//### THIS SECTION COULD BE WRITTEN BETTER #######
		rotations.push_back(r); // rotations: { r }

		bool beerake = false;

		while (beerake == false){
			rotate(&r, &s, &c);
			if (find(rotations.begin(), rotations.end(), r) == rotations.end()){
				rotations.push_back(r);	// rotations: { r, r', r'', ... }
			}
			else {
				beerake = true;	// so no { r, r', r'', r }
			}
		}
		//################################################



		beerake = false; // gonna re-use it below
		int j = 0;

		while (beerake == false && j < rotations.size()){ //for each element in rotations
			if (!(binary_search(table, table+78497, rotations[j])) || find(circulars.begin(), circulars.end(), rotations[j]) != circulars.end()){
				beerake = true; //^ if it's not prime OR circulars already contains it, BREAK and skip the next section
			}
			j++;
		}
		if (beerake == false){
			for( std::vector<int>::const_iterator i = rotations.begin(); i != rotations.end(); ++i){
	    		circulars.push_back(*i);
	    	}
		}
	}

	cout << circulars.size();

	return 0;
}





//http://911programming.wordpress.com/2010/05/10/fast-algorithm-to-find-the-first-n-prime-numbers/
void FillPrimeArray (int * table, int n)
{
	assert (n > 0);
	assert (table != NULL);

	// The first prime number is 2, and count becomes 1.
	int count = 0;
	table [count++] = 2;

	// Starting from 3, look for all numbers above 2 to find the prime numbers
	for (int number = 3; count < n; number++)
	{
		// assume prime unless the reverse is proved.
		bool prime = true;

		// Check up to SQRT (number) [conceptually] to check if
		// number is really prime.
		for (int i = 0; number / table [i] >= table [i]; i++)
		{
			// If a member in list is a divisor, then this number is
			// not prime
			if (number % table [i] == 0)
			{
				prime = false;
				break;
			}
		}

		// If loop terminated, and this number is prime,
		// then add it to the list:
		if (prime)
		{
			table [count++] = number;
		}
	}
}