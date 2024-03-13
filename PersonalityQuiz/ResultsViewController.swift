//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Yiwen Hao on 2023-07-25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder:coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true

        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult() {
        //use reduce(into:) to count the frequency and make into a dictionary
        let frequencyOfAnswers = responses.reduce(into: [:]) {(counts, answer)in
            counts[answer.type, default: 0] += 1
            
        }
            
//            let frequentAnswersSorted = frequencyOfAnswers.sorted(by:
//                   {(pair1, pair2) -> Bool in
//                       return pair1.value > pair2.value
//                   })
//            let mostCommonAnswer = frequentAnswersSorted.first!.key
        let mostCommonAnswer = frequencyOfAnswers.sorted{$0.1 > $1.1}.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
    }

}
