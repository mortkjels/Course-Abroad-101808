import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class TriangleTest {
        
    @Test
    public void testCheckType() {
        Triangle t1check = new Triangle(6, 2, 2);
        assertEquals(t1check.CheckType(), TriangleType.INVALID);
        Triangle t2check = new Triangle(2, 6, 2);
        assertEquals(t2check.CheckType(), TriangleType.INVALID);
        Triangle t3check = new Triangle(2, 2, 6);
        assertEquals(t3check.CheckType(), TriangleType.INVALID);

        // Sjekker om a <= 0, b <= 0, c <= 0
        Triangle t5check = new Triangle(0, 5, 5);
        assertEquals(t5check.CheckType(), TriangleType.INVALID);
        Triangle t6check = new Triangle(5, 0, 5);
        assertEquals(t6check.CheckType(), TriangleType.INVALID);
        Triangle t7check = new Triangle(5, 5, 0);
        assertEquals(t7check.CheckType(), TriangleType.INVALID);
    }

    @Test
    public void testCheckTypeEq() {
        Triangle t1 = new Triangle(2, 2, 2);
        assertEquals(t1.CheckType(), TriangleType.Equilateral);
    }
    @Test
    public void testCheckTypeIso() {
        Triangle t2iso = new Triangle(2,2,3);
        assertEquals(t2iso.CheckType(), TriangleType.Isosceles);
        Triangle t3iso = new Triangle(2,3, 3);
        assertEquals(t3iso.CheckType(), TriangleType.Isosceles);
        Triangle t4iso = new Triangle(2,3, 2);
        assertEquals(t4iso.CheckType(), TriangleType.Isosceles);

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

    @Test
    public void testIsRight() {
        Triangle t6 = new Triangle(5, 3, 4);
        assertEquals(t6.isRight(), true);
        Triangle t10 = new Triangle(3, 5, 4);
        assertEquals(t10.isRight(), true);
        Triangle t11 = new Triangle(3, 4, 5);
        assertEquals(t11.isRight(), true);
        Triangle t9 = new Triangle(5, 4, 4);
        assertEquals(t9.isRight(), false);
        
    }

    @Test
    public void testIsValid() {
        Triangle t7 = new Triangle(2, 2, 3);
        assertTrue(t7.isValid());
        Triangle t8 = new Triangle(0, 2, 3);
        assertFalse(t8.isValid());
    }

}

