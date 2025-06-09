//
//  MenuPageCodeV1.swift
//  CreateApp
//
//  Created by Main on 22.05.2025.
//

import Foundation

struct MenuPageCodeV1: PageCodeProtocol {
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
                <Text style={styles.\(lower)_subtitle}>\(OurMenuTitleText().getText())</Text>
                {\(lower)RenderMenuList()}
            </ImageBackground>
        </ScrollView>
    );
}

const imageWidth = \(Int.random(in: 80...120))
const imageWidthMarginRight = \(Int.random(in: 5...20))
const itemPadding = \(Int.random(in: 3...8))
const itemMargin = \(Int.random(in: 5...15))

const \(lower)_container_width = Dimensions.get('window').width - imageWidth - imageWidthMarginRight*2 - itemMargin*2 - itemPadding*2

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        \(Helper.shared.getRandomString(str: "backgroundColor: colors.light,"))
        fontSize: \(Int.random(in: 20...24)),
        textAlign:'center',
        marginTop: \(Int.random(in: 5...10)),
        fontWeight: 700
    },
    \(lower)_item: {
        backgroundColor: colors.light,
        marginVertical: \(Int.random(in: 3...7)),
        padding: itemPadding,
        flexDirection:'row',
        marginHorizontal: itemMargin,
        borderRadius: \(Int.random(in: 10...30)),
        overflow: 'hidden'
    },
    \(lower)_image: {
        width: imageWidth,
        height: imageWidth,
        marginRight: imageWidthMarginRight,
        borderRadius: \(Int.random(in: 10...30))
    },
    \(lower)_textItemContainer: {
        width: \(lower)_container_width,
    },
    \(lower)_itemTitle: {
        fontSize: \(Int.random(in: 15...20)),
        fontWeight:'700',
        marginBottom: \(Int.random(in: 5...15))
    },
    \(lower)_itemDesc: {
        fontSize: \(Int.random(in: 14...16))
    }
})

export default \(prefix)MenuPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
