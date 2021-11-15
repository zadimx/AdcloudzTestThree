//
//  TableViewController.swift
//  TestThree
//
//  Created by Zinovatny Maksym on 27.10.2021.
//

import UIKit

class TableViewController: UITableViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  var objectOtherTableViewCellModel = [
    Other(dateLabel: "1 min ago", historyLabel: "history1", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON1", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "2 min ago", historyLabel: "history2", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON2", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg"),
    Other(dateLabel: "3 min ago", historyLabel: "history3", descriptionNewsTextView: "Привет, это тестовый TextView Он будет стоять до парсинга JSON3", imageNews: "https://images.ua.prom.st/1954375335_w640_h640_dokshelter-alyuteh-dsf.jpg")
  ]
  let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=0af1fbd249a447148be5eb4a3a6a6368"
  
  let networkService = NetworkService()
  var searchPerson: Root? = nil
  

  
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
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
  }

  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    if indexPath.row == objectOtherTableViewCellModel.count-1 && indexPath.row<=10{
      networkService.request(urlString: urlString) {[weak self]/*утечка данных*/ (result) in
          switch result {

          case .success(let searchPerson):
              self?.searchPerson = searchPerson
            self?.objectOtherTableViewCellModel.append(Other(dateLabel: searchPerson.articles[indexPath.row].publishedAt ?? "", historyLabel: searchPerson.articles[indexPath.row].publishedAt ?? "", descriptionNewsTextView: searchPerson.articles[indexPath.row].content ?? "", imageNews: searchPerson.articles[indexPath.row].urlToImage ?? ""))
            
            collectionView.reloadData()
            self!.tableView.reloadData()
            case .failure(let error):
                print("error", error)
          }
      }

    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.performSegue(withIdentifier: "identifierMainDetal", sender: indexPath)
    
  }
  @IBOutlet var collectionView: UICollectionView!
  
  @IBOutlet var mainTableView: UITableView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    networkService.request(urlString: urlString) {[weak self]/*утечка данных*/ (result) in
        switch result {

        case .success(let searchPerson):
            self?.searchPerson = searchPerson
          print("$$$ \(searchPerson.articles[0].title)")
          self?.objectOtherTableViewCellModel = [Other(dateLabel: searchPerson.articles[0].publishedAt ?? "", historyLabel: searchPerson.articles[0].publishedAt ?? "", descriptionNewsTextView: searchPerson.articles[0].content ?? "", imageNews: searchPerson.articles[0].urlToImage ?? ""),Other(dateLabel: searchPerson.articles[1].publishedAt ?? "", historyLabel: searchPerson.articles[1].publishedAt ?? "", descriptionNewsTextView: searchPerson.articles[1].content ?? "", imageNews: searchPerson.articles[1].urlToImage ?? ""),Other(dateLabel: searchPerson.articles[2].publishedAt ?? "", historyLabel: searchPerson.articles[2].publishedAt ?? "", descriptionNewsTextView: searchPerson.articles[2].content ?? "", imageNews: searchPerson.articles[2].urlToImage ?? "")]
          case .failure(let error):
              print("error", error)
        }
    }
    collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
    collectionView.delegate = self
    collectionView.dataSource = self
    
    
    tableView.reloadData()
    tableView.reloadInputViews()
    
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    super.prepare(for: segue, sender: sender)
    if segue.identifier == "indentifierOtherDetailsNews"{
    let indexPath = tableView.indexPathForSelectedRow!
    let objectOtherNews = objectOtherTableViewCellModel[indexPath.row]
    let navigationViewController = segue.destination as! OtherNewsDetailsViewController
      navigationViewController.otherDetailsObject = objectOtherNews
  }
    if segue.identifier == "identifierMainDetal"{
      let navigationViewController = segue.destination as! OtherNewsDetailsViewController
      let indexPath = collectionView.indexPathsForSelectedItems!
      let index = indexPath[0]
      let element = index[1]
      navigationViewController.otherDetailsObject = objectOtherTableViewCellModel[element]
  }
    
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

  override open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
      if indexPath.row == objectOtherTableViewCellModel.count-1 && indexPath.row<=10 {
        networkService.request(urlString: urlString) {[weak self]/*утечка данных*/ (result) in
            switch result {

            case .success(let searchPerson):
                self?.searchPerson = searchPerson
              self?.objectOtherTableViewCellModel.append(Other(dateLabel: searchPerson.articles[indexPath.row].publishedAt ?? "", historyLabel: searchPerson.articles[indexPath.row].publishedAt ?? "", descriptionNewsTextView: searchPerson.articles[indexPath.row].content ?? "", imageNews: searchPerson.articles[indexPath.row].urlToImage ?? ""))
              print("@@@@@@@ \(self!.objectOtherTableViewCellModel.count)")
              tableView.reloadData()
              case .failure(let error):
                  print("error", error)
            }
        }

      }
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
