//
//  Header.h
//  Artem_Tretyak
//
//  Created by Artem Goldenberg on 10.01.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

#ifndef Header_h
#define Header_h
#include<iostream>
class Stack;
class Point{
private:
    friend Stack;
    double x, y, z;
    Point* next;
    bool is_used;
public:
    Point();
    Point(char);
    Point(const Point & p);
    ~Point();
    void operator=(const Point&);
    void Negative();
    friend bool Not_Equal(const Point&, const Point&);
    friend bool Equal(const Point&, const Point&);
    friend void Increase_Min(Point & p);
    friend void Increase(Point &p, double  a);
    void Reduce_Max();
    void Reduce(double a);
    friend std::ostream& operator<<(std::ostream&, const Point&);
};

#endif

