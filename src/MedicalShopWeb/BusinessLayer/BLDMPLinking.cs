using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DataLayer;
namespace BusinessLayer
{
    public class BLDMPLinking
    {
        DLDMPLinking objDMPLinking = new DLDMPLinking();

        public string SaveDMPLinking(int DMPID, int DoctorID, int MedicalShopID, int ProductID, int PriceTypeID, decimal Price, int UpdatedByUserID, int IsActive)
        {
            string Result = objDMPLinking.SaveDMPLinking(DMPID, DoctorID, MedicalShopID, ProductID, PriceTypeID, Price, UpdatedByUserID, IsActive);
            return Result;
        }

        public DataSet GetAllDMPDetail(int DoctorID)
        {
            DataSet dsDMPDetail = objDMPLinking.GetAllDMPDetail(DoctorID);
            return dsDMPDetail;
        }

        public DataSet BindDMPDetail(int DMPID)
        {
            DataSet dsDMPDetail = objDMPLinking.BindDMPDetail(DMPID);
            return dsDMPDetail;
        }

        public DataSet GetDmpPrice(int DoctorID, int MedicalShopID, int ProductID)
        {
            DataSet dsDMPPrice = objDMPLinking.GetDmpPrice(DoctorID, MedicalShopID, ProductID);
            return dsDMPPrice;
        }
    }
}
