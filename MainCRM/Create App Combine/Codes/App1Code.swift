//
//  App1Code.swift
//  CreateApp
//
//  Created by Main on 17.05.2025.
//

import Foundation

struct App1Code {
    var prefix: String
    var lower: String
    var code: String
    
    init(prefix: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        self.code = """
import * as React from 'react';
import { createStaticNavigation } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import \(prefix)HomePage from './src/\(lower)_screens/\(prefix)HomePage';
import \(prefix)MenuPage from './src/\(lower)_screens/\(prefix)MenuPage';
import \(prefix)BookingPage from './src/\(lower)_screens/\(prefix)BookingPage';
import \(prefix)ContactsPage from './src/\(lower)_screens/\(prefix)ContactsPage';
import \(prefix)BroadcastsPage from './src/\(lower)_screens/\(prefix)BroadcastsPage';
import \(prefix)SuccessPage from './src/\(lower)_screens/\(prefix)SuccessPage'

const RootStack = createNativeStackNavigator({
    initialRouteName: '\(prefix)HomePage',
    screens: {
        \(prefix)HomePage: {
            screen: \(prefix)HomePage,
            options: {
                title: 'Главная',
                headerShown: false
            },
        },
        \(prefix)MenuPage: {
            screen: \(prefix)MenuPage,
            options: {
                title: 'Наше меню',
            },
        },
        \(prefix)BookingPage: {
            screen: \(prefix)BookingPage,
            options: {
                title: 'Резерв столика',
            },
        },
        \(prefix)SuccessPage: {
            screen: \(prefix)SuccessPage,
            options: {
                title: 'Заказ успешен!',
            },
        },
        \(prefix)ContactsPage: {
            screen: \(prefix)ContactsPage,
            options: {
                title: 'Наши контакты',
            },
        },
        \(prefix)BroadcastsPage: {
            screen: \(prefix)BroadcastsPage,
            options: {
                title: 'Трансляции',
            },
        },
    },
  });

const Navigation = createStaticNavigation(RootStack);

export default function App1() {
  return <Navigation />;
}
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
