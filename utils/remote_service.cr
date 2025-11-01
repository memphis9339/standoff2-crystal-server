require "../protos/structs.pb"
require "../utils/from_byte_method"
require "../utils/to_byte_method"

abstract class RemoteService
    abstract def invoke(request : CrystalProject::RpcRequest, client : UserClient)
end
