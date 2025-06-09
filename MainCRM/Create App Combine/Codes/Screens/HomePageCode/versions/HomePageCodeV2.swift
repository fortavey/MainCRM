//
//  HomePageCodeV2.swift
//  CreateApp
//
//  Created by Main on 22.05.2025.
//

import Foundation

struct HomePageCodeV2: PageCodeProtocol {
    var prefix: String
    var appName: String
    var lower: String
    var code: String = ""
    var random: Int
    
    func renderLogoTop() -> String {
        if random > 10 {
            return """
            <Text style={styles.\(lower)_title}>\(appName)</Text>
            <Image source={require('../\(lower)_assets/\(lower)_logo.\(Helper.shared.ext)')} style={styles.\(lower)_logo} />
"""
        }
        return ""
    }
        
    func renderLogoCenter() -> String {
        if random <= 10 {
            return "<View style={{width: '100%', alignItems:'center'}}><Image source={require('../\(lower)_assets/\(lower)_logo.\(Helper.shared.ext)')} style={styles.\(lower)_logo} /></View>"
        }
        return ""
    }
    
    init(prefix: String, appName: String) {
        self.prefix = prefix
        self.appName = appName
        self.lower = prefix.lowercased()
        self.random = Int.random(in: 1...20)
        
        code = """
import React from "react";
import { Text, TouchableOpacity, StyleSheet, ImageBackground, Image, View, Dimensions } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";
import { useNavigation } from "@react-navigation/native";

const \(prefix)HomePage = () => {
    const navigation = useNavigation()
    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            \(renderLogoTop())
            <View style={styles.\(lower)_cont}>
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
            </View>
            
        </ImageBackground>
    );
}

const width = Dimensions.get('window').width / 2 - 50
const logoWidth = \(Int.random(in: 100...200))

const styles = StyleSheet.create({
    \(lower)_title: {
        fontSize: \(Int.random(in: 22...29)),
        fontWeight: '700',
        marginHorizontal: \(Int.random(in: 20...50)),
        marginBottom: \(Int.random(in: 20...50)),
        textAlign: 'center',
        color: colors.dark
    },
    \(lower)_cont: {
        flexDirection: 'row',
        justifyContent:'space-around',
        alignItems:'center',
        flexWrap: 'wrap',
    },
    \(lower)_item: {
        width: width,
        height: width,
        borderWidth: \(Int.random(in: 1...5)),
        borderColor: colors.lightDark,
        justifyContent:'center',
        alignItems:'center',
        borderRadius: \(Int.random(in: 5...20)),
        backgroundColor: colors.light,
        marginVertical: \(Int.random(in: 5...20))
    },
    \(lower)_itemText: {
        color: colors.dark,
        textAlign:'center',
        fontSize: \(Int.random(in: 15...18)),
        fontWeight: '700'
    },
    \(lower)_logo: {
        width: logoWidth,
        height: logoWidth,
        borderRadius: \(Int.random(in: 15...40)),
        marginBottom: \(Int.random(in: 20...50)),
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
