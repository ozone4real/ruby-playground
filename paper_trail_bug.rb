# frozen_string_literal: true

# Use this template to report PaperTrail bugs.
# Please include only the minimum code necessary to reproduce your issue.
require "bundler/inline"

# What versions are you using?
gemfile(true) do
  source "https://rubygems.org"
  ruby "2.7.5"
  gem "openssl" # requiring rails seem to blow up without this
  gem "rails", "6.1.5"
  gem "minitest", "5.11.3"
  gem "paper_trail", require: false
  gem "sqlite3"
end

# Could only reproduce the bug when there is a library that has a Railtie
# with an `after: :load_config_initializers` initializer
module Bug
  class Railtie < ::Rails::Railtie
    initializer "bug.paper_trail", after: :load_config_initializers do
    end
  end
end

require "active_record/railtie"
require "action_controller/railtie"
require "paper_trail"
require "minitest/autorun"
require "logger"

# Please use sqlite for your bug reports, if possible.
ENV["DATABASE_URL"] = "sqlite3:my_database" # rails expects a config/database.yml file if this isn't set
ActiveRecord::Base.establish_connection(url: ENV["DATABASE_URL"])
ActiveRecord::Base.logger = nil
ActiveRecord::Schema.define do
  next if table_exists?(:users) || table_exists?(:versions)

  create_table :users, force: true do |t|
    t.text :first_name, null: false
    t.timestamps null: false
  end

  create_table :versions do |t|
    t.string :item_type, null: false
    t.integer :item_id, null: false
    t.string :event, null: false
    t.string :whodunnit
    t.text :object, limit: 1_073_741_823
    t.text :object_changes, limit: 1_073_741_823
    t.datetime :created_at
  end
  add_index :versions, %i[item_type item_id]
end
ActiveRecord::Base.logger = Logger.new(STDOUT)


module Bug
  class Application < Rails::Application
    config.load_defaults 6.1

    # basically overriding https://github.com/rails/rails/blob/v6.1.5/railties/lib/rails/engine.rb#L632-L636
    # and definiing the initializer inline since we don't have config/initializers
    initializer :load_config_initializers do
      module ::PaperTrail
        class RecordTrail
          def enabled?
            "I am enabled"
          end
        end
      end
    end
  end
end

Rails.application.initialize!

# Define your AR models here.
class User < ActiveRecord::Base
  has_paper_trail
end


# Please write a test that demonstrates your issue.
class BugTest < ActiveSupport::TestCase
  def test_1
    pt = PaperTrail::RecordTrail.new User.new
    # This fails but would pass if `before: "load_config_initializers"` is changed to `before: :load_config_initializers` here:
    # https://github.com/paper-trail-gem/paper_trail/blob/master/lib/paper_trail/frameworks/rails/railtie.rb#L13
    assert_equal "I am enabled", pt.enabled? 
  end
end

# Run this script using `ruby my_bug_report.rb`