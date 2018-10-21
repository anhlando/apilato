package steps;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import io.restassured.http.ContentType;
import io.restassured.response.Response;
import utilities.Environment;
import utilities.Log;
import utilities.TestExecution;

import java.util.List;

import static io.restassured.RestAssured.given;

public class DemoSteps {
    @And("^log var \\((.*)\\)$")
    public void logVarOTP_DEMO(String var) throws Throwable {
        Log.info("abcbscbsabsabdsabdsa 123`13 " + Environment.globalVar.get(var));
    }

    @Given("^jsonplaceholder get users$")
    public void jsonplaceholderGetUsers() throws Throwable {
        Response response = given().headers("Content-Type", ContentType.JSON, "Accept", ContentType.JSON)
                .when().get("https://jsonplaceholder.typicode.com/users")
                .then().contentType(ContentType.JSON).extract().response();
        List<String> jsonResponse = response.jsonPath().getList("$");
        for (int i=0;i<jsonResponse.size();i++){
            Log.info(i + ": " + jsonResponse.get(i));
        }

    }

    @Then("^work with response$")
    public void workWithResponse() throws Throwable {
        try {
            TestExecution.api.test();
        }
        catch (Throwable e){
            Log.error(e.getMessage());
        }
    }
}
