using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLCity
    {
        DLCity objCity = new DLCity();
        public string SaveCity(int CityID, string CityName, int StateID, int UpdatedByUserID, int IsActive)
        {
            string Result = objCity.SaveCity(CityID, CityName, StateID, UpdatedByUserID, IsActive);
            return Result;
        }

        public DataSet GetCity(int CityID, int IsActive)
        {
            DataSet dsCity = objCity.GetCity(CityID, IsActive);
            return dsCity;
        }

        public DataSet BindCity(int StateID)
        {
            DataSet dsCity = objCity.BindCity(StateID);
            return dsCity;
        }
    }
}
