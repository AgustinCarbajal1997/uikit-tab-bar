import UIKit

class NetworkManager { // SIngleton
    static let shared   = NetworkManager() // static significa que cada manager lo va a tener disponible
    private let baseURL         = "https://api.github.com/users/"
    let cache           = NSCache<NSString, UIImage>()
    
    private init(){}
    
    func getFollowers(for username: String, page: Int, completed: @escaping(Result<[Follower], GFError>) -> Void) {
        let endpoint    = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(.failure(.invalidUsername))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let _ = error {
                completed(.failure(.unableToTcomplete))
                return
            }
            
            // si la respuesta no es nil y el status es igual a 200
            guard let response =  response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase  //le estamos diciendo que convierta desde snake case
                let followers = try decoder.decode([Follower].self, from: data)
                completed(.success(followers))
            } catch  {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
