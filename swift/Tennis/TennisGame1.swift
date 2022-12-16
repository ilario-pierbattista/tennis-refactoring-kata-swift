import Foundation

struct Player {
    let name: String
    var score: Int
}

class TennisGame1: TennisGame {
    private var player1: Player
    private var player2: Player
    
    required init(player1: String, player2: String) {
        self.player1 = Player(name: player1, score: 0)
        self.player2 = Player(name: player2, score: 0)
    }

    func wonPoint(_ playerName: String) {
        if playerName == player1.name {
            player1.score += 1
        } else {
            player2.score += 1
        }
    }

    func equalScore(_ score: Int) -> String {
        switch score
            {
            case 0:
                return "Love-All"

            case 1:
                return "Fifteen-All"

            case 2:
                return "Thirty-All"

            default:
                return "Deuce"
            }
    }

    func advantageScore(score1: Int, score2: Int) -> String {
        let difference = score1 - score2
        let absDifference = abs(difference)

        let player = difference > 0 ? player1.name : player2.name

        switch absDifference {
            case 1: 
               return "Advantage \(player)"
            default: 
               return "Win for \(player)"
        }
    }

    let scoreToString: [Int: String] = [
        0: "Love", 
        1: "Fifteen",
        2: "Thirty",
        3: "Forty"
    ]

    func baseScore(score1: Int, score2: Int) -> String {
        let score1Str = scoreToString[score1, default: ""]
        let score2Str = scoreToString[score2, default: ""]
        
        return "\(score1Str)-\(score2Str)"
    }
    
    var score: String? {
        if player1.score == player2.score
        {
            return equalScore(player1.score)
        }
        
        if player1.score>=4 || player2.score>=4
        {
            return advantageScore(score1: player1.score, score2: player2.score)
        }
        
        return baseScore(score1: player1.score, score2: player2.score)
    }
}
