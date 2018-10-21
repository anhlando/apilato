Feature: register for a new account with a pair of contract number & phone number

  @register1
  Scenario Outline: register account unsuccessfully - failed at step 1
    Given Testcase-ID (<testcaseID>) - Testcase description (<test_desc>)
    Given query for a pair of contract number and phone number to register account - assign to (REG_CONTRACT) and (REG_PHONE)
    #step 1 - verify contract no and phone no
    Given endpoint (api/customer/signup/verify)
    Given param - string (header;Content-Type;application/json)
    And param - string (body;PhoneNumber;<phone>)
    And param - string (body;ContractNumber;<contract>)
    When execute (POST)
    Then status (200)
    And verify response value equals (int;response_code;<response_code>)
    And verify response value equals (string;response_string_code;<response_string_code>)
    And verify response value equals (string;response_message;<response_message>)
    Examples:
      | testcaseID | test_desc                                                     | phone              | contract           | response_code | response_string_code                          | response_message                           |
      | BE_01      | Register account unsuccessfully with invalid phone            | #random_number(5)  | ?REG_CONTRACT      | 81            | ^register.response.invalidphone.stringcode    | ^register.response.invalidphone.message    |
      | BE_02      | Register account unsuccessfully with invalid contract         | ?REG_PHONE         | #random_number(10) | 70            | ^register.response.invalidcontract.stringcode | ^register.response.invalidcontract.message |
      | BE_03      | Register account unsuccessfully with invalid phone & contract | #random_number(10) | #random_number(10) | 77            | ^register.response.invalidphone.stringcode    | ^register.response.invalidphone.message    |

  @register
  Scenario: register account successfully
    Given Testcase-ID (BE-01) - Testcase description (Successfully register an account)
    Given query for a pair of contract number and phone number to register account - assign to (REG_CONTRACT) and (REG_PHONE)
    #step 1 - verify contract no and phone no
    Given endpoint (api/customer/signup/verify)
    Given param - string (header;Content-Type;application/json)
    And param - string (body;PhoneNumber;?REG_PHONE)
    And param - string (body;ContractNumber;?REG_CONTRACT)
    When execute (POST)
    Then status (200)
    And verify response value equals (int;response_code;0)
    #step 2 - query OTP and send OTP to api step 2
    Given query for OTP to register account with contract number = (?REG_CONTRACT) and assign to global var (REG_OTP)
    Given endpoint (api/customer/signup/verify/otp)
    Given param - string (header;Content-Type;application/json)
    And param - string (body;PhoneNumber;?REG_PHONE)
    And param - string (body;ContractNumber;?REG_CONTRACT)
    And param - string (body;VerificationCode;?REG_OTP)
    When execute (POST)
    Then status (200)
    And verify response value equals (int;response_code;0)
    #step 3: set password
    Given endpoint (api/customer/signup)
    Given param - string (header;Content-Type;application/json)
    And param - string (body;PhoneNumber;?REG_PHONE)
    And param - string (body;ContractNumber;?REG_CONTRACT)
    And param - string (body;VerificationCode;?REG_OTP)
    And param - string (body;Password;|testdata.password)
    When execute (POST)
    Then status (200)
    And verify response value equals (int;response_code;0)
    #add note to the final report
    Then report - append note (Registered account;?REG_PHONE)
    And report - append note (Registered contract;?REG_CONTRACT)
