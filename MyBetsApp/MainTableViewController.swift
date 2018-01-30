
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath)
        
        var singleBet = singleBets[indexPath.row]

        let subeventLabel = cell.viewWithTag(2) as! UILabel
        let teamLabel = cell.viewWithTag(1) as! UILabel
        let marketLabel = cell.viewWithTag(3) as! UILabel
        let imageView = cell.viewWithTag(4) as! UIImageView

        let stakeLabel = cell.viewWithTag(5) as! UILabel
        let oddsLabel = cell.viewWithTag(6) as! UILabel
        let returnsLabel = cell.viewWithTag(7) as! UILabel
        let timeLabel = cell.viewWithTag(8) as! UILabel
        
        subeventLabel.text = singleBet.subEventName ?? ""
        teamLabel.text = singleBet.betName ?? ""
        marketLabel.text = singleBet.marketName ?? ""
        
        stakeLabel.text = singleBet.totalBetStake ?? ""
        oddsLabel.text = singleBet.odds ?? ""
        returnsLabel.text = singleBet.potentialWinnings ?? ""
       // timeLabel.text =
       // imageVie
        

        //TODO: Apply Data to Labels

        return cell
    }
}

