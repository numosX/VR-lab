local ToyClass = require "class_template"

local tester = ToyClass:new()
print(tester:get_name())

tester:set_name("hoge")
print(tester:get_name())

for i = 1, 5 do
    tester:count_up()
    print("-----")
    print(tester:get_counter())
end