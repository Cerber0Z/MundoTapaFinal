/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sergi
 */
import org.junit.AfterClass;
import org.junit.Test;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;

public class Selenium {


    @Test
    public void inserttar() {
        
        
        System.setProperty("webdriver.chrome.driver", "C:\\Users\\sergi\\Downloads\\chromedriver_win32\\chromedriver.exe");
        
        WebDriver driver = new ChromeDriver();
            
        driver.get("http://localhost:8080/MundoTapa/registro.jsp");
        
        
        WebElement txtducmento = driver.findElement(By.id("txtNumDoc"));
        txtducmento.sendKeys("351125229");
        
         WebElement txtPrimerNombre = driver.findElement(By.id("txtPrimerNombre"));
        txtPrimerNombre.sendKeys("Juanita");
        
         WebElement txtPrimerApellido = driver.findElement(By.id("txtPrimerApellido"));
        txtPrimerApellido.sendKeys("Sanchez");
        
         WebElement txtCelular = driver.findElement(By.id("txtCelular"));
        txtCelular.sendKeys("3506606526");
        
         WebElement txtEmail = driver.findElement(By.id("txtEmail"));
        txtEmail.sendKeys("juanitaSanchex10@gmail.com");
        
         WebElement txtContrsena = driver.findElement(By.id("txtContrsena"));
        txtContrsena.sendKeys("patitos123");
        
        
         WebElement txtContrsena2 = driver.findElement(By.id("txtContrsena2"));
        txtContrsena2.sendKeys("patitos123");
        
        WebElement btnRegistrar = driver.findElement(By.name("btnRegistrar"));
        btnRegistrar.click();
        
 
    }

    @AfterClass
    public static void matarDriver() {

        try {
            WebDriver driver = new ChromeDriver();
            
            driver.quit();
        } catch (Exception e) {
            System.out.println("Nothing to do with it");
        }
    }

}
