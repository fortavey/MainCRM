//
//  BookingPageCodeV1.swift
//  CreateApp
//
//  Created by Main on 22.05.2025.
//

import Foundation

struct BookingPageCodeV1: PageCodeProtocol {
    var prefix: String
    var appName: String = ""
    var lower: String
    var code: String
    
    init(prefix: String, appName: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        
        code = """
import React, { useState } from "react";
import { View, Text, StyleSheet, TextInput, TouchableOpacity, ImageBackground } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";
import { useNavigation } from "@react-navigation/native";

const \(prefix)BookingPage = () => {
    const navigation = useNavigation()

    const [\(lower)Name, set\(prefix)Name] = useState('\(YourNameText().getText())')
    const [\(lower)Email, set\(prefix)Email] = useState('\(YourEmailText().getText())')
    const [\(lower)Phone, set\(prefix)Phone] = useState('\(YourPhoneText().getText())')
    const [\(lower)Time, set\(prefix)Time] = useState('\(YourDateText().getText())')
    const [\(lower)Commit, set\(prefix)Commit] = useState('\(YourMessageText().getText())')

    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1, justifyContent:'space-between'}}>
            <Text style={styles.\(lower)_subtitle}>\(YourContactsText().getText())</Text>
            <View>
                <TextInput
                    style={styles.\(lower)_input}
                    onChangeText={set\(prefix)Name}
                    value={\(lower)Name}
                />
                <TextInput
                    style={styles.\(lower)_input}
                    onChangeText={set\(prefix)Email}
                    value={\(lower)Email}
                />
                <TextInput
                    style={styles.\(lower)_input}
                    onChangeText={set\(prefix)Phone}
                    value={\(lower)Phone}
                />
                <TextInput
                    style={styles.\(lower)_input}
                    onChangeText={set\(prefix)Time}
                    value={\(lower)Time}
                />
                <TextInput
                    style={styles.\(lower)_input}
                    onChangeText={set\(prefix)Commit}
                    value={\(lower)Commit}
                />
            </View>
            <TouchableOpacity style={styles.\(lower)_button} onPress={() => navigation.push('\(prefix)SuccessPage')}>
                <Text>Забронировать</Text>
            </TouchableOpacity>
        </ImageBackground>
    );
}

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        \(Helper.shared.getRandomString(str: "backgroundColor: colors.light,"))
        fontSize: \(Int.random(in: 18...25)),
        textAlign:'center',
        marginTop: \(Int.random(in: 5...10)),
        fontWeight: '\(Int.random(in: 200...700))',
        marginBottom: \(Int.random(in: 10...30)),
        color: colors.dark
    },
    \(lower)_input: {
        backgroundColor: colors.light,
        borderWidth: \(Int.random(in: 1...4)),
        borderColor: colors.lightDark,
        height: \(Int.random(in: 30...50)),
        paddingLeft: \(Int.random(in: 15...25)),
        marginHorizontal: \(Int.random(in: 10...30)),
        marginBottom: \(Int.random(in: 15...40)),
        borderRadius: \(Int.random(in: 0...20))
    },
    \(lower)_button: {
        width: \(Int.random(in: 150...300)),
        height: \(Int.random(in: 40...60)),
        alignItems:'center',
        justifyContent:'center',
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark,
        backgroundColor: colors.light,
        marginHorizontal: 'auto',
        marginBottom: \(Int.random(in: 30...80))
    }
})

export default \(prefix)BookingPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
