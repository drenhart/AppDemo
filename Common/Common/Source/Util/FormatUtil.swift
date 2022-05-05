//
//  FormatUtil.swift
//  Common
//
//  Created by mc Lee on 2022/4/22.
//

import Foundation

public class FormatUtil {

    public static let pISODateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }()
    
    public static let pISODateFormatter2: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZ"
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter
    }()

}
