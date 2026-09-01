pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Singleton {
    id: root
    property string preferredPlayer: "org.mpris.MediaPlayer2.spotify"

    readonly property var player: {
        
        const players = Mpris.players.values
        
        if (players.length > 0 && root.preferredPlayer.length > 0) { 
            
            for (let i=0; i < players.length; i++) { 
                
                if (players[i].dbusName === root.preferredPlayer) return players[i] 
            }
        
        } else {
            return null 
        }
    }

    readonly property bool playing: player ? player.isPlaying : false 
    readonly property string title: player ? player.trackTitle : ""
    readonly property bool available: player !== null && (player.playbackState !== MprisPlaybackState.Stopped || title.length > 0) 
    readonly property bool canTogglePlaying: player ? player.canTogglePlaying : false

    function togglePlay(): void {
        if (!canTogglePlaying) return
        player.togglePlaying()
    }
}