
import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "betCell", for: indexPath)

        let subeventLabel = cell.viewWithTag(2) as! UILabel
        let teamLabel = cell.viewWithTag(1) as! UILabel
        let marketLabel = cell.viewWithTag(3) as! UILabel
        let imageView = cell.viewWithTag(4) as! UIImageView

        let stakeLabel = cell.viewWithTag(5) as! UILabel
        let oddsLabel = cell.viewWithTag(6) as! UILabel
        let returnsLabel = cell.viewWithTag(7) as! UILabel
        let timeLabel = cell.viewWithTag(8) as! UILabel

        //TODO: Apply Data to Labels

        return cell
    }
}

