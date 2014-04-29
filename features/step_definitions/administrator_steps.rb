Given /^the following administrators:$/ do |administrators|
  Administrator.create!(administrators.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) administrator$/ do |pos|
  visit administrators_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Delete"
  end
end

Then /^I should see the following administrators:$/ do |expected_administrators_table|
  expected_administrators_table.diff!(tableish('table tr', 'td,th'))
end
