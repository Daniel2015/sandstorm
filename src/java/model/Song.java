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
public class Song {
    private int song_id;
    private String artist;
    private String songName;
    private String genre;
    private String album;
    private int year;
    private String fileLocation;
    private String name;
    
    public int getSongId(){
        return this.song_id;
    }
    
    public void setSongId(int song_id){
        this.song_id=song_id;
    }
    
    public String getArtist(){
        return this.artist;
    }
    
    public void setArtist(String artist){
        this.artist=artist;
    }
    
    public String getSongName(){
        return this.songName;
    }
    
    public void setSongName(String songName){
        this.songName=songName;
    }
    
    public String getGenre(){
        return this.genre;
    }
    
    public void setGenre(String genre){
        this.genre=genre;
    }
    
    public String getAlbum(){
        return this.album;
    }
    
    public void setAlbum(String album){
        this.album=album;
    }
    
    public int getYear(){
        return this.year;
    }
    
    public void setYear(int year){
        this.year=year;
    }
    
    public String getFileLocation(){
        return this.fileLocation;
    }
    
    public void setFileLocation(String fileLocation){
        this.fileLocation=fileLocation;
    }
    
    public String getName(){
        return this.name;
    }
    
    public void setName(String name){
        this.name=name;
    }
}
