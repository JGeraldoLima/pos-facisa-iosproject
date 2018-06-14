import UIKit
import Alamofire

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var citiesTableView: UITableView!
    
    @IBOutlet weak var searchInput: UITextField!
    
    @IBAction func searchClick(_ sender: UIButton) {
        let searchUrl = "http://api.geonames.org/searchJSON?username=jgeraldo&country=\(searchInput.text ?? "")"
        
        Alamofire.request(searchUrl).responseJSON { response in
            if let result = response.result.value as? [String : AnyObject] {
                let cities = result["geonames"] as! [AnyObject]
                
                var createdCities : [City] = []
                for c in cities {
                    let city = c as! [String : Any]
                    createdCities.append(City(name: city["name"] as! String, population: city["population"] as! Int, lat: city["lat"] as! String, lng: city["lng"] as! String))
                }
                AppDelegate.cities = createdCities
                self.citiesTableView.reloadData()
            }
        }
    }
    
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
        AppDelegate.cities = []
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
