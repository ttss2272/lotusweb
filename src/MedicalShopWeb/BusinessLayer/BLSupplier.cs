﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
    }
}