//
//  ServerUtil_Alamofire.swift
//  ApiNetwork
//
//  Created by mc Lee on 2022/4/23.
//

import Foundation
import Common
import Alamofire

class ServerUtil_Alamofire {

    static let c_protocol = "http"
    
    static let pCookies = HTTPCookieStorage.shared
    private static var pServerHostConverted = false
    private static var pRequestRetryCount = 0
    
    static var mgr: Alamofire.Session = resetAlamofireSessionManager()
    
    static func resetAlamofireSessionManager() -> Alamofire.Session {
        let cfg = NetworkUtil.fInitDefaultURLSession()

        let m = Alamofire.Session(configuration: cfg)
        return m
    }
    
    static func fRequest<T>(_ params: ServerParam, handler: IServerRequestHandler<T>?) where T : IServerModel {
        let url = "\(c_protocol)://\(Config.fGetServerHost())/\(params.controller!)/\(params.action!)"
        let method = params.method == .get ? HTTPMethod.get : HTTPMethod.post
        
        let request: DataRequest
        if method == .get {
            request = mgr.request(url, method: method, parameters: params.parameters, encoding: URLEncoding.default)
        } else {
            var urlRequest = try! URLRequest(url: url, method: method, headers: HTTPHeaders(
                dictionaryLiteral: ("Content-Type", "application/json")))
            urlRequest.httpBody = params.aToJSONString().data(using: .utf8)
            request = mgr.request(urlRequest)
        }
        
        request.responseString(encoding: String.Encoding.utf8) { (r: AFDataResponse<String>) in
            
            switch r.result {
            case .failure(let error):
                if let h = handler {
                    var failResponse: CommonResponse<T>?
                    
                    if let failResultValue = r.value {
                        failResponse = CommonResponse<T>()
                        failResponse?.aLoadFromJSONString(str: failResultValue)
                    }
                    let failInfo = RequestFailInfo<T>(error, failResponse)
                    h.pFail?(failInfo)
                }
            case .success(let value):
                let responseString: String
                responseString = value
                
                let response = CommonResponse<T>()
                response.aLoadFromJSONString(str: responseString)
                
                if response.StatusCode == .eSuccess, let d = response.Data {
                    handler?.pSuccess?(d)
                } else {
                    let failInfo = RequestFailInfo<T>(r.error, response)
                    handler?.pFail?(failInfo)
                }
            }
            
        }
    }
    

}
