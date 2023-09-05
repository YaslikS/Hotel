import Foundation

extension Bundle {
    
    func fetchData<T: Decodable>(
        _ url: String,
        model: T.Type,
        completion:@escaping(T) -> (),
        failure:@escaping(Error) -> ()
    ) {
            guard let url = URL(string: url) else { return }
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    // Если есть ошибка, сообщение о ней.
                    if let error = error { failure(error) }
                    return
                }
                do {
                    let serverData = try JSONDecoder().decode(T.self, from: data)
                    // Успешноо получение данных с сервера
                    completion((serverData))
                } catch {
                    // Если есть ошибка, сообщение о ней.
                    failure(error)
                }
            }.resume()
    }
    
}
