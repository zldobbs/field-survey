//
//  FieldSurveyJSONLoader.swift
//  field-survey
//
//  Created by Zachary Dobbs on 4/2/18.
//  Copyright © 2018 Zachary Dobbs. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    class func load(fileName: String) -> [Observation] {
        var fieldObservations = [Observation]()
        
        // convert the fileName to a path
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        {
            fieldObservations = FieldSurveyJSONParser.parse(data)
        }
        
        return fieldObservations
    }
}
