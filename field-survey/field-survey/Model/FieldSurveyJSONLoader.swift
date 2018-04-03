//
//  FieldSurveyJSONLoader.swift
//  field-survey
//
//  Created by Zachary Dobbs on 4/2/18.
//  Copyright © 2018 Zachary Dobbs. All rights reserved.
//

import Foundation

// JSON loader will call take a path and call the parser to create the array of structs
class FieldSurveyJSONLoader {
    class func load(fileName: String) -> [Observation] {
        var fieldObservations = [Observation]()
        
        // convert the fileName to a path
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        {
            // the JSONParser does not return optionals, so result will either be empty or populated, NOT nil
            fieldObservations = FieldSurveyJSONParser.parse(data)
        }
        
        return fieldObservations
    }
}
