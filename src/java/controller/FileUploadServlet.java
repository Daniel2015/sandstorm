/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Song;
import model.SongBean;

/**
 *
 * @author Daniel
 */
@WebServlet(name = "FileUploadServlet", urlPatterns = {"/upload"})
@MultipartConfig(location = "C:\\Users\\Shy\\documents\\NetBeansProjects\\sandstorm\\web\\tmp")
public class FileUploadServlet extends HttpServlet {

    private final static Logger LOGGER
            = Logger.getLogger(FileUploadServlet.class.getCanonicalName());

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");

        final String pathSong = "C:\\Users\\Shy\\Documents\\NetBeansProjects\\sandstorm\\web\\songs";
        final String pathPoster = "C:\\Users\\Shy\\Documents\\NetBeansProjects\\sandstorm\\web\\posters";
        final String songName = request.getParameter("songName");
        final String artist = request.getParameter("artist");
        final Part filePart = request.getPart("file");
        final Part posterPart = request.getPart("poster");
        String extensionSong = "";
        String extensionPoster = "";
        int i = getFileName(filePart).lastIndexOf('.');
        if (i > 0) {
            extensionSong = "." + getFileName(filePart).substring(i + 1);
        }
        final String fileName = artist + " - " + songName + extensionSong;
        
        
        String posterName = "";
        if ("".equals(getFileName(posterPart))) {
         posterName = "../img/sandstorm_default.jpg"; 
        } else {
            int j = getFileName(posterPart).lastIndexOf('.');

            if (j > 0) {
                extensionPoster = "." + getFileName(posterPart).substring(j + 1);
            }
       posterName = artist + " - " + songName + extensionPoster;
        }


  
        OutputStream outSong = null;
        OutputStream outPoster = null;
        InputStream filecontent = null;
        InputStream postercontent = null;
        final PrintWriter writer = response.getWriter();

        try {
            outSong = new FileOutputStream(new File(pathSong + File.separator
                    + fileName));
            filecontent = filePart.getInputStream();

            int read = 0;
            final byte[] bytes = new byte[1024];

            while ((read = filecontent.read(bytes)) != -1) {
                outSong.write(bytes, 0, read);
            }

            outPoster = new FileOutputStream(new File(pathPoster + File.separator
                    + posterName));
            postercontent = posterPart.getInputStream();

            int readPoster = 0;
            final byte[] bytesPoster = new byte[1024];

            while ((readPoster = postercontent.read(bytesPoster)) != -1) {
                outPoster.write(bytesPoster, 0, readPoster);
            }

            Song song = new Song();
            song.setArtist(request.getParameter("artist"));
            song.setSongName(request.getParameter("songName"));
            song.setGenre(request.getParameter("songGenre"));
            song.setAlbum(request.getParameter("songAlbum"));
            song.setYear(Integer.parseInt(request.getParameter("songYear")));
            song.setFileLocation("songs/" + fileName);
            song.setName(request.getParameter("artist") + " - " + request.getParameter("songName"));
            song.setPoster("posters/" + posterName);
            SongBean sb = new SongBean();
            sb.add(song);
            response.sendRedirect(request.getContextPath());

        } catch (FileNotFoundException fne) {
            writer.println("You either did not specify a file to upload or are "
                    + "trying to upload a file to a protected or nonexistent "
                    + "location.");
            writer.println("<br/> ERROR: " + fne.getMessage());

            LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}",
                    new Object[]{fne.getMessage()});
        } finally {

            if (outSong != null) {
                outSong.close();
            }
            if (filecontent != null) {
                filecontent.close();
            }
            if (outPoster != null) {
                outPoster.close();
            }
            if (postercontent != null) {
                postercontent.close();
            }
            if (writer != null) {
                writer.close();
            }
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
