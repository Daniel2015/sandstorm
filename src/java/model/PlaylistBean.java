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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Daniel
 */
public class PlaylistBean {

    private static final String JDBC_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    private static final String DATABASE_URL = "jdbc:derby://localhost:1527/sandstorm_db";
    private static final String USERNAME = "admin1";
    private static final String PASSWORD = "admin";

    public void addNew(Playlist u) {
        Connection con = null;
        PreparedStatement pstmt = null;
        try {
            Class.forName(JDBC_DRIVER);
            con = DriverManager.getConnection(DATABASE_URL, USERNAME, PASSWORD);
            pstmt = con.prepareStatement("INSERT INTO PLAYLISTSONGS (PLAYLIST_ID, SONG_ID) VALUES(?, ?)");
            pstmt.setInt(1, u.getPlaylistID());
            pstmt.setInt(2, u.getSongID());
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
                Logger.getLogger(UserBean.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    public void delete(){
        
    }
}
