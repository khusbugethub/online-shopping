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
public class CustIDBean {
    String id = "";
    ResultSet rs = null;
    Connection con = null;
    Statement st = null;
    public CustIDBean()
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

            st = con.createStatement();
        }
        catch(Exception e){}
    }
    public void setID(String cid)
    {
        try
        {
            st.executeUpdate("delete from caaid");
            st.executeUpdate("insert into caaid values('" + cid + "')");
        }
        catch(Exception e){}
    }
    public String getID()
    {
        try
        {
            rs = st.executeQuery("select id from caaid");
            while(rs.next())
            {
                id = rs.getString("id");
            }
        }catch(Exception e){}
        return(id);
    }

}
