import UIKit

public class LogViewController: UITableViewController {
 
    let logItems = LogStore.log
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: K.LOG_CELL)
    }
    
    public override func tableView(_ tableView: UITableView,
                    numberOfRowsInSection section: Int) -> Int {
        
        return logItems.count
    }
    
    public override func tableView(_ tableView: UITableView,
                    cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: K.LOG_CELL,
                                                 for: indexPath)
        cell.textLabel?.text = logItems[indexPath.row]
        
        return cell
    }
}
