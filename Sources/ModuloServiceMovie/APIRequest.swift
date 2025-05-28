import Foundation

public struct APIRequest {
    let path: String
    let method: HTTPMethod
    let body: Data?
    
    public init(path: String, method: HTTPMethod, body: Data? = nil) {
        self.path = path
        self.method = method
        self.body = body
    }
}
