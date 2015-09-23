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
       public string SaveDoctor(string DrName,string Specialization,string DOB,int CityId,string Area,string Address,string Mobileno,double OpeningBalance,int IsActive)
       {
           string Result = null;
           Result = obj_Doctor.SaveDoctor(DrName,Specialization,DOB,CityId,Area,Address,Mobileno,OpeningBalance,IsActive);
           return Result;
       }
    }
}
