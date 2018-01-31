
import UIKit

class MainTableViewController: UITableViewController {

    var singleBets: [Bet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        getData()
    }
    
    func getData() {
        let result = DataManager.instance.getSingleBets()
        
        if let error = result.errorText {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        } else {
            singleBets = result.singleBets
            tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return singleBets.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath) as! BetCell
        
        var singleBet = singleBets[indexPath.row]
        cell.configureCell(bet: singleBet)
    
        return cell
    }
}

