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
        public DataSet GetProductType(int ProductID, int IsActive)
        {
            DataSet dsProductType = objProductType.GetProductType(ProductID, IsActive);
            return dsProductType;
        }
    }
}
