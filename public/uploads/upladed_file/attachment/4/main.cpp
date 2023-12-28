#include <iostream>
#include <cmath>

const double Pi = 3.14;

class Point {
protected:
    double X, Y;

public:
    Point(double x, double y) : X(x), Y(y) {}

    void show() {
        std::cout << "Point coordinates: (" << X << ", " << Y << ")\n";
    }
};

class Circle : public Point {
protected:
    double diameter;

public:
    Circle(double x, double y, double d) : Point(x, y), diameter(d) {}

    double square() {
        return (Pi * pow(diameter, 2)) / 4;
    }

    void show() {
        Point::show();
        std::cout << "Circle diameter: " << diameter << "\n";
        std::cout << "Circle square: " << square() << "\n";
    }
};

class DerivedClass : public Circle {
public:
    DerivedClass(double x, double y, double d) : Circle(x, y, d) {}

    void show() {
        Circle::show();
    }
};

int main() {
    Point point(1.0, 2.0);
    point.show();

    Circle circle(3.0, 4.0, 5.0);
    circle.show();

    DerivedClass derived(6.0, 7.0, 8.0);
    derived.show();
} 