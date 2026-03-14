package FirstDelivery;

public class Circle extends Shape {

    private final double radius;

    @Override
    public double area() {
        return radius * radius * Math.PI;
    }

    @Override
    public double perimeter() {
        return 2 * radius * Math.PI;
    }

    public Circle(double radius) {
        this.radius = radius;
    }

}
