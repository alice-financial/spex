 if ENV['GENERATE_REPORTS'] == 'true'
    puts "GENERATE_REPORTS"
    require 'ci/reporter/rake/rspec'
    task :spec => 'ci:setup:rspec'
 end