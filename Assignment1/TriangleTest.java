import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class TriangleTest {
    @Test
    public void testCheckTypeEq() {
        Triangle t1 = new Triangle(2, 2, 2);
        assertEquals(t1.CheckType(), TriangleType.Equilateral);
    }
    @Test
    public void testCheckTypeIso() {
        Triangle t2 = new Triangle(2, 2, 3);
        assertEquals(t2.CheckType(), TriangleType.Isosceles);
    }
    @Test
    public void testCheckTypeSca() {
        Triangle t3 = new Triangle(2, 3, 4);
        assertEquals(t3.CheckType(), TriangleType.Scalene);
    }
    @Test
    public void testCheckTypeInvalid() {
        Triangle t4 = new Triangle(2, 3, 10);
        assertEquals(t4.CheckType(), TriangleType.INVALID);
    }
}
