//
//  ContactsPageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct ContactsPageCode {
    var prefix: String
    var lower: String
    var code: String = ""
    
    init(prefix: String) {
        self.prefix = prefix
        self.lower = prefix.lowercased()
        code = """
import React from "react";
import { View, Text, StyleSheet, TextInput, ImageBackground } from 'react-native';
import colors from "../\(lower)_configs/\(lower)Colors";

const \(prefix)ContactsPage = () => {
    return (
        <ImageBackground source={require('../\(lower)_assets/bg.png')} style={{ flex: 1}}>
        <Text style={styles.\(lower)_subtitle}>Наши контактные данные</Text>
        <TextInput
            style={styles.\(lower)_input}
            value={"\(getRandomCity())"}
        />
        <TextInput
            style={styles.\(lower)_input}
            value={"admin@\(lower).com"}
        />
        <TextInput
            style={styles.\(lower)_input}
            value={"\(getRandomNumber())"}
        />
        <TextInput
            style={styles.\(lower)_input}
            value={"\(getRandonAdresse())"}
        />
        <TextInput
            style={styles.\(lower)_input}
            value={"\(getInfo())"}
        />
        </ImageBackground>
    );
}

const styles = StyleSheet.create({
    \(lower)_subtitle: {
        backgroundColor: colors.light,
        fontSize: \(Int.random(in: 18...24)),
        textAlign:'center',
        marginTop: \(Int.random(in: 3...10)),
        fontWeight: '700',
        marginBottom: \(Int.random(in: 3...10)),
        color: colors.dark
    },
    \(lower)_input: {
        backgroundColor: colors.light,
        borderWidth: \(Int.random(in: 0...5)),
        borderColor: colors.lightDark,
        height: \(Int.random(in: 35...55)),
        paddingLeft: \(Int.random(in: 15...25)),
        marginHorizontal: \(Int.random(in: 10...30)),
        marginBottom: \(Int.random(in: 15...30)),
        borderRadius: \(Int.random(in: 0...20))
    },
})

export default \(prefix)ContactsPage
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
    
    func getRandomNumber() -> String {
        var phones = ["8 (673)", "8 (627)", "8 (234)", "8 (443)", "8 (336)", "8 (994)", "8 (746)", "8 (773)", "8 (764)", "8 (154)", "8 339)", "8 (552)", "8 (663)", "8 (773)", "8 (995)", "8 (559)", "8 (112)", "8 (221)", "8 (222)", "8 (223)", "8 (224)", "8 (225)"]
        var code = phones[Int.random(in: 0...phones.count - 1)]
        for i in 0..<7 {
            code += String(Int.random(in: 0...9))
        }
        return code
    }
    
    func getRandomCity() -> String {
        return Adresses().cityes[Int.random(in: 0...Adresses().cityes.count - 1)]
    }
    
    func getRandonAdresse() -> String {
        return Adresses().streets[Int.random(in: 0...Adresses().streets.count - 1)] + " \(Int.random(in: 1...25))"
    }
    func getInfo() -> String {
        return Adresses().info[Int.random(in: 0...Adresses().info.count - 1)]
    }
}

struct Adresses {
    var cityes = ["Москва", "Санкт-Петербург", "Новосибирск", "Владивосток", "Рига", "Кишинев", "Киев", "Харьков", "Хабаровск", "Алма-Аты", "София", "Ташкент", "Душанбе", "Бишкек", "Минск", "Могилев", "Самара", "Брест", "Запорожье", "Днепропетровск", "Баку", "Ереван", "Тбилиси", "Ростов-на-Дону", "Краснодар"]
    var streets = ["Центральная", "Молодежная", "Лесная", "Школьная", "Садовая", "Новая", "Советская", "Набережная", "Заречная", "Полевая", "Зеленая", "Мира", "Ленина", "Полевая", "Луговая", "Октябрьская", "Комсомольская", "Гагарина", "Первомайская", "Северная", "Солнечная", "Степная", "Южная", "Береговая", "Кирова", "Пионерская", "Юбилейная", "Речная", "Нагорная", "Восточная", "Колхозная", "Пушкина", "Пролетарская", "Железнодорожная", "Озерная", "Рабочая", "Дачная", "Победы", "Калинина", "Чапаева"]
    var info = [
        "Вход со стороны парковки",
        "Вход со стороны заправки",
        "Вход с задней стороны здания",
        "Третий этаж",
        "Второй этаж",
        "24/7",
        "08:00 - 24:00",
        "Работаем круглосуточно",
        "Слева от бизнес-центра",
        "Ждем всех в гости",
    ]
}
