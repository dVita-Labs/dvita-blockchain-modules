using Neo.IO.Json;
using Neo.Network.P2P.Payloads;

namespace Neo.Network.RPC.Models
{
    public class RpcBlockHeader
    {
        public Header Header { get; set; }

        public uint Confirmations { get; set; }

        public UInt256 NextBlockHash { get; set; }

        public JObject ToJson(ProtocolSettings protocolSettings)
        {
            JObject json = Header.ToJson(protocolSettings);
            json["confirmations"] = Confirmations;
            json["nextblockhash"] = NextBlockHash?.ToString();
            return json;
        }

        public static RpcBlockHeader FromJson(JObject json, ProtocolSettings protocolSettings)
        {
            return new RpcBlockHeader
            {
                Header = Utility.HeaderFromJson(json, protocolSettings),
                Confirmations = (uint)json["confirmations"].AsNumber(),
                NextBlockHash = json["nextblockhash"] is null ? null : UInt256.Parse(json["nextblockhash"].AsString())
            };
        }
    }
}