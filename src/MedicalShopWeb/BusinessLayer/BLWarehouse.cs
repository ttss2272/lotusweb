using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLWarehouse
    {
        DLWarehouse objWarehouse = new DLWarehouse();
         public string SaveWarehosue(int WarehouseID,string WarehouseName,string Location,int UpdatedByUserID,int IsActive)
        {
            string Result = objWarehouse.SaveWarehosue(WarehouseID, WarehouseName, Location, UpdatedByUserID, IsActive);
            return Result;
        }

         public DataSet GetWarehouse(int WarehouseID,int IsActive)
         {
             DataSet dsWarehouse = objWarehouse.GetWarehouse(WarehouseID,IsActive);
             return dsWarehouse;
         }

         public DataSet BindWarehouse(int WarehouseID, int IsActive)
         {
             DataSet dsWarehouse = objWarehouse.BindWarehouse(WarehouseID,IsActive);
             return dsWarehouse;
         }
    }
}
