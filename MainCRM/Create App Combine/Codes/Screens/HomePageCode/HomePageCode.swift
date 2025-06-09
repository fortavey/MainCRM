//
//  HomePageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct HomePageCode {
    var prefix: String
    var appName: String
    var versions: [PageCodeProtocol]
    var version: PageCodeProtocol
    
    init(prefix: String, appName: String) {
        self.prefix = prefix
        self.appName = appName
        versions = [
            HomePageCodeV1(prefix: prefix, appName: appName),
            HomePageCodeV2(prefix: prefix, appName: appName)
        ]
        version = versions[Int.random(in: 0..<versions.count)]
    }
    
    func getCode() -> Data {
        return version.getCode()
    }
}

struct OurMenu {
    var variants = [
        "Наше меню",
        "Меню ресторана",
        "Ассортимент блюд",
        "Выбор наших блюд",
        "Каталог блюд",
        "Список блюд",
        "Кулинарное предложение",
        "Наши блюда",
        "Карта меню",
        "Меню на сегодня",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct BookingText {
    var variants = [
        "Резерв столика",
        "Бронирование столика",
        "Заказ столика",
        "Забронировать место",
        "Резервация столика",
        "Предварительная бронь",
        "Бронирование места",
        "Забронировать стол",
        "Заказ места в ресторане",
        "Резервирование посадочного места",
        "Оформить бронь столика",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct ContactsText {
    var variants = [
        "Наши контакты",
        "Контактная информация",
        "Связаться с нами",
        "Контакты компании",
        "Как с нами связаться",
        "Наши данные для связи",
        "Контактные данные",
        "Информация для связи",
        "Контактные реквизиты",
        "Связь с нами",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct BroadcastsText {
    var variants = [
        "Список трансляций",
        "Расписание трансляций",
        "Каталог трансляций",
        "Перечень трансляций",
        "Лист трансляций",
        "Программа трансляций",
        "График трансляций",
        "Сводка трансляций",
        "Плейлист трансляций",
        "Обзор трансляций",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}
