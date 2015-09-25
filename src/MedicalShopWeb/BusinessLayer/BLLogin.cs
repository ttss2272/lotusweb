using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLLogin
    {
        DLLogin objLogin= new DLLogin();
        public DataSet UserLogin(string LoginName, string Password)
        {
            DataSet SessionInfo = objLogin.UserLogin(LoginName, Password);
            return SessionInfo;
        }
    }

}
