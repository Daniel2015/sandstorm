/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
            pstmt = con.prepareStatement("INSERT INTO song (songName, artistName, songGenre, songAlbum, songYear) VALUES(?, ?, ?, ?, ?)");
            pstmt.setString(1, s.getSongName());
            pstmt.setString(2, s.getArtist());
            pstmt.setString(3, s.getGenre());
            pstmt.setString(4, s.getAlbum());
            pstmt.setInt(5, s.getYear());
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
