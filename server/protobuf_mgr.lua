local pb = require "pb"

local protobuf_mgr = {}

function protobuf_mgr:load()
    local proto_pb = io.open("proto/all.pb"):read("a")
    pb.load(proto_pb)
end

function protobuf_mgr:pack_message(cmd, args)
    return pb.encode("msg", {id = 1, cmd = cmd, args = args})
end

function protobuf_mgr:unpack_messgage(args)
    return pb.decode("msg", args)
end

return protobuf_mgr