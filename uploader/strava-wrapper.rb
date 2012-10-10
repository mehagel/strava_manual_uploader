#!/usr/bin/env ruby

require 'selenium-webdriver'

#driver.save_screenshot('manual-upload.png')

class StravaWrapper

    def connect
        @driver = Selenium::WebDriver.for :chrome
        
        puts 'navigating to login page'
        @driver.navigate.to 'https://www.strava.com/login'
        puts 'navigated to login page'
    end

    def login(email, password)
        # email address
        puts 'finding email element'
        element = @driver.find_element(:id, 'email')
        puts 'setting email'
        element.clear
        element.send_keys email

        # password
        puts 'finding password element'
        element = @driver.find_element(:id, 'password')
        puts 'setting password'
        element.clear
        element.send_keys password

        # click submit button
        element = @driver.find_element(:xpath, '//button')
        element.click
    end

    def close
        puts 'closing'
        driver.close
        puts 'closed'
    end

    def upload_run(run)
        puts 'uploading run: '
        
        # navigate to manual activity upload page
        puts '  navigating to manual upload page'
        driver.navigate.to 'http://app.strava.com/activities/new'
        puts '  navigated to manual upload page'
    end

    def upload_ride(ride)
        puts 'uploading ride: '

        # navigate to manual activity upload page
        puts '  navigating to manual upload page'
        driver.navigate.to 'http://app.strava.com/activities/new'
        puts '  navigated to manual upload page'
    end

end
