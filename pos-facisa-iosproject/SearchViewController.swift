import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return (AppDelegate.cities?.count)!
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cityCell")
        cell.textLabel?.text = AppDelegate.cities?[indexPath.row].name
        
        return(cell)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
        
        AppDelegate.selectedCity = AppDelegate.cities?[indexPath.row]
        performSegue(withIdentifier: "selectedCity", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
    }
    
    override func viewDidAppear(_ animated: Bool) {
        citiesTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AppDelegate.cities = [
            City(name: "Brasilia", population: 1321465, lat: "1.564", lng: "-4.654"),
            City(name: "zpto", population: 879856, lat: "1.564", lng: "-4.654")]
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
