//
//  ViewController.swift
//  Ayaulym_MusicPlayer
//
//  Created by Аяулым Куат on 09.11.2025.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var tracks: [Track] = [
        Track(title: "Song 1", artist: "Artist 1", coverImageName: "cover1", audioFileName: "track1"),
        Track(title: "Song 2", artist: "Artist 2", coverImageName: "cover2", audioFileName: "track2"),
        Track(title: "Song 3", artist: "Artist 3", coverImageName: "cover3", audioFileName: "track3"),
        Track(title: "Song 4", artist: "Artist 4", coverImageName: "cover4", audioFileName: "track4"),
        Track(title: "Song 5", artist: "Artist 5", coverImageName: "cover5", audioFileName: "track5")
    ]
    
    var currentTrackIndex = 0
    var audioPlayer: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTrack(at: currentTrackIndex)
    }


    
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        guard let player = audioPlayer else { return }
        
        if player.isPlaying {
            player.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: .normal)
        } else {
            player.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    @IBAction func previousTapped(_ sender: UIButton) {
        currentTrackIndex = currentTrackIndex > 0 ? currentTrackIndex - 1 : tracks.count - 1
        loadTrack(at: currentTrackIndex)
        audioPlayer?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }

    @IBAction func nextTapped(_ sender: UIButton) {
        currentTrackIndex = currentTrackIndex < tracks.count - 1 ? currentTrackIndex + 1 : 0
        loadTrack(at: currentTrackIndex)
        audioPlayer?.play()
        playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: .normal)
    }

    // UI components will go here
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    func loadTrack(at index: Int) {
        let track = tracks[index]
        
        // Update UI
        trackTitleLabel.text = track.title
        coverImageView.image = UIImage(named: track.coverImageName)
        
        // Load audio
        if let url = Bundle.main.url(forResource: track.audioFileName, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.prepareToPlay()
            } catch {
                print("Error loading track: \(error)")
            }
        }
    }

    
   
}

