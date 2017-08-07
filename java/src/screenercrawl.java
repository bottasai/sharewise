import java.io.File;
import java.io.IOException;
 
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
 
/**
* Java Program to parse/read HTML documents from File using Jsoup library.
* Jsoup is an open source library which allows Java developer to parse HTML
* files and extract elements, manipulate data, change style using DOM, CSS and
* JQuery like method.
*
* @author Javin Paul
*/
public class screenercrawl{
 
    public static void main(String args[]) {
 
        // Parse HTML String using JSoup library
        String HTMLSTring = "<!DOCTYPE html>"
                + "<html>"
                + "<head>"
                + "<title>JSoup Example</title>"
                + "</head>"
                + "<body>"
                + "<table><tr><td><h1>HelloWorld</h1></tr>"
                + "</table>"
                + "</body>"
                + "</html>";
 
        Document html = Jsoup.parse(HTMLSTring);
        String title = html.title();
        String h1 = html.body().getElementsByTag("h1").text();
 
        System.out.println("Input HTML String to JSoup :" + HTMLSTring);
        System.out.println("After parsing, Title : " + title);
        System.out.println("Afte parsing, Heading : " + h1);
 
        // JSoup Example 2 - Reading HTML page from URL
        Document doc;
        try {
            doc = Jsoup.connect("https://www.screener.in/company/JUSTDIAL/").get();
            title = doc.title();
	Elements div = doc.select("span[data-reactid=.0.1.0.4.3.1.1.1.3.0]");
        System.out.println(div.first());
        System.out.println("Jsoup Can read HTML page from URL, title : " + doc);
        } catch (IOException e) {
            e.printStackTrace();
        }
 


        
//        String cssClass = doc.select("[data-reactid=.0.1.0.4.3.1.1.1.3.0]"); // getting class form HTML element 
 
   
    }
 
}

