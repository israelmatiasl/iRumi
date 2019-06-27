//
//  RumiApi.swift
//  iRumi
//
//  Created by Miguel Angel cordova on 6/27/19.
//  Copyright © 2019 Israel Matias. All rights reserved.
//

import Foundation
import Alamofire
import os

// typealias UsersResponse = [Source]

class RumiApi {
    static let baseUrlString = "https://rumiapi.azurewebsites.net/api"
    static let roomsUrlString = "\(baseUrlString)/rooms"
    static let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI1Y2FlYjRlMzVjNWQyNzg2MDg5YzgzZjciLCJqdGkiOiI5YWI2NDVmYi0xNDAzLTQ5NTctYmQyZS1hOGNmYjZjMWU4Y2IiLCJuYW1laWQiOiJMNUcwVzQ0QiIsInJvbGUiOiJPV05FUiIsIkxvZ2dlZE9uIjoiNi8yNi8yMDE5IDU6MTA6NTMgUE0iLCJuYmYiOjE1NjE1NjkwNTMsImV4cCI6MTU2MjE3Mzg1MywiaWF0IjoxNTYxNTY5MDUzLCJpc3MiOiJodHRwczovL3d3dy5nb29nbGUuY29tIiwiYXVkIjoiaHR0cHM6Ly93d3cuZ29vZ2xlLmNvbSJ9.YajaM3-pFbpf_SOIya6iAK6rlOvbKGR0KXcOm4suOrA"
    static private func request<T: Decodable>(
        from urlString: String,
        method: HTTPMethod,
        parameters: Parameters?,
        responseType: T.Type,
        responseHandler: @escaping ((T) -> Void),
        errorHandler: @escaping ((Error) -> Void)) {
        guard let url = URL(string: urlString) else {
            let message = "Error on URL"
            os_log("%@", message)
            return
        }
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
        
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: headers).validate().responseJSON(
            completionHandler: { response in
                switch response.result {
                case .success( _):
                    do {
                        let decoder = JSONDecoder()
                        if let data = response.data{
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
    
    static func getRooms(responseHandler: @escaping ((RoomsResponse) -> Void),
                         errorHandler: @escaping ((Error) -> Void)) {
        self.request(from: roomsUrlString,method: .get, parameters: nil,
                     responseType: RoomsResponse.self,
                     responseHandler: responseHandler, errorHandler: errorHandler)
    }
    
    static func saveRooms(RoomRequest: RoomRequest,responseHandler: @escaping ((Room) -> Void),
                          errorHandler: @escaping ((Error) -> Void)) {
        let parameters: Parameters = [
            "AccountId": RoomRequest.AccountId,
            "Title": RoomRequest.Title,
            "Description": RoomRequest.Description,
            "IsFurnished": RoomRequest.IsFurnished,
            "Price": RoomRequest.Price
        ]
        self.request(from: roomsUrlString,method: .post, parameters: parameters,
                     responseType: Room.self,
                     responseHandler: responseHandler, errorHandler: errorHandler)
    }
    static func deleteRooms(RoomId: String,responseHandler: @escaping ((Bool) -> Void),
                            errorHandler: @escaping ((Error) -> Void)) {
        let url: String = "\(roomsUrlString)/\(RoomId)"
        self.request(from: url,method: .delete, parameters: nil,
                     responseType: Bool.self,
                     responseHandler: responseHandler, errorHandler: errorHandler)
    }
    static func test(){
        return print("Hola Mundo")
    }
  
}
