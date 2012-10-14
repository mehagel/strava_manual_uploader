require 'selenium-webdriver'

#driver.save_screenshot('manual-upload.png')

class StravaWrapper

    def connect
        @driver = Selenium::WebDriver.for :chrome
        
        puts 'Navigating to login page'
        @driver.navigate.to 'https://www.strava.com/login'
        puts 'Navigated to login page'
    end

    def login(email, password)
        # email address
        puts 'Finding email element'
        element = @driver.find_element(:id, 'email')
        puts 'Setting email'
        element.clear
        element.send_keys email

        # password
        puts 'Finding password element'
        element = @driver.find_element(:id, 'password')
        puts 'Setting password'
        element.clear
        element.send_keys password

        # click submit button
        element = @driver.find_element(:xpath, '//button')
        puts 'Logging in'
        element.click
        puts 'Logged in'
    end

    def close
        puts 'Closing'
        @driver.close
        puts 'Closed'
    end

    def upload_run(run)
        puts 'Uploading run:'

        # navigate to manual activity upload page
        puts '  Navigating to manual upload page'
        @driver.navigate.to 'http://app.strava.com/activities/new'
        puts '  Navigated to manual upload page'

        # switch to run
        element = @driver.find_element(:id, 'activity_type')
        options = element.find_elements(:tag_name, 'option')
        options.each do |option|
            if option.attribute("value") == "Run"
                option.click
            end
        end

        upload_activity(run, 'Run')
    end

    def upload_ride(ride)
        puts 'Uploading ride:'

        # navigate to manual activity upload page
        puts '  Navigating to manual upload page'
        @driver.navigate.to 'http://app.strava.com/activities/new'
        puts '  Navigated to manual upload page'

        # switch to run
        element = @driver.find_element(:id, 'activity_type')
        options = element.find_elements(:tag_name, 'option')
        options.each do |option|
            if option.attribute("value") == "Ride"
                option.click
            end
        end

        upload_activity(ride, 'Ride')
    end

private

    def upload_activity(activity, type)

        puts "    Setting activity distance:   #{activity.distance}"
        element = @driver.find_element(:id, 'activity_distance')
        element.clear
        element.send_keys activity.distance

        puts "    Setting activity duration:   #{activity.duration}"
        element = @driver.find_element(:id, 'activity_elapsed_time')
        element.clear
        element.send_keys activity.duration

        puts "    Setting activity start time: 09:00:00"
        element = @driver.find_element(:id, 'activity_start_time_of_day')
        element.clear
        element.send_keys '09:00:00'
        
        puts "    Setting activity start date: #{activity.date}"
        element = @driver.find_element(:id, 'activity_start_date')
        element.clear
        element.send_keys activity.date

        puts "    Setting activity location:   Jersey"
        element = @driver.find_element(:id, 'activity_input_location')
        element.click
        element.clear
        element.send_keys 'Jersey'

        puts "    Setting activity name:       #{activity.name}"
        element = @driver.find_element(:id, 'activity_name')
        element.click
        element.clear
        element.send_keys activity.name

        # click submit button
        element = @driver.find_element(:xpath, '//button')
        puts '    Creating activity'
        element.click
        puts '    Created activity'

        puts
    end
end
