using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;

namespace BusinessLayer
{
    public class BLCountry
    {
        DLCountry objCountry = new DLCountry();
        public string SaveCountry(int CountryID, string CountryName, int UpdatedByUserID, int IsActive)
        {
            string Result = null;
            Result = objCountry.SaveCountry(CountryID, CountryName, UpdatedByUserID, IsActive);
            return Result;
        }

        public DataSet GetCountry(int CountryID, int IsActive)
        {
            DataSet dsCountry = objCountry.GetCountry(CountryID, IsActive);
            return dsCountry;
        }
    }
}
