using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLState
    {
        DLState objState = new DLState();

        public string SaveState(int StateID, string StateName, int CountryID, int UpdatedByUserID, int IsActive)
        {
            string Result = objState.SaveState(StateID, StateName, CountryID, UpdatedByUserID, IsActive);
            return Result;
        }

        public DataSet GetState(int StateID, int IsActive)
        {
            DataSet dsState = objState.GetState(StateID, IsActive);
                return dsState;
        }

        public DataSet BindState(int CountryID)
        {
            DataSet dsState = objState.BindState(CountryID);
            return dsState;
        }
    }
}
