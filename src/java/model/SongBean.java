/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel
 */
public class SongBean {

    private static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private static final String DATABASE_URL = "jdbc:derby://localhost:1527/sandstorm_db";
    private static final String USERNAME = "admin1";
    private static final String PASSWORD = "admin";

    public void add(Song s) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            pstmt = con.prepareStatement("INSERT INTO SONGSET (SONG_NAME, ARTIST_NAME, SONG_GENRE, SONG_ALBUM, SONG_YEAR, FILE_LOCATION, NAME) VALUES(?, ?, ?, ?, ?, ?, ?)");
            pstmt.setString(1, s.getSongName());
            pstmt.setString(2, s.getArtist());
            pstmt.setString(3, s.getGenre());
            pstmt.setString(4, s.getAlbum());
            pstmt.setInt(5, s.getYear());
            pstmt.setString(6, s.getFileLocation());
            pstmt.setString(7, s.getName());
            pstmt.execute();
        } catch (SQLException | ClassNotFoundException ex) {

        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SongBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public List<songView> getPlaylist(int user_id) {
        List<songView> list = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM SONGSET INNER JOIN PLAYLISTSONGS ON SONGSET.SONG_ID=PLAYLISTSONGS.SONG_ID WHERE PLAYLISTSONGS.PLAYLIST_ID=" + user_id + " ORDER BY SONGSET.SONG_ID");
            while (rs.next()) {
                songView song = new songView();
                song.setTitle(rs.getString("NAME"));
                song.setMp3(rs.getString("FILE_LOCATION"));
                list.add(song);
            }
        } catch (SQLException | ClassNotFoundException ex) {

        } finally {
            try {
                if (stmt != null) {
                    stmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException ex) {

            }
        }
        return list;
    }

        public class songView {

        private String title;
        private String mp3;
        
        public String getTitle(){
            return this.title;
        }
        public void setTitle(String title){
            this.title=title;
        }
        
        public String getMp3(){
            return this.mp3;
        }
        
        public void setMp3(String mp3){
            this.mp3=mp3;
        }
        
    }
    public void delete(int id) {

    }

    public void update(Song s) {

    }

//    public Song getSong(int id) {
//
//    }
//
//    public List<Song> getSongs() {
//
//    }
}
