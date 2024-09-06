/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caacomp;
import java.sql.*;
/**
 *
 * @author Pachayappan
 */
public class Media {
 Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    ResultSet rs1=null;
    ResultSet r2=null;
    //String mid="";
    public Media()
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

            st=con.createStatement();
        }
        catch(Exception e){}
    }   
    public int addMedia(String mid,String mname,String mlang,String mcperson,long mphno,String maddr,String memail,long mfax)
    {
        int res=0;
        String medadvid="";
        try
        {
            rs=st.executeQuery("select count(*) from caameddetails where medadvname='"+mname+"' and medlang='"+mlang+"'");
            while(rs.next())
            {
               if(Integer.parseInt(rs.getString(1))>0) res++;
            }
        }
        catch(Exception e){}
        if(res>0) return(res);
        
        if(res==0)
        {
        /*    try
            {
                st = con.createStatement();
                rs1=st.executeQuery("select mediaid from caamedmast where medtype='"+mtype+"'");
                //while(rs1.next())
                //{
                    mid=rs1.getString("mediaid");
                
               // }
                
            }   
            catch(Exception e){}*/
            try
            {
                r2=st.executeQuery("select caamedadvseq.nextval from dual");
                while(r2.next())
                {
                    medadvid=r2.getString(1);
                    
                }
    //            if(mtype.equals("TV"))
      //          {
                    //mid = "CAAMED1001";
                    st.executeUpdate("insert into caameddetails values('" + mid + "','CAAMEDID"+medadvid+"','"+mname+"','"+mlang+"','"+mcperson+"',"+mphno+",'"+maddr+"','"+memail+"',"+mfax+",0)");
                    //st.executeUpdate("update caameddetails set medid='CAAMED1001' where medadvid = 'CAAMEDID" + medadvid +"'");
        //        }
          //      else
            //    {
                    //mid = "CAAMED1002";
                //    st.executeUpdate("insert into caameddetails values('" + mid + "','CAAMEDID"+medadvid+"','"+mname+"','"+mlang+"','"+mcperson+"',"+mphno+",'"+maddr+"','"+memail+"',"+mfax+",0)");
                    //st.executeUpdate("update caameddetails set medid='CAAMED1002' where medadvid = 'CAAMEDID" + medadvid +"'");
              //  }   
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
        }
        return(res);
    }
    public void updateTVCharges(String lname, long r1, long r2, long r3)
    {
        try
        {
            st.executeUpdate("update caatvcharge set ratescroll=" + r1 + ", rateanim=" + r2 + ", ratevideo=" + r3 + " where langname = '" + lname + "'");
        }
        catch(Exception e){}
    }
    public void updateNPCharges(String lname, int r, int p1, int p2, int p3, int p4)
    {
        try
        {
            st.executeUpdate("update caanpcharge set ratepsqcm = " + r + ", page1per = " + p1 + ", page3 = " + p2 + ", pagemid = " + p3 + ", pagelast = " + p4 + " where langname = '" + lname + "'");
        }
        catch(Exception e){}
    }

   
}
