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
public class NPList {
    protected Hashtable items = new Hashtable();
    int[][] charges = new int[3][5];
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
        rs = st.executeQuery("select ratepsqcm, page1per, page3, pagemid, pagelast from caanpcharge");
        while(rs.next())
        {
            for(j=0;j<5;j++)
                charges[i][j] = rs.getInt(j+1);
            i++;
        }
    }catch(Exception e){}
    }
    
    public void addItem(String itemId, String itemName, String p1, String p3, String pmid, String plast, String pother,int size, String language)
    {
        String[] item = {itemId,itemName,p1,p3,pmid,plast,pother,Integer.toString(size),language};
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
                int sz=0;
                procCharges();
		while(e.hasMoreElements())
		{
                        cost = 0.00f;
			tmpItem = (String[])e.nextElement();
                        if(tmpItem[8].equals("ENGLISH"))
                            index = 0;
                        else if(tmpItem[8].equals("HINDI"))
                            index = 1;
                        else
                            index = 2;
                        sz = Integer.parseInt(tmpItem[7]);
                        if(tmpItem[6] != null)
                            cost += sz * charges[index][0];
                        if(tmpItem[2] != null)
                            cost += (sz * charges[index][0]) + ((sz * charges[index][0]) * (charges[index][1]/100));
                        if(tmpItem[3] != null)
                            cost += (sz * charges[index][0]) + ((sz * charges[index][0]) * (charges[index][2]/100));
                        if(tmpItem[4] != null)
                            cost += (sz * charges[index][0]) + ((sz * charges[index][0]) * (charges[index][3]/100));
                        if(tmpItem[5] != null)
                            cost += (sz * charges[index][0]) + ((sz * charges[index][0]) * (charges[index][4])/100);
			totalCost += cost;
		}
		return totalCost;
    }
    public int getNumOfItems()
    {
        return 0;
    }

}
