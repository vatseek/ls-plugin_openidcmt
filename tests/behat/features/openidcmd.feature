Feature: Openidcmt plugin standart features BDD
  Test base functionality of LiveStreet Openidcmt plugin standart

  @mink:selenium2
  Scenario: Create message
    Then check is plugin active "openidcmt"

    Given I am on "/blog/3.html"

    Then I follow "Add comment"
    And I fill in "comment_text" with "test comment"
    And I press "Preview"

    Then I wait "1000"

    Then I should see in element by css "content .comment-preview.text" values:
    | value |
    | test comment |

    And I press "Add"

    Then I wait "1000"
    And the response should contain "Comment is added"

    Then I fill in "login" with "user-golfer"
    And I fill in "password" with "qwerty"
    And I press "Login"
    And I wait "1000"

    Then the response should contain "Your comment has been sended!"
    And I should see in element by css "comments" values:
      | value |
      | test comment |

  @mink:selenium2
  Scenario: Create invalid message
    Then check is plugin active "openidcmt"

    Given I am on "/blog/3.html"

    Then I follow "Add comment"
    And I fill in "comment_text" with "x"
    And I press "Add"

    Then I wait "1000"
    And the response should contain "Comments should consist of 2 upto 3000 chars of decent content"