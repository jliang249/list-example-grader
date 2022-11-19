import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;

public class TestListExamples {
  // Write your grading tests here!

    public class NewChecker implements StringChecker{
        public boolean checkString(String S){
            return S.length() > 4;
        }
    }


  @Test
    public void testFilter(){
        List<String> input = List.of("irony", "smile");
        StringChecker checker = new NewChecker();

        assertArrayEquals(input.toArray(), ListExamples.filter(input, checker).toArray());
    }    

    @Test
    public void testMerge(){
        List<String> input1 = List.of("apple", "banana");
        List<String> input2 = List.of("aardvark", "chili", "dog");
        List<String> expected = List.of("aardvark", "apple", "banana", "chili", "dog");

        assertArrayEquals(expected.toArray(), ListExamples.merge(input1, input2).toArray());
    }
}