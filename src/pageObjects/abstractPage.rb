require 'watir-webdriver'
require_relative '../../src/pageObjects/gmailLoginPage'

class AbstractPage

  @@driver = nil

  def initialize(driver)
    @@driver = driver
  end

  def navigatetoGmailLoginPage
    @@driver.goto ("https://www.gmail.com")
    sleep 5
    return GmailLoginPage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def getpageTitle
    return @@driver.title
  end
end