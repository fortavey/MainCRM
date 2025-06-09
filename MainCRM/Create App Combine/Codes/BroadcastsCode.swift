//
//  BroadcastsCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct BroadcastsCode {
    var prefix: String
    var code: String = ""
    var ligas: [Liga] = [LaLiga(), SerieA(), BundesLiga(), PremierLiga()]
    var broadcast: [String] = []
    
    func getBroadcast() -> String {
        let item = ligas[Int.random(in: 0...3)]
        let teams: [String] = item.getTeams()
        let date = Int.random(in: 1...30)
        let hours = Int.random(in: 16...23)
        var renderDate: String = ""
        if date < 10 {
            renderDate = "0\(date)"
        } else {
            renderDate = "\(date)"
        }
        
        return """
    {
        \(prefix.lowercased())_liga: '\(item.title)',
        \(prefix.lowercased())_team1: '\(teams[0])',
        \(prefix.lowercased())_team2: '\(teams[1])',
        \(prefix.lowercased())_date: '\(renderDate).07.2025',
        \(prefix.lowercased())_time: '\(hours):30'
    },\n
"""
    }
    
    init(prefix: String) {
        self.prefix = prefix
        self.code = """
const broadcasts = [
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
    \(getBroadcast())
]

export default broadcasts
"""
    }
    
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}

protocol Liga {
    var title: String { get }
    var teams: [String] { get }
    func getTeams() -> [String]
}

struct LaLiga: Liga {
    func getTeams() -> [String] {
        [teams.randomElement()!, teams.randomElement()!]
    }
    
    var title = "Spanish La-Liga"
    var teams: [String] = [
        "Alavés",
        "Athletic Bilbao",
        "Atlético Madrid",
        "Barcelona",
        "Celta Vigo",
        "Espanyol",
        "Getafe",
        "Girona",
        "Las Palmas",
        "Leganés",
        "Mallorca",
        "Osasuna",
        "Rayo Vallecano",
        "Real Betis",
        "Real Madrid",
        "Real Sociedad",
        "Sevilla",
        "Valencia",
        "Valladolid",
        "Villarreal",
    ]
}

struct SerieA: Liga {
    func getTeams() -> [String] {
        [teams[Int.random(in: 0...19)], teams[Int.random(in: 0...19)]]
    }
    
    var title = "Italian Serie A"
    var teams: [String] = [
        "Atalanta",
        "Bologna",
        "Cagliari",
        "Como",
        "Empoli",
        "Fiorentina",
        "Genoa",
        "Hellas Verona",
        "Inter",
        "Juventus",
        "Lazio",
        "Lecce",
        "AC Milan",
        "Monza",
        "Napoli",
        "Parma",
        "Roma",
        "Torino",
        "Udinese",
        "Venezia",
    ]
}

struct BundesLiga: Liga {
    func getTeams() -> [String] {
        [teams[Int.random(in: 0...17)], teams[Int.random(in: 0...17)]]
    }
    
    var title = "Bundesliga"
    var teams: [String] = [
        "FC Augsburg",
        "Bayer Leverkusen",
        "Bayern Munich",
        "VfL Bochum",
        "Borussia Dortmund",
        "Borussia Mönchengladbach",
        "Eintracht Frankfurt",
        "SC Freiburg",
        "1. FC Heidenheim",
        "TSG Hoffenheim",
        "Holstein Kiel",
        "RB Leipzig",
        "Mainz 05",
        "FC St. Pauli",
        "VfB Stuttgart",
        "Union Berlin",
        "Werder Bremen",
        "VfL Wolfsburg",
    ]
}

struct PremierLiga: Liga {
    func getTeams() -> [String] {
        [teams[Int.random(in: 0...19)], teams[Int.random(in: 0...19)]]
    }
    
    var title = "Premier League"
    var teams: [String] = [
        "Arsenal",
        "Aston Villa",
        "Bournemouth",
        "Brentford",
        "Brighton & Hove Albion",
        "Chelsea",
        "Crystal Palace",
        "Everton",
        "Fulham",
        "Ipswich Town",
        "Leicester City",
        "Liverpool",
        "Manchester City",
        "Manchester United",
        "Newcastle United",
        "Nottingham Forest",
        "Southampton",
        "Tottenham Hotspur",
        "West Ham United",
        "Wolverhampton Wanderers",
    ]
}
