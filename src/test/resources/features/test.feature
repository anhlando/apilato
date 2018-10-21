Feature: used for testing
  @test
  Scenario: working with array/list in rest assured
    Given Testcase-ID (test_99) - Testcase description (working with array/list/map in RestAssured)
    Given Login with (0934313309;Qwer1234) and get the access_token
    Given endpoint (api/customer/contracts)
    Given param - string (header;Authorization;?ACCESS_TOKEN)
    When execute (GET)
    Then status (200)
    Then work with response