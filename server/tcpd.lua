local skynet = require "skynet"
local socket = require "skynet.socket"
local protobuf_mgr = require "protobuf_mgr"
local pb = require "pb"

local CMD = {}

function CMD.accept(id, addr)
    socket.start(id)
    while true do
        local str = socket.readline(id)
        if not str then
            break
        end
        local args_bin = pb.encode("test",{str=str})
        local send_msg = protobuf_mgr:pack_message("test",args_bin)
        local recv_msg = protobuf_mgr:unpack_messgage(send_msg)
        args_bin = pb.decode("test",recv_msg.args)
        skynet.error(str, send_msg)
        skynet.error(recv_msg.id, recv_msg.cmd, args_bin.str)
        if str == "response" then
            socket.write(id, "response")
        end
    end
end

skynet.start(function ()
    protobuf_mgr:load()
    skynet.dispatch("lua",function(session,source,cmd,...)
        local func = CMD[cmd]
        if func then
            func(...)
        end
    end)
end)