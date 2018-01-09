Capybara.default_max_wait_time = ENV['CAPYBARA_WAIT_TIME'].to_i.nonzero? || 2

if ENV['BROWSER'].blank?
  Capybara.javascript_driver = :webkit

elsif ENV['BROWSER'] == 'chrome'
  Capybara.register_driver :chrome do |app|
    Capybara::Selenium::Driver.new(app, :browser => :chrome, desired_capabilities: { "chromeOptions" => { "args" => %w{ window-size=1024,768 } } })
  end
  Capybara.javascript_driver = :chrome
end
