local skynet = require "skynet"
local sprotoloader = require "sprotoloader"
local socket = require "skynet.socket"

local agent

-- local max_client = 64

-- --简单echo服务
-- function echo(id, addr)
--     -- socket.start(id)
--     while true do
--         local str = socket.read(id)
--         if str then
--             skynet.error("客户端"..id, " 发送内容: ", str)
--             socket.write(id, str)
--         else
--             socket.close(id)
--             skynet.error("客户端"..id, " ["..addr.."]", "断开连接")
--             return
--         end
--     end
-- end

skynet.start(function()
	skynet.error("Server start")
	agent = skynet.newservice("agent")
	-- skynet.uniqueservice("protoloader")
	-- if not skynet.getenv "daemon" then
		-- local console = skynet.newservice("console")
	-- end
	-- skynet.newservice("debug_console",8000)
	-- skynet.newservice("simpledb")
	-- local watchdog = skynet.newservice("watchdog")
	-- local addr,port = skynet.call(watchdog, "lua", "start", {
		-- port = 8888,
		-- maxclient = max_client,
		-- nodelay = true,
	-- })
	-- skynet.error("Watchdog listen on " .. addr .. ":" .. port)
	-- skynet.exit()
	-- local client_fd = socket.listen("127.0.0.1", 8001)
	-- -- socket.start(client_fd, function(id, addr)
	-- -- 	skynet.error("id = " .. id .. " " .. "addr = " .. addr)
	-- -- 	socket.write(id, "login succ\n")
    -- --     socket.start(id)
	-- -- 	skynet.fork(function()
	-- -- 		pcall(function() 
	-- -- 			while true do
	-- -- 				local str = socket.readline(id)
	-- -- 				skynet.error(str)
	-- -- 			end
	-- -- 		end)
	-- -- 	end)
	-- -- end)
	-- socket.start(client_fd, function(id, addr)
	-- 	skynet.error("客户端"..id, " ["..addr.."]", "已连接")
	-- 	socket.start(id)
	-- 	socket.write(id, "login succ\n")
	-- 	skynet.fork(echo, id, addr)
	-- end)
end)


-- local skynet = require "skynet"
-- local pb = require "protobuf"
 
-- --protobuf编码解码
-- function test4()
--     pb.register_file("proto/login.pb")
--     --编码
--     local msg = {
--         id = 101,
--         pw = "123456",
--     }
--     local buff = pb.encode("login.Login", msg)
--     print("len:"..string.len(buff))
-- 	print(buff)
--     --解码
--     local umsg = pb.decode("login.Login", buff)
--     if umsg then
--         print("id:"..umsg.id)
--         print("pw:"..umsg.pw)
--     else
--         print("error")
--     end
-- end

-- local skynet = require "skynet"
-- local pb = require "pb"
-- local protoc = require "protoc"
 
-- --protobuf编码解码
-- function test4()
-- 	local protoc = protoc.new()
-- 	protoc:addpath("proto/")
-- 	pb.clear()
-- 	protoc:reload()
-- 	-- 方法一（加载编译后的pb文件）
-- 	-- local proto_pb = io.open("proto/login.pb"):read("a")
-- 	-- pb.load(proto_pb)
-- 	-- 方法二（加载proto源文件）
-- 	protoc:loadfile("common.proto")
--     --编码
--     local msg = {
--         id = 101,
--         arg = "1234567",
--     }
--     local buff = pb.encode("msg", msg)
--     print("len:"..string.len(buff))
-- 	print(buff)
--     --解码
--     local umsg = pb.decode("msg", buff)
--     if umsg then
--         print("id:"..umsg.id)
--         print("arg:"..umsg.arg)
--     else
--         print("error")
--     end
-- end
 
-- skynet.start(function()
--     skynet.error("start ......")
--     test4()
-- end)