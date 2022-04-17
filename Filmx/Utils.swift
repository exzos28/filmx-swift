//
//  Utils.swift
//  Filmx
//
//  Created by Oleksandr Kurinnyi on 09/04/2022.
//

import Foundation

class Utils {
    static let jsonDecoder = getJsonDecoder()
    
    
    static let dateFormatter = getDateFormatter()
    
    static private func getJsonDecoder() -> JSONDecoder {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(Utils.getDateFormatter())
        return jsonDecoder
    }
    
    static private func getDateFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }
}
