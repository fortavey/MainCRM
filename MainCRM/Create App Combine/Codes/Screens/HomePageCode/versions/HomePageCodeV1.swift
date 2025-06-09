//
//  HomePageCodeV1.swift
//  CreateApp
//
//  Created by Main on 22.05.2025.
//

import Foundation

struct HomePageCodeV1: PageCodeProtocol {
    var prefix: String
    var appName: String
    var lower: String
    var code: String = ""
    var random: Int
    
    func renderLogoTop() -> String {
        if random > 10 {
            return "<Image source={require('../\(lower)_assets/\(lower)_logo.\(Helper.shared.ext)')} style={styles.\(lower)_logo} />"
        }
        return ""
    }
    
    func renderLogoCenter() -> String {
        if random <= 10 {
            return "<Image source={require('../\(lower)_assets/\(lower)_logo.\(Helper.shared.ext)')} style={styles.\(lower)_logo} />"
        }
        return ""
    }
    
    init(prefix: String, appName: String) {
        self.prefix = prefix
        self.appName = appName
        self.lower = prefix.lowercased()
        self.random = Int.random(in: 1...20)
        self.code = """
import React from "react";
import { Text, TouchableOpacity, StyleSheet, ImageBackground, Image } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";
import { useNavigation } from "@react-navigation/native";

const \(prefix)HomePage = () => {
    const navigation = useNavigation()
    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            \(renderLogoTop())
            <TouchableOpacity style={styles.\(lower)_item} onPress={() => navigation.push('\(prefix)MenuPage')}>
                <Text style={styles.\(lower)_itemText}>\(OurMenu().getText())</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.\(lower)_item} onPress={() => navigation.push('\(prefix)BookingPage')}>
                <Text style={styles.\(lower)_itemText}>\(BookingText().getText())</Text>
            </TouchableOpacity>
            \(renderLogoCenter())
            <TouchableOpacity style={styles.\(lower)_item} onPress={() => navigation.push('\(prefix)ContactsPage')}>
                <Text style={styles.\(lower)_itemText}>\(ContactsText().getText())</Text>
            </TouchableOpacity>
            <TouchableOpacity style={styles.\(lower)_item} onPress={() => navigation.push('\(prefix)BroadcastsPage')}>
                <Text style={styles.\(lower)_itemText}>\(BroadcastsText().getText())</Text>
            </TouchableOpacity>
        </ImageBackground>
    );
}

const \(lower)LogoWidth = \(Int.random(in: 80...150))

const styles = StyleSheet.create({
    \(lower)_item: {
        width: \(Int.random(in: 200...300)),
        height: \(Int.random(in: 35...55)),
        borderWidth: \(Int.random(in: 0...4)),
        borderColor: colors.lightDark,
        justifyContent:'center',
        alignItems:'center',
        borderRadius: \(Int.random(in: 2...20)),
        backgroundColor: colors.light,
        marginVertical: \(Int.random(in: 5...30))
    },
    \(lower)_itemText: {
        color: colors.dark,
        textAlign: 'center',
        fontSize: \(Int.random(in: 15...19)),
        fontWeight: '\(Int.random(in: 300...700))'
    },
    \(lower)_logo: {
        width: \(lower)LogoWidth,
        height: \(lower)LogoWidth,
        borderRadius: \(Int.random(in: 5...40)),
        marginBottom: \(Int.random(in: 20...70)),
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark
    }
})

export default \(prefix)HomePage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
