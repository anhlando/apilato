Feature: prepare test data before executing test

  @prepare_data
  Scenario Outline: add account which matches the given criteria to testdata file
    Given Testcase-ID (<testcaseID>) - Testcase description (<test_desc>)
    Given query for client that has (<contract_status>) (<contract_type>) contract, and extract data to (<var_phone>) and (<var_contract>)
    And register account with (?<var_phone>) and (?<var_contract>)
    Then add to test data (<prop_username>;?<var_phone>)
    And add to test data (<prop_contract>;?<var_contract>)
    And update test data file and reload it to Environment.testdata
    And report - append note (Username;?<var_phone>)
    And report - append note (Contract number;?<var_contract>)

    Examples:
      | testcaseID | test_desc                                                                  | contract_status | contract_type | var_phone    | var_contract    | prop_username                 | prop_contract                    |
      | DATA01     | Register account which has Active CEL contract and add to test data file   | Active          | CEL           | DATA01_PHONE | DATA01_CONTRACT | active_cel_account.username   | active_cel_account.contract_no   |
      | DATA02     | Register account which has Active REL contract and add to test data file   | Active          | REL           | DATA02_PHONE | DATA02_CONTRACT | active_rel_account.username   | active_rel_account.contract_no   |
      | DATA03     | Register account which has Signed CEL contract and add to test data file   | Signed          | CEL           | DATA03_PHONE | DATA03_CONTRACT | signed_cel_account.username   | signed_cel_account.contract_no   |
      | DATA04     | Register account which has Signed REL contract and add to test data file   | Signed          | REL           | DATA04_PHONE | DATA04_CONTRACT | signed_rel_account.username   | signed_rel_account.contract_no   |
      | DATA05     | Register account which has Approved CEL contract and add to test data file | Approved        | CEL           | DATA05_PHONE | DATA05_CONTRACT | approved_cel_account.username | approved_cel_account.contract_no |
      | DATA06     | Register account which has Approved REL contract and add to test data file | Approved        | REL           | DATA06_PHONE | DATA06_CONTRACT | approved_rel_account.username | approved_rel_account.contract_no |
      | DATA07     | Register account which has Finished CEL contract and add to test data file | Finished        | CEL           | DATA07_PHONE | DATA07_CONTRACT | finished_cel_account.username | finished_cel_account.contract_no |
      | DATA08     | Register account which has Finished REL contract and add to test data file | Finished        | REL           | DATA08_PHONE | DATA08_CONTRACT | finished_rel_account.username | finished_rel_account.contract_no |

