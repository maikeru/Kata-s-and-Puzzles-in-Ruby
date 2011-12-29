Given /^I am not yet playing$/ do
    # Nothing to do
end

When /^I start a new game$/ do
    Chess::Game.new.start
end

Then /^I should see a chess board$/ do
      pending # express the regexp above with the code you wish you had
end

Then /^I should see "([^"]*)"$/ do |arg1|
      pending # express the regexp above with the code you wish you had
end
