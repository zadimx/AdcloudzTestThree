//
//  TableViewController.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 27.10.2021.
//

import UIKit

class TableViewController: UITableViewController {
  
  let objectOtherTableViewCellModel = [
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "5 min ago", historyLabel: "history", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  override func viewDidLoad() {
    super.viewDidLoad()
    
//    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem
  }

  @IBAction func unwindSegue(segue: UIStoryboardSegue){

  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    guard segue.identifier == "indentifierOtherDetailsNews" else {return}
    let indexPath = tableView.indexPathForSelectedRow!
    let objectOtherNews = objectOtherTableViewCellModel[indexPath.row]
//    let navigationViewController = segue.description as! UINavigationController
//    let otherNewsDetailsViewController = navigationViewController.topViewController as! OtherNewsDetailsViewController
//    let otherTableViewCell = OtherTableViewCell()
//    otherNewsDetailsViewController.otherNewsDetailsDateLabel.text = otherTableViewCell.dateLabel.text
//    otherNewsDetailsViewController.otherNewsDetailsHistoryLabel.text = otherTableViewCell.historyLabel.text
//    otherNewsDetailsViewController.otherNewsDetailsImageView.image = otherTableViewCell.imageNews.image
//    otherNewsDetailsViewController.otherNewsDetailsTopicTextView.text = otherTableViewCell.descriptionNewsTextView.text
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
