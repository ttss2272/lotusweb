using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using DataLayer;
namespace BusinessLayer
{
   public class BLDoctorDetails
    {
       DLDoctorDetails obj_Doctor = new DLDoctorDetails();
       public string SaveDoctor(int DoctorID, string DrName, string Specialization, string DOB, int CityId, string Area, string Address,string Mobileno, double OpeningBalance, int IsActive, int UpdatedByUserID)
       {
           string Result = null;
           Result = obj_Doctor.SaveDoctor(DoctorID,DrName,Specialization,DOB,CityId,Area,Address,Mobileno,OpeningBalance,IsActive,UpdatedByUserID);
           return Result;
       }

       public DataSet GetAllData()
       {
           DataSet dsGridView = obj_Doctor.GetAllData();
           return dsGridView;
       }

       public DataSet GetDoctor()
       {
           DataSet dsDoctor = obj_Doctor.GetDoctor();
           return dsDoctor;
       }
    }
}
