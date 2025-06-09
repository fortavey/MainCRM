//
//  BroadcastsPageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct BroadcastsPageCode {
    var prefix: String
    var lower: String
    var code: String
    
    init(prefix: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        code = """
import React from "react";
import { View, Text, StyleSheet, ImageBackground, ScrollView } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";
import broadcasts from "../\(lower)_assets/\(lower)Broadcasts";

const \(prefix)MatchItem = ({\(lower)Match}) => {
    return (
        <View style={styles.\(lower)_item}>
            <Text style={styles.\(lower)_itemLigaText}>{\(lower)Match.\(lower)_liga}</Text>
            <Text style={styles.\(lower)_itemDateText}>{\(lower)Match.\(lower)_date} - {\(lower)Match.\(lower)_time}</Text>
            <Text style={styles.\(lower)_itemTeamText}>{\(lower)Match.\(lower)_team1}</Text>
            <Text style={styles.\(lower)_itemTeamText}>{\(lower)Match.\(lower)_team2}</Text>
        </View>
    )
}

const \(prefix)BroadcastsPage = () => {

    const \(lower)RenderItems = () => {
        return broadcasts.sort((a, b) => a.\(lower)_date.localeCompare(b.\(lower)_date)).map(\(lower)Match => <\(prefix)MatchItem \(lower)Match={\(lower)Match} key={Math.random()} />)
    }

    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1}}>
            <Text style={styles.\(lower)_subtitle}>Расписание трансляций на большом экране</Text>
            <ScrollView>
                {\(lower)RenderItems()}
            </ScrollView>
        </ImageBackground>
    );
}

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        backgroundColor: colors.light,
        fontSize: \(Int.random(in: 18...24)),
        textAlign:'center',
        paddingHorizontal: \(Int.random(in: 10...25)),
        marginTop: \(Int.random(in: 3...15)),
        fontWeight: '\(Int.random(in: 200...900))',
        marginBottom: \(Int.random(in: 5...20)),
        color: colors.dark
    },
    \(lower)_item: {
        backgroundColor: colors.light,
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark,
        marginHorizontal: \(Int.random(in: 5...25)),
        padding: \(Int.random(in: 5...15)),
        marginBottom: \(Int.random(in: 15...25)),
        borderRadius: \(Int.random(in: 0...20))
    },
    \(lower)_itemLigaText: {
        fontSize: \(Int.random(in: 14...18)),
        fontWeight:'700',
        textAlign:'center'
    },
    \(lower)_itemDateText: {
        fontSize: \(Int.random(in: 13...17)),
        textAlign:'center'
    },
    \(lower)_itemTeamText: {
        fontSize: \(Int.random(in: 18...24)),
        fontWeight:'700',
        textAlign:'center'
    }
})

export default \(prefix)BroadcastsPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
