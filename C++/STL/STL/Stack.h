//
//  Stack.hpp
//  Artem_Tretyak
//
//  Created by Artem Goldenberg on 15.01.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

#ifndef Stack_hpp
#define Stack_hpp
class Point;
class Stack {
    Point* top;
    int size;
public:
    Stack(int);
    Stack();
    ~Stack();
    void Add(Point&);
    Point& Top();
    void Extract();
    friend bool Not_Equal(const Point&, const Point&);
    friend bool Equal(const Point&, const Point&);
    char More(const Point&, double);
    char Less(const Point&, double);
    void Assign(Point&, const Point&);
};

#endif /* Stack_hpp */
