//
//  OpenAIapi.swift
//  swiftiesBoard
//
//  Created by Pavneet Cheema on 5/1/24.
//

import Foundation
import OpenAISwift


final class APICaller {
    static let shared = APICaller()
    @frozen enum Constants {
        static let key = ""
    }
    private var client: OpenAISwift?
    private init(){}
    
    public func setup(){
        self.client = OpenAISwift(config: OpenAISwift.Config.makeDefaultOpenAI(apiKey: Constants.key))
    }
    public func getResponse (input: String,
                             completion: @escaping (Result<String, Error>) -> Void){
        client?.sendCompletion(with: input, completionHandler: { result in
            switch result
            {
            case .success(let model):
                print(String(describing: model.choices))
                let output = model.choices?.first?.text ?? ""
            case .failure(let error):
                completion(.failure(error))
                
            }
        })
    }
}

