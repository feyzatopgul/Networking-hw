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
    var appTitles: [String]?
    private var currentTitlePosition = 0
    var currentTitle: String {
        if let titles = appTitles, titles.count > 0 {
            return titles [currentTitlePosition]
        }
        else {
            return "No Data"
        }
    }
    var nextTitle: String {
        if let titles = appTitles, titles.count > 0 {
            currentTitlePosition += 1
            if currentTitlePosition > titles.count - 1 {
                currentTitlePosition = 0
            }
            return titles [currentTitlePosition]
        }
        else {
            return "No Data"
        }
    }
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
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(AppListingWrapper.self, from: data)
            var titles = [String] ()
            for appData in decodedData.feed.entry {
                titles.append(appData.title.label)
            }
            appTitles = titles
            print ("\(titles)")
        }
        catch {
            reportFailure(message: "Decoding error: \(error.localizedDescription)")
        }
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
