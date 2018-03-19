//
//  DataFetcher.swift
//  DashboardFeyzaTopgul
//
//  Created by fyz on 3/17/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import Foundation

class DataFetcher {
    let url: String
    init?(url:String) {
        self.url = url
        if let fetcherURL = URL (string: url) {
            let sharedSession: URLSession = URLSession.shared
            let dataTask: URLSessionDataTask = sharedSession.dataTask(with: fetcherURL, completionHandler: responseHandler)
            dataTask.resume()
        }
        else {
            reportFailure(message: "Couldn't create URL from string \(url) ")
            return nil
        }
    }
    func reportFailure(message:String){
        print(message)
    }
    func handleReceivedData(data:Data){
        print("\(String(data:data, encoding: .utf8) ?? "No Data")")
    }
    func responseHandler(data:Data?, response:URLResponse?, error:Error?){
        if let receivedError = error {
            reportFailure(message: receivedError.localizedDescription)
        }
        else if let receivedData = data {
            handleReceivedData(data: receivedData)
        }
    }
}
