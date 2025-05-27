import XCTest
@testable import ModuloServiceMovie

@available(iOS 15.0, *)
final class NetworkServiceTests: XCTestCase {
    var networkService: NetworkServiceProtocol!

    override func setUp() {
        super.setUp()
        networkService = NetworkService.shared
    }

    func testRequestSuccess() async {
                  
        let request = APIRequest(path: "top_rated", method: .get)

        do {
            let movies: Cover =  try await networkService.request(request)
            XCTAssertNotNil(movies)
        } catch {
            XCTFail()
        }
    }
}
