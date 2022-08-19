require_relative '../../models/person'
require_relative '../../models/history'

Given('History exists') do
  @history = History.new
end

When('A correct answer is added') do
  @history.add_result(PEOPLE_ARRAY[0][0], true)
end
When('A incorrect answer is added') do
  @history.add_result(PEOPLE_ARRAY[0][0], false)
end

Then('History has a correct answer') do
  throw Exception.new('Answer should be correct') if @history.full_history.first[1] == false
  @history.clear
end

Then('History is cleaned') do
  throw Exception.new('History should be empty') unless @history.full_history.empty?
end
