Feature: SearchOwner
    I want to search for an owner by their first name

    Scenario: Search for an owner by their first name
        Given I am on the "Find Owners" page
        When I enter "John" into the first name field
        And I click the "Find Owner" button
        Then I should see a list of owners with the first name "John"

    # The scenario above assumes that we can search by first name
    # The app is only designed to search by last name, so this will fail.

    Scenario: Add owner
        Given I am on the "Find Owners" page
        When I click the "Add Owner" button
        And I fill in the owner details with first name "John", last name "Doe", 
            address "123 Main St", city "New York", and telephone "1234567890"
        And I click the "Add Owner" button
        Then I should see a confirmation message that the owner has been added.
    # The scenario added the owner and got the confirmation
    
    Scenario: "Add Pet to the owner"
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Buddy", birth date "2026-01-01" and type "Dog"
        And I click the "Add Pet" button
        Then I should see a confirmation message that the pet has been added to the owner "John Doe"

        # The scenario added a pet to the owner and got the confirmation

    Scenario: "Add Pet to the owner with invalid birth date"
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Fluffy", birth date "2027-01-01" and type "Dog"
        And I click the "Add Pet" button
        Then I should see a invalid message that the pet has an invalid birth date

        #The Scenario did not add a pet to the owner since the birth date is in the future
    
    Scenario: "Add Pet to the owner with invalid birth date"
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Fluffy", birth date "1090-01-01" and type "Dog"
        And I click the "Add Pet" button
        And I Click the "Add Visit" button to "Fluffy"
        And I fill in the visit details with date "2023-01-01" and description "Regular Checkup"
        And I click the "Add Visit" button
        Then I got the confirmation message that the visit has been added to "Fluffy"
        # The scenario added the pet and visit, should not be able since the visit is in 2024 and the birth date is in 1090
        # The Scenario did add a pet to the owner eventhough the birth date is in the past with an unrealistic date

    Scenario: Scenario name