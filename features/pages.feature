Feature: Pages

Scenario:  A user views a page
    When  I view a page
		Then I should see the page content

Scenario: Admin views the admin pages section
  When  I view the admin pages section
	Then I should see the admin pages

Scenario: Admin creates page
  When  I create a page
	Then I should see that page

Scenario: Admin updates page
	When  I update a page
	Then I should see that page updated


