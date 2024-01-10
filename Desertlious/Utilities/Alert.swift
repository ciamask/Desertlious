//
//  Alert.swift
//  Desertlious
//
//  Created by Shreeya Maskey on 1/5/24.
//

import SwiftUI

struct AlertItems: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItems(title: Text("Server Error"),
                                              message: Text("The data received from the server was invalid. Please contact support."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItems(title: Text("Server Error"),
                                            message: Text("Invalid response from the server.Please try again later or contact support."),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItems(title: Text("Server Error"),
                                        message: Text("There was an issue connecting to the server. If persist contact support."),
                                              dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItems(title: Text("Server Error"),
                                             message: Text("Unable to complete your request at the time. Please check you network connection"),
                                              dismissButton: .default(Text("OK")))
}
