//
//  Stack.cpp
//  Artem_Tretyak
//
//  Created by Artem Goldenberg on 15.01.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

#include "Stack.h"
#include "Coordinates.h"

Stack::Stack(int size) {
    this->size = size;
    this->top = new Point;
    Point* current = this->top;
    for (unsigned i = 1; i < size; i++)
    {
        current->next = new Point;
        current = current->next;
    }
    current = nullptr;
}


void Stack::Assign(Point & p1, const Point& p2) {
    p1 = p2;
}

char Stack::Less(const Point & p , double a) {
    int counter = 0;
    if (p.x < a)
    {
        counter++;
    }
    if (p.y < a)
    {
        counter++;
    }
    if (p.z < a)
    {
        counter++;
    }
    return counter + '0';
}


char Stack::More(const Point & p, double a) {
    int counter = 0;
    if (p.x > a)
    {
        counter++;
    }
    if (p.y > a)
    {
        counter++;
    }
    if (p.z > a)
    {
        counter++;
    }
    return counter + '0';
}

Point &Stack::Top() { 
    Point* current = this->top;
    while (!current -> is_used) current = current->next;
    return *current;
    current = nullptr;
}


void Stack::Add(Point & p) {
    Point* current = this->top;
    Point* ex_current = this->top;
    while (current != nullptr && !current->is_used) {
        ex_current = current;
        current = current->next;
    }
    *ex_current = p;
    ex_current->is_used = true;
    current = ex_current = nullptr;
}

void Stack::Extract() { 
    Point* current = this->top;
    while(current->is_used != true) current = current->next;
    if (current == nullptr)
    {
        return;
    }
    Point p;
    *current = p;
    current->is_used = false;
    current = nullptr;
}

Stack::~Stack() { 
    delete top;
    top = nullptr;
}


bool Not_Equal(const Point& p1, const Point& p2){
    return (p1.x != p2.x || p1.y != p2.y || p1.z != p2.z);
}

bool Equal(const Point& p1, const Point& p2){
    return !Not_Equal(p1, p2);
}






