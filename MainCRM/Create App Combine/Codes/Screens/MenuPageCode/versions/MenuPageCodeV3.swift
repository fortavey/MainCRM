//
//  MenuPageCodeV3.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import Foundation

struct MenuPageCodeV3: PageCodeProtocol {
    var prefix: String
    var appName: String = ""
    var lower: String
    var code: String
    
    init(prefix: String, appName: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        
        code = """
import React from "react";
import { View, Text, StyleSheet, ImageBackground, ScrollView, Image, Dimensions } from 'react-native';
import \(lower)Products from "../\(lower)_assets/\(lower)Products";
import colors from "../\(lower)_configs/\(lower)Colors";

const \(prefix)Product = ({product}) => {
    return (
        <View style={styles.\(lower)_item}>
            <Image source={product.\(lower)_image} style={styles.\(lower)_image} />
            <View style={styles.\(lower)_textItemContainer}>
                <Text style={styles.\(lower)_itemTitle}>{product.\(lower)_title}</Text>
                <Text style={styles.\(lower)_itemDesc}>{product.\(lower)_desc}</Text>
            </View>
        </View>
    )
}

const \(prefix)MenuPage = () => {
    const \(lower)RenderMenuList = () => {
        return \(lower)Products.map(pr => <\(prefix)Product key={pr.\(lower)_title} product={pr} />)
    }

    return (
        <ScrollView>
            <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1}}>
                <Text style={styles.\(lower)_subtitle}>Взгляните на наше меню</Text>
                {\(lower)RenderMenuList()}
            </ImageBackground>
        </ScrollView>
    );
}

const imageWidth = \(Int.random(in: 150...200))

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        backgroundColor: colors.light,
        fontSize: \(Int.random(in: 21...27)),
        textAlign:'center',
        marginTop: \(Int.random(in: 5...15)),
        marginBottom: \(Int.random(in: 15...25)),
        fontWeight: 700,
        marginHorizontal: \(Int.random(in: 20...50)),
    },
    \(lower)_item: {
        backgroundColor: colors.light,
        marginVertical: \(Int.random(in: 5...10)),
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark,
        marginHorizontal: \(Int.random(in: 10...20)),
        borderRadius: \(Int.random(in: 10...40)),
        padding: 10
    },
    \(lower)_image: {
        width: imageWidth,
        height: imageWidth,
        marginHorizontal: 'auto',
        borderRadius: \(Int.random(in: 15...25))
    },
    \(lower)_itemTitle: {
        fontSize: \(Int.random(in: 17...20)),
        fontWeight:'700',
        marginBottom: \(Int.random(in: 3...7)),
        textAlign:'center'
    },
    \(lower)_itemDesc: {
        fontSize: \(Int.random(in: 14...16)),
        marginTop: 'auto',
        marginBottom: \(Int.random(in: 5...10)),
        textAlign:'center'
    }
})

export default \(prefix)MenuPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}

