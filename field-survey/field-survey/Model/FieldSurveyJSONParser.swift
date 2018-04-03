//
//  FieldSurveyJSONParser.swift
//  field-survey
//
//  Created by Zachary Dobbs on 4/2/18.
//  Copyright © 2018 Zachary Dobbs. All rights reserved.
//

import Foundation

class FieldSurveyJSONParser {
    
    static let dateFormatter = DateFormatter()
    
    class func parse(_ data: Data) -> [Observation] {
        var fieldObservations = [Observation]()
        
        dateFormatter.dateFormat = "YYYY-MM-dd HH:mm"
        
        // if statements in swift use , as and
        // get the json data
        if let json = try? JSONSerialization.jsonObject(with: data, options: []),
            // get the root object of the json data
            let root = json as? [String: Any],
            // status should be set to ok
            let status = root["status"] as? String,
            status == "ok"
        {
            // get the observations array
            if let observations = root["observations"] as? [Any] {
                // iterate through the json array data
                for observation in observations {
                    // typecast the data as a dictionary of strings
                    if let observation = observation as? [String: String] {
                        // get all necessary values from each object
                        if let classificationName = observation["classification"],
                            let title = observation["title"],
                            let description = observation["description"],
                            let dateString = observation["date"],
                            let date = dateFormatter.date(from: dateString)
                        {
                            // try to create a struct from the parsed data
                            if let fieldObservation = Observation(classificationName: classificationName,
                                                                  title: title,
                                                                  description: description,
                                                                  date: date)
                            {
                                // add the created struct to the array
                                fieldObservations.append(fieldObservation)
                            }
                        }
                    }
                }
            }
        }
        // return the populated array of observations 
        return fieldObservations
    }
    
}
