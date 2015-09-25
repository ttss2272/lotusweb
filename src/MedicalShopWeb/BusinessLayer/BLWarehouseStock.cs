using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;

namespace BusinessLayer
{
    public class BLWarehouseStock
    {
        DLWarehouseStock objWarehouseStock = new DLWarehouseStock();
        public DataSet GetWarehouseProductStock(int WarehouseID)
        {
            DataSet dsWaehouseStock = objWarehouseStock.GetWarehouseProductStock(WarehouseID);
            return dsWaehouseStock;
        }

        public DataSet GetProductStock(int WarehouseID, int ProductID)
        {
            DataSet dsWaehouseStock = objWarehouseStock.GetProductStock(WarehouseID, ProductID);
            return dsWaehouseStock;
        }
    }
}
