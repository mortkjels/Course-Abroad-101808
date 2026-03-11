import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class TriangleTest {
    @Test
    public void testEquilateral() {
        Triangle equiliteral = new Triangle(2, 2, 2);
        assertEquals(TriangleType.Equilateral, equiliteral.CheckType());
    }

    @Test
    public void testIsocoles() {
        Triangle isosceles = new Triangle(4, 4, 2);
        assertEquals(TriangleType.Isosceles, isosceles.CheckType());
    }   

    @Test
    public void testScalene() {
        Triangle scalene = new Triangle(3, 4, 5);
        assertEquals(TriangleType.Scalene, scalene.CheckType());
    }   

}
