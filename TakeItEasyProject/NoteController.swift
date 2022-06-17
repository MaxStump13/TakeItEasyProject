//
//  NoteController.swift
//  TakeItEasy
//
//  Created by Jacob on 6/8/22.
//

import UIKit
import CoreData

class NoteController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchDisplayDelegate {
    
    var filter: [String] = [] //store for table data, variable exists in order to allow for search
    var table = DbHandler.dbHandler.retrieveAllNote() //primary container for note core-data
    
    @IBOutlet weak var search: UISearchBar!
    @IBOutlet weak var tv: UITableView!
    
    //get the size of the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filter.count
    }
    
    //loads cells with the title of each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = filter[indexPath.row]
        return cell
    }
    
    //provides functionality to cells.  display appropriate journal entry on click
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Note", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content") as! NoteContent
        note.header = filter[indexPath.row]
        note.body = DbHandler.dbHandler.retrieveNote(title: note.header).body!
        self.navigationController?.pushViewController(note, animated: true)
        //self.present(note, animated: true)
    }
    
    //provides table with delete function
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            let row = indexPath.row
            let val = (tableView.cellForRow(at: indexPath)?.textLabel?.text)! //provides the text inside of table cell
            filter.remove(at: row)
            DbHandler.dbHandler.removeNote(title: val)
            tableView.deleteRows(at: [indexPath], with: .left)
            tv.reloadData()
        }
        
    }
    
    //when text in search bar is altered table is updated, filtered and sent back to the tableview
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filter.removeAll()
        table = DbHandler.dbHandler.retrieveAllNote()
        if search.text != ""{
            for i in table{
                if i.title!.lowercased().contains(search.text!.lowercased()){
                    print("a")
                    print(i.title)
                    filter.append(i.title!)
                }
            }
            tv.reloadData()
        }
        else{
            for i in table{
                print("b")
                filter.append(i.title!)
            }
            tv.reloadData()
        }
        print(filter)
    }
    
    //when view reappears, tables are reloaded to affect changes
    override func viewDidAppear(_ animated: Bool) {
        table = DbHandler.dbHandler.retrieveAllNote()
        filter.removeAll()
        for i in table{
            filter.append(i.title!)
        }
        tv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //creates new cell entry on button click
    @IBAction func add(_ sender: Any) {
        DbHandler.dbHandler.createNote(title: "new", body: "notes for you")
        let storyboard = UIStoryboard(name: "Note", bundle: nil)
        let note = storyboard.instantiateViewController(withIdentifier: "content") as! NoteContent
        note.header = "new"
        note.body = "notes for you"
        self.navigationController?.pushViewController(note, animated: true)
        tv.reloadData()

    }
}
