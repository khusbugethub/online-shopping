/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caacomp;
import java.sql.*;
import java.util.*;
import java.io.*;
/**
 *
 * @author Admin
 */
public class Registration {
     String cid,cname,cpername,caddr,cemail,cpwd="";
    long cphno,cpin,cfax;
    public Registration(){}
    public Registration(String cname, String cpername, String caddr,String cemail, long cphno, long cpin, long cfax)
    {
        this.cname = cname;
        this.cpername = cpername;
        this.caddr = caddr;
        this.cemail = cemail;
        this.cphno = cphno;
        this.cfax = cfax;
        this.cpin = cpin;
          
    }
    public String getUserID()
    {
        return(cid);
    }
    public String getPwd()
    {
        return(cpwd);
    }
    public void writeCustDetails()
    {
      ResultSet rs=null;
     // ResultSet rs1 =null;
      String s="";
    try{
    Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

    Statement st=con.createStatement();
    rs=st.executeQuery("select caacustidseq.nextval from dual");
    while(rs.next())
    {
        s=rs.getString(1);
        
    }
    cid = "CAACUST" + s;
    st.executeUpdate("insert into caacustomers values('" + cid + "','" + cname + "','" + cpername + "'," + cphno + ",'" + caddr + "'," + cpin + ",'" + cemail + "'," + cfax + ",'O', 0)" );
    st.executeUpdate("insert into caalogin values('" + cid + "','" + cpwd + "','CLIENT')");
    String dname = "D:\\OMSAIRAM\\CLIENTS\\" + cid;
   File f = new File(dname);
   f.mkdir();
    }
 catch(Exception e){}
      try{
          rs.close();
          
      }
      catch(Exception e){}
       
    }
    
    public void genPwd()
    {
        String alpha="abcdefghijklmnopqrstuvwxyz";
        String numerals="0123456789";
        Random r=new Random();
      //  String pwd="";
        for(int i=0;i<7;i++)
        {
            cpwd+=alpha.charAt(r.nextInt(25));
        }
        for(int i=0;i<5;i++)
        {
            cpwd+=numerals.charAt(r.nextInt(10));
        }
      }
    

}
