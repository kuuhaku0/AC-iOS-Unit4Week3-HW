//
//  DateFormat.swift
//  Unit4Week3Homework-StudentVersion
//
//  Created by C4Q on 1/6/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import Foundation

struct DateFormatHelper {
    private init(){}
    static let formatter = DateFormatHelper()
    public func formateDate(from date: String,
                            inputDateFormat inputFormat: String,
                            outputDateFormat outputFormat: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        let date = dateFormatter.date(from: date)
        dateFormatter.dateFormat = outputFormat
        return dateFormatter.string(from: date!)
    }
}
/*
 ______________Date Format_______________inputFormat / outputFormat__
 ||-----------------------------------------------------------------||
 || Thursday, Oct 12, 2017             | "EEEE, MMM d, yyyy"        ||
 || 10/12/2017                         | "MM/dd/yyyy"               ||
 || 10-12-2017 09:48                   | "MM-dd-yyyy HH:mm"         ||
 || Oct 12, 9:48 AM                    | "MMM d, h:mm a"            ||
 || October 2017                       | "MMMM yyyy"                ||
 || Oct 12, 2017                       | "MMM d, yyyy"              ||
 || Thu, 12 Oct 2017 09:48:59 +0000    | "E, d MMM yyyy HH:mm:ss Z" ||
 || 2017-10-12T09:48:59+0000           | "yyyy-MM-dd'T'HH:mm:ssZ"   ||
 || 12.10.17                           | "dd.MM.yy"                 ||
 --------------------------------------------------------------------
 */

