import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
 
public class crawl {
 
    public static void main(String[] args) {
        // declaration and instantiation of objects/variables
        WebDriver driver = new FirefoxDriver();
        String baseUrl = "https://www.screener.in/company/JUSTDIAL/";
        String expectedTitle = "Welcome: Mercury Tours";
        String actualTitle = "";
 
        // launch Firefox and direct it to the Base URL
        driver.get(baseUrl);
 
        // get the actual value of the title
        actualTitle = driver.findElements(By.xpath("//span[data-reactid=.0.1.0.4.3.1.1.1.3.0]"))
 
        /*
         * compare the actual title of the page witht the expected one and print
         * the result as "Passed" or "Failed"
         */
        if (actualTitle.contentEquals(expectedTitle)){
            System.out.println("Test Passed!");
        } else {
            System.out.println("Test Failed");
        }
        
        //close Firefox
        driver.close();
        
        // exit the program explicitly
        System.exit(0);
    }
 
}
