﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
namespace BusinessLayer
{
    public class BLProducts
    {
        DLProducts objProducts = new DLProducts();
        public string SaveProducts(int ProductID, int ProductTypeID, string ProductName, string batch, string code, string PurchasePrice, string SalePrice, int IsActive, int UpdatedByUserID)
        {
            string result = null;
            result = objProducts.SaveProducts(ProductID,ProductTypeID, ProductName, batch, code, PurchasePrice, SalePrice, IsActive, UpdatedByUserID);
            return result;
        }
    }
}