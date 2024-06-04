local skynet = require "skynet"
local socket = require "skynet.socket"

local port = 8001
local client_fds = {}
local tcpd

-- skynet.init(function()
--     tcpd = skynet.newservice("tcp")
-- end)

skynet.start(function ()
    tcpd = skynet.newservice("tcpd")
    local client_fd = socket.listen("127.0.0.1", port)
    socket.start(client_fd, function(id, addr)
        skynet.error("客户端"..id, " ["..addr.."]", "已连接")
        skynet.send(tcpd,"lua","accept",id,addr)
    end)
end)