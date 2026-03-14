package FirstDelivery;

public class Main {

    public static void main(String[] args) {
        Shape f1 = new Circle(20);
        System.out.println("Area: " + f1.area() + "Perimeter: " + f1.perimeter());
        Shape f2 = new Rectangle(10, 5);
        System.out.println("Area: " + f2.area() + "Perimeter: " + f2.perimeter());
    }
}
