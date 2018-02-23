require_relative '../../src/pageObjects/abstractPage'
require_relative '../../src/pageObjects/gmailLoginPage'
require_relative '../../src/pageObjects/gmailHomePage'

class GmailLoginPage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def validateLoginText( text )
    pagetext = @@driver.h1(:id=>"headingText").text
    print "#{pagetext}\n"
    if !pagetext == text
      fail("Text does not match on page #{pagetext} != #{text}")
    end
    return GmailLoginPage.new(@@driver)
  end

  def fillInUserName (userId)
    @@driver.text_field(:id=> "identifierId").send_keys userId
    return GmailLoginPage.new(@@driver)
  end

  def clickOnNextButton
    @@driver.span(:text=> "Next").click
    sleep 2
    return GmailLoginPage.new(@@driver)
  end

  def fillInPassword (userPassword)
    @@driver.text_field(:name=> "password").send_keys userPassword
    return GmailLoginPage.new(@@driver)
  end

  def clickOnSecondNextButton
    @@driver.span(:text=> "Next").click
    sleep 5
    return GmailHomePage.new(@@driver)
  end

end