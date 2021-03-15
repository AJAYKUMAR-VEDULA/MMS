//
//  JsonHelper.swift
//  MMS
//
//  Created by AJ on 13/03/21.
//

import Foundation

class JsonHelper {
    
    func getDataFromJson<T: Codable>(jsonResourceName: String, data: T.Type) -> T? {
        guard let fileURL = Bundle.main.url(forResource: jsonResourceName, withExtension: "json"), let json = jsonDecode(url: fileURL, data: data) else { return nil }
        return json
    }
    
    func jsonDecode<T: Codable>(url: URL, data: T.Type) -> T? {
        do {
            let decoder = JSONDecoder()
            let dataContent = try Data(contentsOf: url)
            let decodedData = try decoder.decode(data.self, from: dataContent)
            return decodedData
        }
        catch {
            print(error)
            return nil
        }
    }
}
