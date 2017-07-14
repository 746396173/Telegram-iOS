import Foundation
#if os(macOS)
    import PostboxMac
#else
    import Postbox
#endif

public class AuthorSignatureMessageAttribute: MessageAttribute {
    public let signature: String
    
    public let associatedPeerIds: [PeerId] = []
    
    init(signature: String) {
        self.signature = signature
    }
    
    required public init(decoder: Decoder) {
        self.signature = decoder.decodeStringForKey("s", orElse: "")
    }
    
    public func encode(_ encoder: Encoder) {
        encoder.encodeString(self.signature, forKey: "s")
    }
}
