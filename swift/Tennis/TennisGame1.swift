import Foundation

struct Player {
    let name: String
    let score: Int
}

class TennisGame1: TennisGame {
    private var player1: Player
    private var player2: Player
    
    required init(player1: String, player2: String) {
        self.player1 = Player(name: player1, score: 0)
        self.player2 = Player(name: player2, score: 0)
    }

    func increaseScore(for player: Player) -> Player {
        Player(name: player.name, score: player.score + 1)
    }

    func wonPoint(_ playerName: String) {
        if playerName == player1.name {
            player1 = increaseScore(for: player1)
        } else {
            player2 = increaseScore(for: player2)
        }
    }

    func sameScore(_ score: Int) -> String {
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

    func advantageScore(player1: Player, player2: Player) -> String {
        let difference = player1.score - player2.score
        let absDifference = abs(difference)

        let playerName = difference > 0 ? player1.name : player2.name

        switch absDifference {
            case 1: 
               return "Advantage \(playerName)"
            default: 
               return "Win for \(playerName)"
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
            return sameScore(player1.score)
        }
        
        if player1.score>=4 || player2.score>=4
        {
            return advantageScore(player1: player1, player2: player2)
        }
        
        return baseScore(score1: player1.score, score2: player2.score)
    }
}
