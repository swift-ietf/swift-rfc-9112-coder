import Byte
import Coder
import Cursor_Standard_Library_Integration
import RFC_9112
import RFC_9112_Coder
import Testing

@Suite
struct `HTTP.Connection.Coder Tests` {

    @Test
    func `a connection field reads as its options`() throws {
        var input = bytes("close")[...]

        #expect(try RFC_9112.Connection.coder.parse(&input) == .close)
    }

    @Test
    func `a connection field round trips`() throws {
        var input = bytes("keep-alive, upgrade")[...]
        let connection = try RFC_9112.Connection.coder.parse(&input)

        var buffer: [Byte] = []
        try connection.encode(into: &buffer)

        #expect(text(buffer) == "keep-alive, upgrade")
    }
}
