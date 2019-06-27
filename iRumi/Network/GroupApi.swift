
import Alamofire
import os

class GroupApi {
    static let baseUrlString = "https://rumiapi.azurewebsites.net/api"
    static let groupsUrlString = "\(baseUrlString)/groups"
    
    static private func GetGroups<T: Decodable>(
        urlString: String,
        token:String,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        
        let httpHeaders: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        Alamofire.request(url, method: .get, headers: httpHeaders).validate().responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success( _):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
        })
    }
    
    static private func SaveGroup<T: Decodable>(
        urlString: String,
        token:String,
        parameters: Parameters,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        
        let httpHeaders: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: httpHeaders).validate().responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success( _):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data {
                            let dataResponse = try decoder.decode(responseType, from: data)
                            responseHandler(dataResponse)
                        }
                    } catch {
                        errorHandler(error)
                    }
                    
                case .failure(let error):
                    errorHandler(error)
                }
        })
    }
    
    static func GetGroups(token:String, responseHandler: @escaping (([Group]) -> Void),
                          errorHandler: @escaping ((Error) -> Void)) {
        
        self.GetGroups(urlString: groupsUrlString, token:token, responseType: [Group].self,
                       responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func GetGroup(groupId:String, token:String, responseHandler: @escaping (([Group]) -> Void),
                         errorHandler: @escaping ((Error) -> Void)) {
        let url = "\(groupsUrlString)/\(groupId)"
        self.GetGroups(urlString: url, token: token, responseType: [Group].self,
                       responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func SaveGroup(token:String, groupRequest:GroupRequest, responseHandler: @escaping ((Group) -> Void),
                          errorHandler: @escaping ((Error) -> Void)) {
        
        let parameters: Parameters = [
            "name": groupRequest.Name,
            "participants": groupRequest.Participants
        ]
        
        self.SaveGroup(urlString: groupsUrlString, token: token, parameters: parameters, responseType: Group.self,
                       responseHandler: responseHandler, errorHandler: errorHandler)
    }
}
