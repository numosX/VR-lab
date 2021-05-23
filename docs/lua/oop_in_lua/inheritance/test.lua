local ChildClass = require "child_class"

local tester = ChildClass:new()
tester:set_name("hogehoge")	-- parent_class の関数
tester:set_val(1)			-- child_class の関数
print(tester:get_name())	-- parent_class のメンバ変数へアクセス
print(tester:get_val())		-- child_class のメンバ変数へアクセス