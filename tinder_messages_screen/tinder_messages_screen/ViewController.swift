//
//  ViewController.swift
//  tinder_messages_screen
//
//  Created by Jonathan Pizzurro on 5/14/19.
//  Copyright © 2019 Jonathan Pizzurro. All rights reserved.
//

import LBTATools

struct Match {
    let imageName, username: String
}

class MatchCell: LBTAListCell<Match> {
    
    let imageView = CircularImageView(width: 80, image: UIImage(named: "girl"))
    let nameLabel = UILabel(text: "User name", font: .boldSystemFont(ofSize: 14), numberOfLines: 2)
    
    override var item: Match! {
        didSet {
            imageView.image = UIImage(named: item.imageName)
            nameLabel.text = item.username
            
            stack(imageView,
                  nameLabel,
                  spacing: 4,
                  alignment: .center)
        }
    }
}

class MatchesController: LBTAListController<MatchCell, Match>, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            .init(imageName: "girl", username: "Bobby Bobster"),
            .init(imageName: "kpop", username: "Kpop girl")
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 100, height: view.frame.height)
    }
}

class Header: UICollectionReusableView {
    
    let newMatchesLabel = UILabel(text: "New Matches", font: .boldSystemFont(ofSize: 14), textColor: #colorLiteral(red: 0.9826290011, green: 0.2883806527, blue: 0.399230808, alpha: 1))
    
    let matchesController = MatchesController(scrollDirection: .horizontal)
    
    let messagesLabel = UILabel(text: "Messages", font: .boldSystemFont(ofSize: 14), textColor: #colorLiteral(red: 0.9826290011, green: 0.2883806527, blue: 0.399230808, alpha: 1))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stack(hstack(newMatchesLabel).padLeft(16),
              matchesController.view,
              hstack(messagesLabel).padLeft(16),
              spacing: 12).padTop(16)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}

//LBTAListController<MessageCell, Message>

class MessagesController: LBTAListHeaderController<MessageCell, Message, Header>, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 180)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        
        items = [
            .init(userProfileImageName: "girl", username: "Girly McGriddle", text: "Let's go to Mcdonalds and grab a sandwich girl."),
            .init(userProfileImageName: "girl", username: "1 2", text: "I hear wendy's is a better fast food chain"),
            .init(userProfileImageName: "girl", username: "3 4", text: "No it's not"),
        ]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 100)
    }
}
