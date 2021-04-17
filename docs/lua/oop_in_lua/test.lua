local ToyClass = require "class_template"

hoge = ToyClass:new()
print(hoge:getName())

hoge:setName("hoge")
print(hoge:getName())

for i = 1, 5 do
    hoge:countUp()
    print("-----")
    print(hoge:getCounter())
end