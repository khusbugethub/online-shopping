/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caacomp;
import java.sql.*;
import java.util.*;
/**
 *
 * @author Pachayappan
 */
public class TVList {
     protected Hashtable items = new Hashtable();
    int[][] charges = new int[3][3];
    public void procCharges()
    {
    ResultSet rs = null;
    Connection con = null;
    Statement st = null;
    int i=0,j=0;
    try
    {
       Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

        st = con.createStatement();
        rs = st.executeQuery("select ratescroll, rateanim, ratevideo from caatvcharge");
        while(rs.next())
        {
            for(j=0;j<3;j++)
                charges[i][j] = rs.getInt(j+1);
            i++;
        }
    }catch(Exception e){}
    }
    
    public void addItem(String itemId, String itemName, String scr, String ani, String vid, int dur, String time, String language)
    {
        String[] item = {itemId,itemName,scr,ani,vid,Integer.toString(dur),time,language};
        items.put(itemId, item);
    }
    public void removeItem(String itemId)
    {
        if(items.containsKey(itemId))
        {
            items.remove(itemId);
        }
    }
    public Enumeration getEnumeration()
    {
        return items.elements();
    }
    public float getCost()
    {
		Enumeration e = items.elements();
		String[] tmpItem;
		float totalCost = 0.00f;
                float cost=0.00f;
                int index=0;
                int min;
                procCharges();
		while(e.hasMoreElements())
		{
                        cost = 0.00f;
			tmpItem = (String[])e.nextElement();
                        if(tmpItem[7].equals("ENGLISH"))
                            index = 0;
                        else if(tmpItem[7].equals("HINDI"))
                            index = 1;
                        else
                            index = 2;
                        min = Integer.parseInt(tmpItem[5]);
                        if(tmpItem[2] != null)
                            cost += min * charges[index][0];
                        if(tmpItem[3] != null)
                            cost += min * charges[index][1];
                        if(tmpItem[4] != null)
                            cost += min * charges[index][2];
                        if(tmpItem[6].equals("Prime"))
                            cost = cost +  (cost * 0.25f);
                        
			totalCost += cost;
		}
		return totalCost;
    }
    public int getNumOfItems()
    {
        return 0;
    }


}
