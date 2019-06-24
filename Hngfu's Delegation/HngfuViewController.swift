//
//  HngfuViewController.swift
//  Hngfu's Delegation
//
//  Created by 조재흥 on 19. 6. 22..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

/// 위임 받아서 일을 수행하는 대상
class HngfuViewController: UIViewController {
    @IBOutlet weak var hngfuTableView: UITableView! /// 위임자
    @IBOutlet weak var hngfuTableTitle: UINavigationItem!
    private let player = AudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "흥지우의 포켓몬 도감"
        self.hngfuTableTitle.title = self.title
        hngfuTableView.dataSource = self        /// 위임자 (View)의 delegate(dataSource도 delegate의 일종)로 자기자신을 할당한다.
                                                /// tableView는 특별히 dataSource와 delegate 두개의 delegate를 갖는다.
                                                /// dataSource는 실질적인 data, delegate는 그리는 대상에 대한 정보를 다룬다.
                                                /// 대상의 책임에 따라 여러 개의 delegate를 사용할 수 있다.
        hngfuTableView.delegate = self          /// 위임자 (View)의 delegate로 자기자신을 할당한다.
    }
    
    @IBAction func tapCloseButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}

/// UITableViewDataSource 프로토콜은 다음 두 함수를 구현해야 한다.
extension HngfuViewController: UITableViewDataSource {
    /// Table을 형성하는 섹션의 갯수를 알아야 한다.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonsInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hngfu", for: indexPath)
        guard let hngfuCell = cell as? HngfuTableViewCell else {
            return cell
        }
        hngfuCell.show(with: pokemonsInfo[indexPath.row])
        return hngfuCell
    }
}

extension HngfuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    /// 어떤 row가 선택되었는지 indexPath에 들어온다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = pokemonsInfo[indexPath.row].name
        player.play(with: name)
    }
}
