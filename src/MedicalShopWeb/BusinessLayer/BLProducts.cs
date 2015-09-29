using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DataLayer;
using System.Data;
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

        public DataSet BindProduct(int ProductID)
        {
            DataSet dsProduct = objProducts.BindProduct(ProductID);
            return dsProduct;
        }       


        //public DataSet GetProductType()bbb
        //{
        //    DataSet dsProductType = objProducts.GetProductType();
        //    return dsProductType;
        //}

        public DataSet BindProductOnProductType(int ProductTypeID)
        {
            DataSet dsProduct = objProducts.BindProductOnProductType(ProductTypeID);
            return dsProduct;
        }

        public DataSet GetProductOnProductType(int ProductID, int ProductTypeID)
        {
            DataSet dsProduct = objProducts.GetProductOnProductType(ProductID, ProductTypeID);
            return dsProduct;
        }

        //get Details form for edit
        public DataSet GetProductDetail(int ProductID, int ProductTypeID)
        {
            DataSet dsProduct = objProducts.GetProductDetail(ProductID, ProductTypeID);
            return dsProduct;
        }
    }
}
