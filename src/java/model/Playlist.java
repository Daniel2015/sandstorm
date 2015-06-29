/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Daniel
 */
public class Playlist {
    private int playlistID;
    private String playlistName;
    private int songID;
    
     public int getPlaylistID(){
        return this.playlistID;
    }
    
    public void setPlaylistID(int playlistID){
        this.playlistID=playlistID;
    }
    
    public String getPlaylistName(){
        return this.playlistName;
    }
    
    public void setPlaylistName(String playlistName){
        this.playlistName=playlistName;
    }
    
    public int getSongID(){
        return this.songID;
    }
    
    public void setSongID(int songID){
        this.songID=songID;
    }
    
    
}
