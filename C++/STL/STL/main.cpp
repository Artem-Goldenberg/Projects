//
//  main.cpp
//  Artem_Tretyak
//
//  Created by Artem Goldenberg on 10.01.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

#include <iostream>
#include "Coordinates.h"
#include "Stack.h"
#include <ctime>
#include <vector>
using namespace std;


int main()
{
    srand(time(0));
    const int size = 5 + rand() % 6;
    Stack s(size);
    for (unsigned i = 0; i < size; i++)
    {
        Point P('r');  // random value
        s.Add(P);    // add random value to Stack
        cout << "Value " << P << " added to stack" << endl;
    }
    cout << "\n\n\n";
    vector<Point> v(size);
    //vector<Point> ex_v;
    Point first;
    Point second;
    for (unsigned i = 0; i < size; i++)
    {
        first = s.Top();
        cout << "Top element is " << first << endl;
        if ( i != 0 && Not_Equal(first, second))
        {
            string answ;
            cout << "Top element is not equal to previous, so you need to make changes:" << endl;
            cout << "Enter what do you want to do(Im, I, Rm, R):\n";
            cin >> answ;
           // answ = "Im";
            if (answ == "Im")
            {
                Increase_Min(first);
            }
            else if (answ == "I")
            {
                int a;
                cout << "Enter a digit to increase: ";
                cin >> a;
                Increase(first, a);
                
            }
            else if (answ == "Rm")
            {
                first.Reduce_Max();
            }
            else if (answ == "R")
            {
                int a;
                cout << "Enter a digit to reduce: ";
                cin >> a;
                first.Reduce(a);
            }
            else
            {
                cout << "Wrong Input!\n";
                system("pause");
                return 0;
            }
            cout << "Element has been editted, now it`s value is " << first << endl;
        }
        v[i] = first;
        s.Extract();
        cout << "Top element has been extracted\n\n";
        second = first;
    }
    cout << "\n\n\n";
    for (int i = size - 1; i > -1; i--)
    {
        cout << "Element " << v[i] << ":\n";
        if (s.Less(v[i], 0) == '3')
        {
            cout << "It has 3 negative coordinates..." << endl;
            v[i].Negative();
            cout << "Now it`s value is " << v[i] << endl;
        }
        else
        {
             cout << "It has`n 3 negative coordinates..." << endl;
            v[i] = (i == size - 1? v[i-1] : v[i+1]);
            cout << "Now it`s value is " << v[i] << endl;
        }
        cout << "\n";
    }
    system("pause");
    return 0;
}
