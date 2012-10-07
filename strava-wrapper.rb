#!/usr/bin/env ruby

require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome

# login
puts 'navigating to login page'
driver.navigate.to 'https://www.strava.com/login'
puts 'navigated to login page'

# email address
puts 'finding email element'
element = driver.find_element(:id, 'email')
puts 'setting email'
element.clear
element.send_keys 'email-address-goes-here'

# password
puts 'finding password element'
element = driver.find_element(:id, 'password')
puts 'setting password'
element.clear
element.send_keys 'password-goes-here'

# click submit button
element = driver.find_element(:xpath, '//button')
element.click

# navigate to manual activity upload page
puts 'navigating to manual upload page'
driver.navigate.to 'http://app.strava.com/activities/new'
puts 'navigated to manual upload page'

puts 'saving screenshot'
driver.save_screenshot('manual-upload.png')

puts 'closing'
driver.close
puts 'closed'


