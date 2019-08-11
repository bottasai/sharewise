package com.sai.shareapps;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.firefox.FirefoxDriver;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.io.BufferedReader;
import java.io.FileReader;

public class crawl {

	public static void main(String[] args) {
		// declaration and instantiation of objects/variables
		WebDriver driver = new FirefoxDriver();
		String symbol = "";
		String baseUrl = "https://www.screener.in/company/";
		FileWriter fileWriter = null;
		BufferedReader fileReader = null;
		final String COMMA_DELIMITER = ",";
		final String NEW_LINE_SEPARATOR = "\n";
		final String FILE_HEADER = "symbol,price,d2e,eps,pe,roce5y,roce1y,currentRatio,avgDivPay,high52,low52,profit5y,profit3y,profit1y,opm,sales5y,sales3y,sales1y,div,bv";
		String line = "";
		String Record = "";
		try {
			fileReader = new BufferedReader(new FileReader("nse.csv"));
			fileWriter = new FileWriter("nse1500fundamentals.csv");
			// Write the CSV file header
			fileWriter.append(FILE_HEADER.toString());
			//fileReader.readLine();
			driver.get("http://www.screener.in/login/");        
	        driver.findElement(By.id("id_username")).sendKeys("botta.saisrinivasa@gmail.com");
	        driver.findElement(By.id("id_password")).sendKeys("Prince@123");
	        driver.findElement(By.className("btn-primary")).submit();   
	        Thread.sleep(5000);
			// Read the file line by line starting from the second line
			while ((symbol = fileReader.readLine()) != null) {
				// launch Firefox and direct it to the Base URL
				driver.get(baseUrl + symbol.trim() + "/");
				Thread.sleep(5000);
			 try
			 {
				// get the actual value of the title
				 List<WebElement> price = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.0.0:$1.2.1']"));
				 List<WebElement> debt2equity = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$0.2']"));
				 List<WebElement> pe = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.0.0:$3.2.1']"));
				 List<WebElement> roce5y = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$3.2']"));
				 List<WebElement> roce1y = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$4.2']"));
				 List<WebElement> currentRatio = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$2.2']"));
				 List<WebElement> avgDivPay = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$5.2']"));
				 
				 List<WebElement> high52 = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.0.3.1.1']"));
				 List<WebElement> low52 = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.0.3.1.3']"));
				 List<WebElement> eps = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$1.2']"));
				 List<WebElement> opm = driver.findElements(By
							.xpath("//*[@data-reactid='.0.1.0.2.1.0:$6.2']"));
				 
				List<WebElement> profitgrowth5y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.1.1.3.0']"));
				List<WebElement> profitgrowth3y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.1.1.5.0']"));
				List<WebElement> profitgrowth1y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.1.1.7.0']"));
				List<WebElement> salesgrowth5y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.0.1.3.0']"));
				List<WebElement> salesgrowth3y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.0.1.5.0']"));
				List<WebElement> salesgrowth1y = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.4.3.1.0.1.7.0']"));
				List<WebElement> dividendYield = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.2.0.0:$4.2.1']"));
				List<WebElement> bookValue = driver.findElements(By
						.xpath("//*[@data-reactid='.0.1.0.2.0.0:$2.2.1']"));
//
				
				Record = symbol
						+ ","
						+ ((price.size() > 0 ) ? price.get(0).getText().replace('₹', ' ').trim().replaceAll(",",""):"-1")
						+ ","
						+ ((debt2equity.size() > 0 ) ? debt2equity.get(0).getText():"-1")
						+ ","
						+ ((eps.size() > 0 ) ? eps.get(0).getText().replace('₹', ' ').trim():"-1")
						+ ","
						+ ((pe.size() > 0 ) ? pe.get(0).getText():"-1")
						+ ","
						+ ((roce5y.size() > 0 ) ? roce5y.get(0).getText().replace('%', ' ').trim():"-1")
						+","
						+ ((roce1y.size() > 0 ) ? roce1y.get(0).getText().replace('%', ' ').trim():"-1")
						+","
						+ ((currentRatio.size() > 0 ) ? currentRatio.get(0).getText().replace('%', ' ').trim():"-1")
						+","
						+ ((avgDivPay.size() > 0 ) ? avgDivPay.get(0).getText().replace('%', ' ').trim():"-1")
						+ ","
						+ ((high52.size() > 0 ) ? high52.get(0).getText().replaceAll(",",""):"-1")
						+ ","
						+ ((low52.size() > 0 ) ? low52.get(0).getText().replaceAll(",",""):"-1")
						+ ","
						+ ((profitgrowth5y.size() > 0 ) ? profitgrowth5y.get(0).getText():"-1")
						+ ","
						+ ((profitgrowth3y.size() > 0 ) ? profitgrowth3y.get(0).getText():"-1")
						+ ","
						+ ((profitgrowth1y.size() > 0 ) ? profitgrowth1y.get(0).getText():"-1")
						+ ","
						+ ((opm.size() > 0 ) ? opm.get(0).getText().replace('%', ' ').trim():"-1")
						+ ","
						+ ((salesgrowth5y.size() > 0 ) ? salesgrowth5y.get(0).getText() : "-1")
						+ ","
						+ ((salesgrowth3y.size() > 0 ) ? salesgrowth3y.get(0).getText():"-1")
						+ ","
						+ ((salesgrowth1y.size() > 0 ) ? salesgrowth1y.get(0).getText():"-1")
						+ ","
						+ ((dividendYield.size() > 0 )?dividendYield.get(0).getText().replace('%', ' ')
								.trim():"-1") + ","
						+ ((bookValue.size() > 0 ) ? bookValue.get(0).getText().replace('₹', ' ').trim().replaceAll(",",""):"-1");
			 }
			 catch(Exception e)
			 {
			  Record = symbol+",-1,-1,-1,-1,-1,-1,-1,-1";
			 }
				// Add a new line separator after the header
				fileWriter.append(NEW_LINE_SEPARATOR);
				fileWriter.append(Record);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				fileWriter.flush();
				fileWriter.close();
			} catch (IOException e) {
				System.out
						.println("Error while flushing/closing fileWriter !!!");
				e.printStackTrace();
			}

		}
		// close Firefox
		driver.close();

		// exit the program explicitly
		System.exit(0);
	}

}
