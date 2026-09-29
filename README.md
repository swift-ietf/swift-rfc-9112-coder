# swift-rfc-9112-coder

Wire coders for [swift-rfc-9112](https://github.com/swift-ietf/swift-rfc-9112): `RFC_9112.Version.Coder`, `RFC_9112.Request.Line.Coder`, `RFC_9112.Request.Target.Coder`, `RFC_9112.Request.Head.Coder`, `RFC_9112.Response.Line.Coder`, `RFC_9112.Response.Head.Coder`, `RFC_9112.Field.Coder`, `RFC_9112.Host.Coder`, `RFC_9112.Transfer.Encoding.Coder`, `RFC_9112.Transfer.Coding.Chunked.Coder` and `RFC_9112.Connection.Coder` parse and serialize the HTTP/1.1 message syntax over any byte cursor, `Coder.Codable` gives the domain types `encoded()` and `init(decoding:)`, and the incremental `RFC_9112.Message.Coder` with its `Limits`, `Phase` and `Terminal` states together with the `RFC_9112.Connection.Client.Coder` and `RFC_9112.Connection.Server.Coder` framers live here so that the domain package stays a pure model.

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
