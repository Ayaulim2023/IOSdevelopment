//
//  MusicViewController.swift
//  FavoritesManager
//
//  Created by Аяулым Куат on 29.11.2025.
//

import UIKit

class MusicViewController: BaseFavoritesViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        tabBarItem = UITabBarItem(title: "Music", image: UIImage(systemName: "music.note"), selectedImage: UIImage(systemName: "music.note"))
        items = MusicViewController.sampleMusic()
        tableView.reloadData()
    }

    static func sampleMusic() -> [FavoriteItem] {
        return [
            FavoriteItem(title: "Bohemian Rhapsody — Queen", description: "A multi-part rock epic that blends ballad, operatic passages, and hard rock. Timeless, theatrical masterpiece.", review: "I love this song for its complexity and emotion.", imageName: "music.note"),
            FavoriteItem(title: "Imagine — John Lennon", description: "A soft piano-driven anthem for peace and unity. One of the most influential songs in history.", review: "Always inspires me to think positively.", imageName: "music.note"),
            FavoriteItem(title: "Hotel California — Eagles", description: "Classic rock with mysterious lyrics and iconic guitar solos. Timeless storytelling.", review: "Guitar work is phenomenal.", imageName: "music.note"),
            FavoriteItem(title: "Billie Jean — Michael Jackson", description: "Funky bassline and unforgettable groove. MJ at his best.", review: "Makes me want to dance every time.", imageName: "music.note"),
            FavoriteItem(title: "Smells Like Teen Spirit — Nirvana", description: "Grunge rock defining a generation. Powerful vocals and raw energy.", review: "Always gives me energy and nostalgia.", imageName: "music.note"),
            FavoriteItem(title: "Shape of You — Ed Sheeran", description: "Catchy pop song with great rhythm. Modern chart-topper.", review: "I can’t get this melody out of my head.", imageName: "music.note"),
            FavoriteItem(title: "Stairway to Heaven — Led Zeppelin", description: "Epic rock ballad building to an iconic guitar solo. Legendary track.", review: "Every listen feels epic.", imageName: "music.note"),
            FavoriteItem(title: "Hey Jude — The Beatles", description: "Classic sing-along with emotional crescendos. Immortal Beatles hit.", review: "Always lifts my mood.", imageName: "music.note"),
            FavoriteItem(title: "Rolling in the Deep — Adele", description: "Powerful vocals and strong emotion in modern pop-soul. Brilliantly composed.", review: "Her voice gives me chills.", imageName: "music.note"),
            FavoriteItem(title: "Lose Yourself — Eminem", description: "Energetic rap with motivational lyrics. Iconic Oscar-winning track.", review: "Always pumps me up before big tasks.", imageName: "music.note")
        ]
    }
}
