using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;
namespace BusinessLayer
{
   public class BLProductType
    {
       DLProductType objProductType = new DLProductType();
        public DataSet GetProductType(int ProductTypeID, int IsActive)
        {
            DataSet dsProductType = objProductType.GetProductType(ProductTypeID, IsActive);
            return dsProductType;
        }
    }
}
