//
//  TopAppsData.swift
//  DashboardFeyzaTopgul
//
//  Created by fyz on 3/19/18.
//  Copyright © 2018 Feyza Topgul. All rights reserved.
//

import Foundation
class AppListingWrapper: Codable {
    let feed: AppListingContainer
    class AppListingContainer: Codable {
        let entry: [AppListingData]
        class AppListingData: Codable {
            let title: AppTitle
            class AppTitle: Codable {
                let label: String
            }
        }
    }
}
