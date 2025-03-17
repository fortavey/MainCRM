//
//  Localizations.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import Foundation

enum Localizations: String, CaseIterable {
    case en = "en"
    case enCa = "en-CA"
    case enUs = "en-US"
    case enIn = "en-IN"
    case enZa = "en-ZA"
    case ar = "ar"
    case esEs = "es"
    case esLa = "es-419"
    case it = "it"
    case de = "de"
    case pl = "pl"
    case ptBr = "pt-BR"
    case pt = "pt"
    case ru = "ru"
    case tr = "tr"
    case fr = "fr"
    case hi = "hi"
    
    var title: String {
        switch self {
        case .en: "Английский (Великобритания)"
        case .enCa: "Английский (Канада)"
        case .enUs: "Английский (Соединенные Штаты)"
        case .enIn: "Английский (Индия)"
        case .enZa: "Английский (Южная Африка)"
        case .ar: "Арабский"
        case .esEs: "Испанский (Испания)"
        case .esLa: "Испанский (Латинская Америка)"
        case .it: "Итальянский"
        case .de: "Немецкий"
        case .pl: "Польский"
        case .ptBr: "Португальский (Бразилия)"
        case .pt: "Португальский (Португалия)"
        case .ru: "Русский"
        case .tr: "Турецкий"
        case .fr: "Французский (Франция)"
        case .hi: "Хинди"
        }
    }
}
