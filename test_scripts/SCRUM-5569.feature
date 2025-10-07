Scenario: Public Viewing of Published Innovation Stories
  Given the system contains three published Innovation Stories (Story A, B, and C)
    And Story A is categorized as "Future Tech Initiative"
    And Story B was published 10 days ago
  When a public user navigates to the "/innovation-stories" portal page
  Then the system displays a list view containing Story A, Story B, and Story C
  And each displayed item includes:
    | Metadata Field | Status/Requirement |
    | Title          | Visible and clickable |
    | Category Tag   | Correctly displayed (e.g., "Future Tech Initiative") |
    | Publication Date | Displayed in a readable format |
    | Author/Source  | Clearly identified |
  And clicking on the title of Story B navigates the user to the full content page
```

***

### Scenario 2: Content Contributor Role - Creation and Categorization

**Goal:** Verify that authorized users can create new content and correctly assign it to defined research initiatives.

```gherkin
Scenario: Content Administrator Submitting a New Story with Categorization
  Given I am logged in as a "Content Administrator"
    And the current available Initiative Categories are: "AI Development", "Clean Energy Research", and "Materials Science"
  When I navigate to the "Create New Story" dashboard
  And I input the required fields:
    | Field | Value |
    | Title | "Breakthrough in Bio-Plastics" |
    | Content Body | "Detailed summary of the recent findings..." |
    | Initiative Category | "Clean Energy Research" |
    | Status | "Pending Review" |
  And I click the "Submit Story" button
  Then the system displays a confirmation message: "Story submitted successfully"
  And the newly created story is indexed in the database
  And the story entry is correctly linked to the "Clean Energy Research" category tag
  And the story is not yet visible on the public portal
```

***

### Scenario 3: Discoverability - Filtering and Searching by Initiative

**Goal:** Ensure users can efficiently find stories related to a specific research initiative using filtering tools.

```gherkin
Scenario Outline: Filtering Stories by Research Initiative Category
  Given the portal contains 20 stories
    And 7 stories are tagged with the "<Target Category>"
    And 5 stories are tagged with a different category "Defense Technology"
  When a user applies a filter for the "<Target Category>"
  Then the resulting list displays exactly 7 stories
  And every displayed story is correctly tagged with the "<Target Category>"
  And no stories tagged with "Defense Technology" are displayed

Examples:
  | Target Category        |
  | Quantum Computing      |
  | Water Resource Management |
  | Space Exploration      |