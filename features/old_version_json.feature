@rspec @old_coverage_json @announce-output @announce-command

Feature:

  This test project has a resultset.json generated by simplecov 0.17.1 lying around
  (we changed the file format in 0.18) - as long as we want a hassle free upgrade
  path from 0.17 and below to our current version this cuke should pass :) #820

  Scenario: Running the tests succeeds
    Given the paths in the old .resultset.json are adjusted to the current environment
    When I open the coverage report generated with `bundle exec rspec spec`
    Then I should see the groups:
      | name      | coverage | files |
      | All Files | 88.89%    | 2     |
    And I should see a line coverage summary of 8/9

  Scenario: Running the tests succeeds even with a current time stamp
    Given the paths in the old .resultset.json are adjusted to the current environment
    And the timestamp in the .resultset.json is current
    When I open the coverage report generated with `bundle exec rspec spec`
    Then I should see the groups:
      | name      | coverage | files |
      | All Files | 88.89%    | 2     |
    And I should see a line coverage summary of 8/9
