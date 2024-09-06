/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package caacomp;
import java.sql.*;

/**
 *
 * @author Admin
 */
public class UserAuthentication {
     String empid;
        String s1;
        String s2;
        String s3;
        boolean f=false;
        int usertype=0;
        Statement st=null;
        Statement st1 = null;
        Connection con=null;
        String pwd;
         ResultSet rs=null;
         ResultSet rs1 = null;
        public UserAuthentication()
        {
           try
          {
              Class.forName("oracle.jdbc.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");

            }
          catch(Exception e){}
        }
        public void userCreation(String name,int age,String doj,String address,long pno)
        {
            Registration r=new Registration();
            int id=0;
            r.genPwd();
            pwd = r.getPwd();
           
            try
            {
         
                st = con.createStatement();
                rs=st.executeQuery("select caaempidseq.nextval from dual");
                while(rs.next())
                {
                      id=Integer.parseInt(rs.getString(1));
        
                }
            }catch(Exception e){}
            empid = "CAAEMP" + id;
            try
            {
         
                    st1 = con.createStatement();
                    st1.executeUpdate("insert into caaemp values('" + empid + "','" + name + "'," + age + ",'15-Mar-2014','" + address + "'," + pno + ")");
                    st1.executeUpdate("insert into caalogin values('" + empid + "','" + pwd + "','USER')");
            }
            catch(Exception e)
            {
                System.out.println(e);
            }
          }
        public String getEmpid()      
        {
            return(empid);
        }
        public String getEmppwd()
        {
            return(pwd);
        }
        
        public int deleteUser(String eid)
        {
            //ResultSet rs=null;
            int rc=0;
            try
            {
                st = con.createStatement();
                rs1 = st.executeQuery("select * from caalogin where username = '" + eid + "'");
                while(rs1.next())
                {
                   // rs.deleteRow();e
                    st.executeUpdate("delete from caalogin where username='"+eid+"'");
                    st.executeUpdate("delete from caaemp where empid = '"+ eid + "'");
                    rc++;
                }
           }
            catch(Exception e)
            {
            System.out.println(e);
            }
            return(rc);
        }
        
        public int modifyUser(String name,String opwd,String npwd)
        {
            int res=0;
            try
            {
                st=con.createStatement();
                rs=st.executeQuery("select * from caalogin where username='"+name+"'");
                while(rs.next())
                {
                    res=1;
                    s1=rs.getString("username");
                    s2=rs.getString("password");
                    if((name.equals(s1)) && (opwd.equals(s2)))
                    {
                        st.executeUpdate("update caalogin set password ='"+npwd+"' where username='"+name+"'");
                        res=2;
                    }
                            
                }
            }
            catch(Exception e){}
            return(res);
        }    
        
        
        
        
    public int userAuthentication(String uname, String pwd)
    {
        
        ResultSet rs = null;
        try
        {
                st = con.createStatement();
            rs = st.executeQuery("select * from caalogin");
            while(rs.next())
            {
                s1 = rs.getString("username");
                s2 = rs.getString("password");
                s3 = rs.getString("logintype");
                System.out.println(s3);
                if((uname.equals(s1)) && (pwd.equals(s2)))
                {
                   if(s3.equals("CLIENT"))
                       usertype = 3;
                   else if(s3.equals("USER"))
                       usertype = 2;
                   else
                        usertype = 1;
                   f = true; 
                   break; 
                 }
                 else
                    {    f = false; }
            }
        }
        catch(Exception e){}
        try
        {
            rs.close();
        }
        catch(Exception e){}
        return(usertype);
    }
    
}
