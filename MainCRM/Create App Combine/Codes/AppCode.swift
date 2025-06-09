//
//  AppCode.swift
//  CreateApp
//
//  Created by Main on 17.05.2025.
//

import Foundation

struct AppCode {
    var prefix: String
    
    var code = """
import React from "react";
import App1 from "./App1";

const App = () => {
  return <App1 />
}

export default App
"""
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
