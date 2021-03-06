//
//  Coordinates.cpp
//  Artem_Tretyak
//
//  Created by Artem Goldenberg on 10.01.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//
#include<iostream>
#include "Coordinates.h"

double three_min(double a, double b, double c){
    double min = a;
    if (min > b)
    {
        min = b;
    }
    if (min > c)
    {
        min = c;
    }
    return min;
}
double three_max(double a, double b, double c){
    double max = a;
    if (max < b)
    {
        max = b;
    }
    if (max < c)
    {
        max = c;
    }
    return max;
}
Point::Point(){
    this->x = 0;
    this->y = 0;
    this->z = 0;
    this->next = nullptr;
    this->is_used = false;
}
void Increase_Min(Point& p){
    double min  = three_min(p.x, p.y, p.z);
    p.x += min;
    p.y += min;
    p.z += min;
}
void Point::Reduce(double a){
    char ch;
    double d = three_max(x, y, z);
    if (d == x)
        ch = 'x';
    else if (d == y)
        ch = 'y';
    else 
        ch = 'z';
//    std::cout << "Enter what coordinate do you want to reduce(x, y, z):\n";
//    std::cin >> ch;
    switch (ch) {
        case 'x':
            this->x -= a;
            break;
        case 'y':
            this->y -= a;
            break;
        case 'z':
            this->z -= a;
            break;
            
        default:
            std::cout << "Error!\n";
            exit(0);
        break;
            
    }
}
void Point::Negative(){
    x *= -1;
    y *= -1;
    z *= -1;
}

Point::~Point() {
    if (this->next != nullptr)
    {
        delete this->next;
        this->next = nullptr;
    }
}

void Point::Reduce_Max() { 
    double max = three_max(this->x, this->y, this->z);
    this->x -= max;
    this->y -= max;
    this->z -= max;
}

void Point::operator=(const Point &p) {
    this->x = p.x;
    this->y = p.y;
    this->z = p.z;
//    this->is_used = true;
}

Point::Point(char) { 
    this->x = rand() % 201 - 100;
    this->y = rand() % 201 - 100;
    this->z = rand() % 201 - 100;
    this->is_used = true;
    
}

std::ostream& operator<<(std::ostream& out, const Point& p){
    out << "(" << p.x << ";" << p.y << ";" << p.z << ")";
    return out;
}

Point::Point(const Point &p) { 
    *this = p;
}





void Increase(Point & p, double a){
    char ch;
    double d = three_min(p.x, p.y, p.z);
    if (d == p.x)
        ch = 'x';
    else if (d == p.y)
        ch = 'y';
    else
        ch = 'z';
//    std::cout << "Enter what coordinate do you want to increase(x, y, z):\n";
//    std::cin >> ch;
    switch (ch) {
        case 'x':
            p.x += a;
            break;
        case 'y':
            p.y += a;
            break;
        case 'z':
            p.z += a;
            break;
        default:
            std::cout << "Error!\n";
            exit(0);
            break;
    }
}

