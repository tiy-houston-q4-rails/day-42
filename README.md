Day 42 - Acceptance Tests
========================

Assignment:

1. Finish Day-41
2. Add on acceptance feature, describing "Withdrawing 400"


To Feature-test / Acceptance Test / Integration test your app
----

( We are using minitest [as opposed to rspec / capybara or cucumber])

https://github.com/blowmage/minitest-rails-capybara

Add the following to your Gemfile and then bundle

```
gem "minitest-rails"

group :test do
  gem "minitest-rails-capybara"
end
```

2. Add the following to `test/test_helper.rb`

```
require "minitest/rails/capybara"
```

3. Add the following to Rakefile, at the end of the file

```
Rails::TestTask.new("test:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end
Rake::Task["test:run"].enhance ["test:features"]
```

4. Generate a feature like so:

```
rails g minitest:feature TakeTheOrder
```

5. Create a feature, walking the browser through your app, like so:

```
require "test_helper"
class TakeTheOrderTest < Capybara::Rails::TestCase
  test "fill out the form" do
    visit new_order_path
    select "Ciabatta", from: "Bread"
    select "Pastrami", from: "Meat"
    check "Pickles"
    click_button "Place Order"
    order = Order.first
    assert_equal "Ciabatta", order.bread
    assert_equal "Pastrami", order.meat
    assert_equal true, order.pickles?
    assert_equal false, order.made?
  end
end
```

6. run your tests:

```
rake
```

Or 1 specific file:

```
rake TEST=/Users/jwo/Projects/ironyard/day-42/sammich/test/features/take_the_order_test.rb
```

