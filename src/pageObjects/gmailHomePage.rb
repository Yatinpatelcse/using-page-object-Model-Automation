require_relative '../../src/pageObjects/abstractPage'
require_relative '../../src/pageObjects/gmailHomePage'

class GmailHomePage < AbstractPage

  def initialize(driver)
    super(driver)
  end

  def clickOnComposeButton
    @@driver.div(:text=> "COMPOSE").present?
    @@driver.div(:text=> "COMPOSE").click
    sleep 5
    return GmailHomePage.new(@@driver)
  end

  def checkNewMessageText(text)
    newtext= @@driver.element(:xpath=>"//h2/div[2]").text
    print "#{newtext}\n"
     if !newtext == text
       fail("Text does not match on page #{newtext} != #{text}")
     end
     return GmailHomePage.new(@@driver)
  end

end