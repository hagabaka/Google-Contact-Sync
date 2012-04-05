Feature: Sync
  Scenario: Sync a missing contact
    Given the account "foo@example.com" has a contact "John Doe"
    And the account "bar@example.com" does not have a contact "John Doe"
    And the account "bar@example.com" does not have a deleted contact "John Doe"
    When I sync between the two accounts
    Then the account bar@example has a contact John Doe

  Scenario: Sync a deleted contact
    Given the account "foo@example.com" has a deleted contact "John Doe"
    And the account "bar@example.com" has a contact "John Doe"
    When I sync between the accounts ""foo@example.com", "bar@example.com"
    Then the account "bar@example.com" no contact "John Doe"

  Scenario: Sync an updated contact
    Given the account "foo@example.com" has a contact with title "John Doe", phoneNumber "123"
    And the account "bar@example.com" has a contact with title "John Doe"
    When we set the phone number of contact under "bar@example.com" with title "John Doe" to "456"
    When I sync between the two accounts
    Then the contact under "bar@example.com" with title "John Doe" has phoneNumber "456"

