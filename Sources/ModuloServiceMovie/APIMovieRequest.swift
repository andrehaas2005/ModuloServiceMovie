import Foundation

public struct APIMovieRequest {
    let path: RouterMovie
    let method: HTTPMovieMethod
    let body: Data?
    
    public init(path: RouterMovie, method: HTTPMovieMethod, body: Data? = nil) {
        self.path = path
        self.method = method
        self.body = body
    }
}
