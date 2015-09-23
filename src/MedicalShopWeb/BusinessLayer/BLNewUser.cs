using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLNewUser
    {
        DLNewUser objNewUser = new DLNewUser();
        public DataSet BindUserType()
        {
            DataSet dsUserType = objNewUser.BindUserType();
            return dsUserType;
        }

        public string CheckLoginName(string LoginName)
        {
            string Result = objNewUser.CheckLoginName(LoginName);
            return Result;
        }

         public string SaveUser(int UserID, string UserName, int UserTypeID, string EmailID, string ContactNo, int CityID, string Area, string Address, int WarehouseID, string LoginName, string Password, int UpdatedByUserID, int IsActive)
        {
            string Result = objNewUser.SaveUser(UserID, UserName, UserTypeID, EmailID, ContactNo, CityID, Area, Address, WarehouseID, LoginName, Password, UpdatedByUserID, IsActive);
            return Result;
            }
    }
}
