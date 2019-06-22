//
//  HngfuViewController.swift
//  Hngfu's Delegation
//
//  Created by 조재흥 on 19. 6. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class HngfuViewController: UIViewController {
    @IBOutlet weak var hngfuTableView: UITableView!
    private let player = AudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hngfuTableView.dataSource = self
        self.hngfuTableView.delegate = self
    }
    
    @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension HngfuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hngfu", for: indexPath)
        guard let hngfuCell = cell as? HngfuTableViewCell else { return cell }
        hngfuCell.show(with: pokemonsInfo[indexPath.row])
        return hngfuCell
    }
}

extension HngfuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = pokemonsInfo[indexPath.row].name
        player.play(with: name)
    }
}

