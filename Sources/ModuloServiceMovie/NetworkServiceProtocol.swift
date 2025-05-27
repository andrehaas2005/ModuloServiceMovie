protocol NetworkServiceProtocol {
    func request<T: Decodable>(_ request: APIRequest) async throws -> T
}
