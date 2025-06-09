//
//  SuccessPageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct SuccessPageCode {
    var prefix: String
    var lower: String
    var code: String
    
    init(prefix: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        code = """
import React from "react";
import { Text, TouchableOpacity, StyleSheet, ImageBackground, Image } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";
import { useNavigation } from "@react-navigation/native";

const \(prefix)SuccessPage = () => {
    const navigation = useNavigation()
    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
            <Image source={require('../\(lower)_assets/\(lower)_success.png')} style={styles.\(lower)_image} />
            <TouchableOpacity style={styles.\(lower)_btn} onPress={() => navigation.push('\(prefix)HomePage')}>
                <Text style={styles.\(lower)_btnText}>На главную</Text>
            </TouchableOpacity>
        </ImageBackground>
    );
}

const \(lower)LogoWidth = \(Int.random(in: 150...250))

const styles = StyleSheet.create({
    \(lower)_image: {
        width: \(lower)LogoWidth,
        height: \(lower)LogoWidth,
        marginTop:'auto'
    },
    \(lower)_btn: {
        marginTop:'auto',
        marginBottom: \(Int.random(in: 40...80)),
        width: \(Int.random(in: 200...300)),
        height: \(Int.random(in: 35...60)),
        alignItems:'center',
        justifyContent:'center',
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark,
        backgroundColor: colors.light,
        marginHorizontal: 'auto',
    },
    \(lower)_btnText: {
        color: colors.dark
    }
})

export default \(prefix)SuccessPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
