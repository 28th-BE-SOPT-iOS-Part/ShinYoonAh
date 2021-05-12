//
//  LoginServices.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/05/13.
//

import Foundation
import Alamofire

struct LoginService{
    static let shared = LoginService()
    
    private func makeParameter(email : String, password : String) -> Parameters {
        return ["email" : email,
                "password" : password]
    }
    
    private func makeSignupParameter(email : String, password : String, sex: String, nickname : String, phone : String, birth : String) -> Parameters {
        return ["email" : email,
                "password" : password,
                "sex" : sex,
                "nickname" : nickname,
                "phone" : phone,
                "birth" : birth]
    }
    
    func login(email : String,
               password : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.loginURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            dump(dataResponse)
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.pathErr)
            }
        }
    }
    
    func signup(email : String,
               password : String,
               sex : String,
               nickname : String,
               phone : String,
               birth : String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signupURL,
                                     method: .post,
                                     parameters: makeSignupParameter(email: email, password: password, sex: sex, nickname: nickname, phone: phone, birth: birth),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { dataResponse in
            dump(dataResponse)
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeSignupStatus(by: statusCode, value)
                completion(networkResult)
            case .failure: completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(UserModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200:
            if let token = decodedData.data?.token {
                UserDefaults.standard.set(token, forKey: "user")
            }
            return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func judgeSignupStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(SignUpModel.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200: return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
