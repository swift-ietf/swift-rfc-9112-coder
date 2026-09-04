import Byte
import Coder
import Cursor_Standard_Library_Integration
import RFC_9110
import RFC_9112
import RFC_9112_Coder
import Testing

@Suite
struct `HTTP.Request.Line.Coder Tests` {

    @Test
    func `a request line reads as its method target and version`() throws {
        var input = bytes("GET /greeting?name=Ada HTTP/1.1")[...]

        let line = try RFC_9112.Request.Line.coder.parse(&input)

        #expect(line.method == .get)
        #expect(line.version == RFC_9112.Version.value)
    }

    @Test
    func `a request line round trips`() throws {
        var input = bytes("POST /orders HTTP/1.1")[...]
        let line = try RFC_9112.Request.Line.coder.parse(&input)

        var buffer: [Byte] = []
        try line.encode(into: &buffer)

        #expect(text(buffer) == "POST /orders HTTP/1.1")
    }

    @Test
    func `an asterisk target round trips`() throws {
        var input = bytes("OPTIONS * HTTP/1.1")[...]
        let line = try RFC_9112.Request.Line.coder.parse(&input)

        #expect(line.target == .asterisk)

        var buffer: [Byte] = []
        try line.encode(into: &buffer)
        #expect(text(buffer) == "OPTIONS * HTTP/1.1")
    }

    @Test
    func `a line without a version is rejected`() {
        var input = bytes("GET /")[...]

        #expect(throws: (any Swift.Error).self) {
            try RFC_9112.Request.Line.coder.parse(&input)
        }
    }
}
