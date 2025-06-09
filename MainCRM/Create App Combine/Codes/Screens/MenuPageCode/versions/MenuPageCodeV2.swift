//
//  MenuPageCodeV2.swift
//  CreateApp
//
//  Created by Main on 22.05.2025.
//

import Foundation

struct MenuPageCodeV2: PageCodeProtocol {
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

const imageWidth = \(Int.random(in: 80...160))
const imageWidthMarginRight = \(Int.random(in: 10...20))
const addWidth = \(Int.random(in: 15...40))
const borderWidth = \(Int.random(in: 1...5))

const \(lower)_container_width = Dimensions.get('window').width - imageWidth - addWidth

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        \(Helper.shared.getRandomString(str: "backgroundColor: colors.light,"))
        fontSize: \(Int.random(in: 22...26)),
        textAlign:'center',
        marginTop: \(Int.random(in: 5...10)),
        marginBottom: \(Int.random(in: 15...30)),
        fontWeight: 700,
        marginHorizontal: \(Int.random(in: 30...50)),
    },
    \(lower)_item: {
        backgroundColor: colors.light,
        marginVertical: \(Int.random(in: 4...10)),
        flexDirection:'row',
        overflow: 'hidden',
        borderBottomWidth: borderWidth,
        borderTopWidth: borderWidth,
        borderColor: colors.lightDark
    },
    \(lower)_image: {
        width: imageWidth + addWidth,
        height: imageWidth,
        marginRight: imageWidthMarginRight,
    },
    \(lower)_textItemContainer: {
        width: \(lower)_container_width,
    },
    \(lower)_itemTitle: {
        fontSize: \(Int.random(in: 16...20)),
        fontWeight:'700',
        marginBottom: \(Int.random(in: 4...10))
    },
    \(lower)_itemDesc: {
        fontSize: \(Int.random(in: 13...17)),
        marginTop: 'auto',
        marginBottom: \(Int.random(in: 5...15))
    }
})

export default \(prefix)MenuPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
