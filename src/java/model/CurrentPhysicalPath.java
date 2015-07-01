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
 public class CurrentPhysicalPath extends java.io.File
 {
     private static String pathname = ".";
     public CurrentPhysicalPath()
     {
         super(pathname);//
     }
     public String getResult()
     {
         return pathname;//
     }
 }