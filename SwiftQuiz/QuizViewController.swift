
import UIKit

class QuizViewController: UIViewController {
    //Controles da tela
    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    //Variaveis da classe
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Sempre que a tela for iniciar, define a lagura da view como o total da largura da tela
        viTimer.frame.size.width = view.frame.size.width
        
        //Efetua a animacao do timer
        UIView.animate(withDuration: 60.0, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (success) in
            self.showResults()
        }
        
        getNewQuiz()
    }
    
    func getNewQuiz() {
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        
        //Percorre o array de options
        for iCount in 0..<quizManager.options.count {
            //Obtem a opcao atraves do index
            let option = quizManager.options[iCount]
            
            //Obtem o botao conforme o index do array de botoes
            let button = btAnswers[iCount]
            
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults() {
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswers = quizManager.totalAnswers
        resultViewController.totalCorrectAnswers = quizManager.totalCorrectAnswers
    }
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.firstIndex(of: sender)!
        quizManager.validateAnswer(index: index)
        getNewQuiz()
    }
}
