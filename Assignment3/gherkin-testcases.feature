Feature: PetClinic Testing
    Systematic testing of owner, pet, and visit functionality


    # =========================
    # FIND OWNERS (SEARCH)
    # =========================

    Scenario: Search for an owner by their first name
        Given I am on the "Find Owners" page
        When I enter "John" into the first name field
        And I click the "Find Owner" button
        Then I should see a list of owners with the first name "John"
    # The scenario above assumes that we can search by first name
    # The app is only designed to search by last name, so this will fail.

    Scenario: Search for owner with last name
        Given I am on the "Find Owners" page
        When I enter "Coleman" into the last name field
        And I click the "Find Owner" button
        Then I should see a list of owners with the last name "Coleman"
        # The scenario searched for an owner by their last name and got the list

    Scenario: Search for owner with invalid last name according to the DB
        Given I am on the "Find Owners" page
        When I enter "Smith" into the last name field
        And I click the "Find Owner" button
        Then I should see a message that no owners found with the last name "Smith"
        # No owner exists with this name


    # =========================
    # OWNER CREATION
    # =========================

    Scenario: Add owner
        Given I am on the "Find Owners" page
        When I click the "Add Owner" button
        And I fill in the owner details with first name "John", last name "Doe", 
            address "123 Main St", city "New York", and telephone "1234567890"
        And I click the "Add Owner" button
        Then I should see a confirmation message that the owner has been added
        # Owner successfully added
    
    Scenario: Add owner with same details
        Given I am on the "Find Owners" page
        When I click the "Add Owner" button
        And I fill in the owner details with first name "John", last name "Doe", 
            address "123 Main St", city "New York", and telephone "1234567890"
        And I click the "Add Owner" button
        Then I should see a invalid message that the owner has not been added due to duplicate details. 
        # Owner successfully added, even though it has the same details as an existing owner. 
        # The system allows duplicate entries (potential issue)
        
    Scenario: Add owner with only first name
        Given I am on the "Find Owners" page
        When I click the "Add Owner" button
        And I fill in the owner details with first name "John", and leave all other fields blank
        And I click the "Add Owner" button
        Then I should see a invalid message that the owner has not been added and the other fields have to be filled out. 
        # Owner not added due to missing information


    # =========================
    # OWNER EDITING
    # =========================

    Scenario: Change Owner's information
        Given I choose an owner from the catalog, let's say "Jean Coleman"
        When I click the "Edit Owner" button
        And change the owner's first name to "Jolly" and City to "Los Angeles"
        And click the "Update Owner" button
        Then I get a update confirmation message that the owner's information has been updated
        # System allows editing existing catalog owner

    Scenario: Change an owners information with invalid telephone number
        Given I choose an owner from the catalog, let's say "Jolly Coleman"
        When I click the "Edit Owner" button
        And change the owner's telephone number to "123456890"
        And click the "Update Owner" button
        Then I get an update confirmation message that it's changed
        # Invalid number accepted (potential issue)

    Scenario: Use letters in phone numbers
        Given I choose an owner from the catalog, let's say "Jolly Coleman"
        When I click the "Edit Owner" button
        And change the owner's telephone number to "12345678ab"
        And click the "Update Owner" button
        Then I get an invalid message that it's not a valid telephone number
        # Validation works for letters
    
    Scenario: Only have 5 digits in the phone number
        Given I choose an owner from the catalog, let's say "Jolly Coleman"
        When I click the "Edit Owner" button
        And change the owner's telephone number to "12345"
        And click the "Update Owner" button
        Then I get an invalid message that it's not a valid telephone number
        # Validation works for numbers lower than 10 digits


    # =========================
    # PET MANAGEMENT
    # =========================

    Scenario: Add Pet to the owner
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Buddy", birth date "2026-01-01" and type "Dog"
        And I click the "Add Pet" button
        Then I should see a confirmation message that the pet has been added to the owner "John Doe"
        # Pet successfully added

    Scenario: Add Pet to the owner with invalid future birth date
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Fluffy", birth date "2027-01-01" and type "Dog"
        And I click the "Add Pet" button
        Then I should see a invalid message that the pet has an invalid birth date
        # Future date rejected

    Scenario: Add Pet to the owner with unrealistic past birth date and add visit
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the pet name "Fluffy", birth date "1090-01-01" and type "Dog"
        And I click the "Add Pet" button
        And I Click the "Add Visit" button to "Fluffy"
        And I fill in the visit details with date "2023-01-01" and description "Regular Checkup"
        And I click the "Add Visit" button
        Then I got the confirmation message that the visit has been added to "Fluffy"
        # System allows unrealistic dates (potential issue)

    Scenario: Add Pet to the owner with no name
        Given I added the owner "John Doe"
        When I click the "Add New Pet" button
        And I fill in the birth date "2025-01-01" and type "Bird"
        And I click the "Add Pet" button
        Then I should see a invalid message that the pet needs a name
        #No name rejected

    # =========================
    # VISITS
    # =========================
    # (Currently combined with pet scenario above)

    Scenario: Check for a visit in the future
        Given I use the owner "John Doe" and pet "Buddy"
        When I click the "Add visit" button
        And I fill in the deatils with date "2026-03-25" and description "Vaccination"
        And I click the "Add Visit" button
        Then I should see a confirmation message that the visit has an future date that is valid    
        # Future date approved

    Scenario: Check for a visit with unrealistic past date
        Given I use the owner "John Doe" and pet "Buddy"
        When I click the "Add visit" button
        And I fill in the deatils with date "1090-03-25" and description "Vaccination"
        And I click the "Add Visit" button
        Then I should see a confirmation message that the visit has an unrealistic past date that is valid
        # Unrealistic past date approved, should be rejected

    Scenario: Check for a visit with date before born
        Given I use the owner "John Doe" and pet "Buddy"
        When I click the "Add visit" button
        And I fill in the deatils with date "2024-03-22" and description "Vaccination"
        And I click the "Add Visit" button
        Then I should see a confirmation message that the visit has an unrealistic past date that is valid
        # Unrealistic past date approved, should be rejected since the pet is not born yet.

    

