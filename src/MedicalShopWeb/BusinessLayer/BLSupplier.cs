using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
   public class BLSupplier
    {
       DLSupplier objSupplier = new DLSupplier();
        public string SaveSupplier(int SupID, string SupplierName, string CompanyName, string ContactNo, int CityID, string Area, string Address, string ModeOfTransport, string PriceType, int IsActive, int UpdatedByUserID)
        {
            string result = null;
            result = objSupplier.SaveSupplier(SupID, SupplierName, CompanyName, ContactNo, CityID, Area, Address, ModeOfTransport, PriceType, IsActive, UpdatedByUserID);
            return result;
        }

        //Function for bind supplier  to dropdown
        public DataSet BindSupplier(int SupplierID)
        {
            DataSet dsSupplier = objSupplier.BindSupplier(SupplierID);
            return dsSupplier;
        }

              //Bind Grid View
        public DataSet GetSupplier(int SupplierID)
        {
            DataSet dsSupplier = objSupplier.GetSupplier(SupplierID);
            return dsSupplier;
        }
       //get Details form for edit
        public DataSet GetSupplierDetail(int SupplierID)
        {
            DataSet dsSupplier = objSupplier.GetSupplierDetail(SupplierID);
            return dsSupplier;
        }
    }
}
