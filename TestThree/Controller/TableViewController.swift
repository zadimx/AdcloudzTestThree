//
//  TableViewController.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 27.10.2021.
//

import UIKit

class TableViewController: UITableViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return objectOtherTableViewCellModel.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
    cell.configuration(with: objectOtherTableViewCellModel[indexPath.row])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 300, height: 800)
  }

  @IBOutlet var collectionView: UICollectionView!
  
  @IBOutlet var mainTableView: UITableView!
  let objectOtherTableViewCellModel = [
    Other(dateLabel: "1 min ago", historyLabel: "history1", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "2 min ago", historyLabel: "history2", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "4 min ago", historyLabel: "history4", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON4", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history5", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON5", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "6 min ago", historyLabel: "history6", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON6", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "7 min ago", historyLabel: "history7", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON7", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "8 min ago", historyLabel: "history8", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSO8", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "9 min ago", historyLabel: "history9", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON9", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    collectionView.delegate = self
    collectionView.dataSource = self
//    let cell1 = tableView.register(UITableViewCell.self, forCellReuseIdentifier: "qqqq") as! MainCollectionViewCell
//    cell1.img.image = UIImage(data: (try? Data(contentsOf: URL(string: objectOtherTableViewCellModel[1].imageNews)!))!)
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }


  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    guard segue.identifier == "indentifierOtherDetailsNews" || segue.identifier == "identifierMainDetal" else {return}
    let indexPath = tableView.indexPathForSelectedRow!
    let objectOtherNews = objectOtherTableViewCellModel[indexPath.row]
    let navigationViewController = segue.destination as! UINavigationController
    let otherNewsDetailsViewController = navigationViewController.topViewController as! OtherNewsDetailsViewController
    otherNewsDetailsViewController.otherDetailsObject = objectOtherNews
    
    
  }

  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return objectOtherTableViewCellModel.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "otherIdenifierCell", for: indexPath) as! OtherTableViewCell
    // Configure the cell...
    let object = objectOtherTableViewCellModel[indexPath.row]
    cell.set(object: object)
    return cell
  }

  
  /*
   // Override to support conditional editing of the table view.
   override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the specified item to be editable.
   return true
   }
   */
  
  /*
   // Override to support editing the table view.
   override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   if editingStyle == .delete {
   // Delete the row from the data source
   tableView.deleteRows(at: [indexPath], with: .fade)
   } else if editingStyle == .insert {
   // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
   }
   }
   */
  
  /*
   // Override to support rearranging the table view.
   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
   }
   */
  
  /*
   // Override to support conditional rearranging of the table view.
   override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
   // Return false if you do not want the item to be re-orderable.
   return true
   }
   */
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
