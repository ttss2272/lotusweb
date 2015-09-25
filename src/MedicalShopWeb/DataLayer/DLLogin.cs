using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace DataLayer
{
    public class DLLogin
    {
        SqlConnection con = new SqlConnection();
        DBConnection conn = new DBConnection();

        public DataSet UserLogin(string LoginName, string Password)
        {
            DataSet SessionInfo = null;
            con = conn.GetConnection();
            SqlCommand cmd = new SqlCommand("UserLogin_USP", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@LoginName", LoginName);
            cmd.Parameters.AddWithValue("@Password", Password);

            con.Open();

            SqlDataAdapter daSessionData = new SqlDataAdapter(cmd);
            SessionInfo = new DataSet();
            daSessionData.Fill(SessionInfo);


            con.Close();
            return SessionInfo;

        }
    }
}
