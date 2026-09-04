public import RFC_9112

extension RFC_9112.Message.Coder {

    public enum Terminal: Equatable, Hashable {

        case clean

        case truncated(unconsumed: Int)
    }
}
