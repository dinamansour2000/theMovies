

import Alamofire


public extension Request {
    
   public func debugLog() -> Self {
    #if DEBUG
    debugPrint(self)
    #endif
    return self
    }
}
