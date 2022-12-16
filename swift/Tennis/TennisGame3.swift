import Foundation

class TennisGame3: TennisGame {
    private var score1: Int
    private var score2: Int
    private let player1Name: String
    private let player2Name: String
    
    required init(player1: String, player2: String) {
        player1Name = player1
        player2Name = player2
        score1 = 0
        score2 = 0
    }
    
    var score: String? {
        var s: String = ""
        if (score1 < 4 && score2 < 4) && (score1 + score2 < 6) {
            let p = ["Love", "Fifteen", "Thirty", "Forty"]
            s = p[score1];
            return (score1 == score2) ? "\(s)-All" : "\(s)-\(p[score2])"
        }

        var playerName: String = ""
        if (score1 == score2) { return "Deuce" }
        playerName = score1 > score2 ? player1Name : player2Name;
        return (abs(score1 - score2) == 1) 
            ? "Advantage \(playerName)" 
            : "Win for \(playerName)"
    }
    
    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            score1 += 1
        } else {
            score2 += 1
        }
    }  
}
