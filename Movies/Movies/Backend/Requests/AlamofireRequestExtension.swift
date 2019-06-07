

import Alamofire
import Dotzu

public extension Request {
    
    public func DebugLog() -> Self {
        #if DEBUG
        Logger.info(" ===========  Request =========== ")
        Logger.info("Header", self.request?.allHTTPHeaderFields ?? "Empty Headers")
        
        if let httpBody =  self.request?.httpBody {
            Logger.info("httpBody" ,NSString(data: httpBody, encoding: String.Encoding.utf8.rawValue)!)
        }
        
        Logger.info(self)
        #endif
        return self
    }
}
