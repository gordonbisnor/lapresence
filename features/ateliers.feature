Feature: Ateliers

Scenario:  A user views the ateliers
  When  I view the ateliers page
	Then I should see the ateliers
	When I view one atelier
	Then I should see the atelier

Scenario: Admin views the admin ateliers section
  When  I view the admin ateliers section
	Then I should see the admin ateliers

Scenario: Admin creates atelier
  When  I create an atelier
	Then I should see that atelier

Scenario: Admin updates atelier
	When  I update an atelier
	Then I should see that atelier updated

Scenario: Admin deletes atelier
	When I delete an atelier
	Then that atelier should be gone