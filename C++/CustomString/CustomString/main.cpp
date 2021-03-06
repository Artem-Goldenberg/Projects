#include <cstddef>
#include <cstring>
#include <iostream>
using namespace std;

class String {
public:
    size_t size;
    char* str;
    
public:
    String(const char* str = "") {
        this->size = strlen(str);
        
        this->str = new char[this->size + 1];
        
        for (size_t i = 0; i < this->size; ++i) {
            this->str[i] = str[i];
        }
        
        this->str[this->size] = '\0';
    }
    
    String(size_t n, char c) {
        this->size = n;
        
        str = new char[this->size + 1];
        
        for (size_t i = 0; i < this->size ; ++i) {
            this->str[i] = c;
        }
        
        this->str[this->size] = '\0';
    }
    
    String(const String& other) : String(other.str) {};
    
    ~String() {
        delete [] str;
        str = nullptr;
    }
    
    String& operator =(const String& other) {
        this->size = other.size;
        
        this->str = new char[this->size + 1];
        
        for (size_t i = 0; i < this->size; ++i) {
            this->str[i] = other.str[i];
        }
        
        this->str[this->size] = '\0';
        
        return *this;
    }
    
    void append(const String& other, bool withSpaces = false) {
        String tmp(*this);
        
        this->size += other.size;
        
        if (withSpaces) this->size += 1;
        
        this->str = new char[this->size + 1];
        
        size_t i = 0;
        
        for (; i < tmp.size; ++i)
            this->str[i] = tmp.str[i];
        
        if (withSpaces) {
            this->str[i] = ' ';
            i++;
        }
        
        for (size_t j = 0; j < other.size; ++j)
            this->str[i + j] = other.str[j];
        
        this->str[this->size] = '\0';
    }
    
    void operator +=(const String& addString) {
        (*this).append(addString);
    }
    
    String operator +(const String& addString) {
        String tmp;
        
        tmp.append(*this);
        tmp.append(addString);
        
        return tmp;
    }
    
    friend ostream& operator <<(ostream& out, const String& string) {
        out << string.str;
        
        return out;
    }
};


int main() {
    
    String name1 = "Artem", name2 = " Goldenberg";
    String name3;
    name3 = name1 + name2;
    cout << name3 << endl;
    
    return 0;
}


