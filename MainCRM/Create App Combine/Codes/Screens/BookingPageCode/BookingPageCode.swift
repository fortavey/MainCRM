//
//  BookingPageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct BookingPageCode {
    var prefix: String
    var versions: [PageCodeProtocol]
    var version: PageCodeProtocol
    
    init(prefix: String) {
        self.prefix = prefix
        versions = [
            BookingPageCodeV1(prefix: prefix, appName: ""),
        ]
        version = versions[Int.random(in: 0..<versions.count)]
    }
    
    func getCode() -> Data {
        return version.getCode()
    }
}


struct YourContactsText {
    var variants = [
        "Пожалуйста, укажите ваши контактные данные",
        "Введите информацию для связи",
        "Заполните поля с контактными данными",
        "Укажите ваши контактные сведения",
        "Внесите данные для обратной связи",
        "Пожалуйста, предоставьте ваши контакты",
        "Введите свои контактные данные",
        "Запишите ваши данные для связи",
        "Укажите контактную информацию",
        "Введите необходимые контактные данные",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct YourNameText {
    var variants = [
        "Имя",
        "Ваше полное имя",
        "Фамилия и имя",
        "Имя пользователя",
        "Введите имя",
        "Укажите имя",
        "Имя клиента",
        "Имя и отчество",
        "Персональное имя",
        "Ваше имя и фамилия",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct YourEmailText {
    var variants = [
        "Ваш электронный адрес",
        "Адрес электронной почты",
        "Введите ваш Email",
        "Укажите ваш email",
        "Электронная почта",
        "Email для связи",
        "Ваш e-mail адрес",
        "Адрес e-mail",
        "Почтовый ящик",
        "Контактный Email",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct YourPhoneText {
    var variants = [
        "Ваш номер телефона",
        "Контактный номер",
        "Номер мобильного",
        "Телефон для связи",
        "Введите номер телефона",
        "Укажите ваш телефон",
        "Мобильный телефон",
        "Телефонный номер",
        "Номер для связи",
        "Ваш контактный телефон",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct YourDateText {
    var variants = [
        "Предпочтительная дата и время",
        "Удобные дата и время",
        "Выбранная дата и время",
        "Запланированная дата и время",
        "Дата и время по желанию",
        "Желаемый день и время",
        "Ожидаемая дата и время",
        "Дата и время встречи",
        "Время и дата, которые вам подходят",
        "Дата и время для записи",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}

struct YourMessageText {
    var variants = [
        "Ваши предпочтения",
        "Ваши запросы",
        "Ваши требования",
        "Ваши ожидания",
        "Ваши пожелания и предложения",
        "Ваши указания",
        "Ваши рекомендации",
        "Ваши замечания",
        "Ваши пожелания по поводу",
        "Ваши пожелания и замечания",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}


