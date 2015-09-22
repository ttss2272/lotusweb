using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLMedicalShop
    {
        DLMedicalShop objMedicalShop = new DLMedicalShop();

        public DataSet GetShopType()
        {
            DataSet dsShopType = objMedicalShop.GetShopType();
            return dsShopType;
        }
    }
}
