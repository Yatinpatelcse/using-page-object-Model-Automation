require 'rspec'
require 'watir-webdriver'
require 'pry'
require_relative '../../src/pageObjects/gmailLoginPage'

describe 'login to Gmail' do

  gmailApp = nil

  before(:all) do
    chromedriver_path = File.join('C:\Users\yatin\AppData\Local\Google\Chrome\Application',"chromedriver.exe")
    Selenium::WebDriver::Chrome.driver_path = chromedriver_path
    gmailApp = AbstractPage.new(Watir::Browser.new :chrome)
  end

  it 'should see inbox' do

    gmailApp
        .navigatetoGmailLoginPage
        .validateLoginText('Sign in')
        .fillInUserName('tt0730702@gmail.com')
        .clickOnNextButton
        .fillInPassword('*******')
        .clickOnSecondNextButton
        .clickOnComposeButton
        .checkNewMessageText('New Message')

  end

  after(:all) do
    gmailApp.quit
  end

end