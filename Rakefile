
require File.expand_path('../config/application', __FILE__)

task :utest do
  p "Go Unit Test"
  unit_test_folders = ["spec/runners", "spec/biz"]
  exec "rspec " + unit_test_folders.join(" ")
end

task :itest do
  p "Go integration Test"
  integration_test_folders = ["spec/models", "spec/controllers", "spec/repositories"]
  exec "RAILS_ENV=test rspec " + integration_test_folders.join(" ")
end

task:test do
  p "Go Tests"
  exec "rake utest && rake itest"
end

Rails.application.load_tasks
