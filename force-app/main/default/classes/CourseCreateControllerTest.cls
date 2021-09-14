@isTest
public  class CourseCreateControllerTest {
    public CourseCreateControllerTest() {

    }

    @isTest
    static void TestgetCategoryFieldValue(){
        Map<String, String> result = CourseCreateController.getCategoryFieldValue();
        System.assertNotEquals(null, result);
    }
}