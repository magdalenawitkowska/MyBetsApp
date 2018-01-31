
import UIKit

class MainTableViewController: UITableViewController {

    var singleBets: [Bet] = []
    var errorAlert: UIAlertController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        
        getData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let alert = errorAlert {
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func getData() {
        let result = DataManager.instance.getSingleBets()
        if let error = result.errorText {
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            errorAlert = alert
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
        
        let singleBet = singleBets[indexPath.row]
        cell.configureCell(bet: singleBet)
    
        return cell
    }
}

