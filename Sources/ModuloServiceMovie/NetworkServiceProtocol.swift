
@available(iOS 13.0.0, *)
public protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ request: APIMovieRequest) async throws -> T
}
