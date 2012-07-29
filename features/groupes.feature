Feature: Groupes

Scenario:  A user views the groupes
    When  I view the groupes page
		Then I should see the groupes
		When I view one groupe
		Then I should see the groupe

Scenario: Admin views the admin groupes section
  When  I view the admin groupes section
	Then I should see the admin groupes

Scenario: Admin creates groupe
  When  I create a groupe
	Then I should see that groupe

Scenario: Admin updates groupe
	When  I update a groupe
	Then I should see that groupe updated

Scenario: Admin deletes groupe
	When I delete a groupe
	Then that groupe should be gone

