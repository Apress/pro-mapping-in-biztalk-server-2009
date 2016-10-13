using System;
using System.Drawing;
using System.Resources;
using Microsoft.BizTalk.BaseFunctoids;
using System.Reflection;
using System.Text;
using System.Collections;
using System.Globalization;
using System.Configuration;


namespace SSPS.CustomFunctoids
{
	public class DateTimeConversion : BaseFunctoid
	{
        public DateTimeConversion() : base()
		{
            //Set the ID of the functoid
            this.ID = 10000;

            //Set the Resource file for the functoid (where Names, tooltips and etc will be stored)
            SetupResourceAssembly("SSPS.CustomFunctoids.SSPS_CustomFunctoidsResources", Assembly.GetExecutingAssembly());

			//Set the Resource Name, ToolTip, Help Description, and the Bitmap for this functoid
			SetName("FMT_DATE_NAME");
			SetTooltip("FMT_DATE_TOOLTIP");
			SetDescription("FMT_DATE_DESC");
			SetBitmap("FMT_DATE_BITMAP");
            
            //Set the Min and Max input parameters
            this.SetMinParams(3);
			this.SetMaxParams(3);

			//set the function name that needs to be called when this Functoid is invoked. 
            SetExternalFunctionName(GetType().Assembly.FullName, "SSPS.CustomFunctoids.DateTimeConversion", "FormatDateTime");

            //set the tab in the toolbar where the functoid will appear
            this.Category = FunctoidCategory.DateTime;
            
            //set the type of node to which the output can be connected
            this.OutputConnectionType = ConnectionType.AllExceptRecord;

			AddInputConnectionType(ConnectionType.All); //first input
			AddInputConnectionType(ConnectionType.All); //second input
            AddInputConnectionType(ConnectionType.All); //third input
		}

        // Convert one standard date format to another standard date format
        public string FormatDateTime(string inVar, string inFmt, string outFmt)
        {
            string outDate = "";
            try
            {
                outDate = DateTime.ParseExact(inVar, inFmt, null).ToString(outFmt);
            }
            catch
            {
                outDate = "INVALID";
            }
            return outDate;
        } // end of FormatDateTime()
 
    } // end of DateTimeConversion

	public class ConvertToOrdinal : BaseFunctoid
	{
        public ConvertToOrdinal()
            : base()
		{
			this.ID = 10001;
            SetupResourceAssembly("SSPS.CustomFunctoids.SSPS_CustomFunctoidsResources", Assembly.GetExecutingAssembly());
			SetName("CTO_NAME");
			SetTooltip("CTO_TOOLTIP");
			SetDescription("CTO_DESC");
            SetBitmap("CTO_BITMAP");

			this.SetMinParams(2);
			this.SetMaxParams(2);
            SetExternalFunctionName(GetType().Assembly.FullName, "SSPS.CustomFunctoids.ConvertToOrdinal", "GregToOrdinal");

            this.Category = FunctoidCategory.DateTime;
			this.OutputConnectionType = ConnectionType.All;
			AddInputConnectionType(ConnectionType.All); //first input
			AddInputConnectionType(ConnectionType.All); //second input

		}

        // Convert a standard windows format date to an ordinal date format (yyyyddd)
        public string GregToOrdinal(string inVar, string inFmt)
        {
            string returnDate = "";
            try
            {
                DateTime testDate = DateTime.ParseExact(inVar, inFmt, null);
                returnDate = testDate.Year.ToString() + testDate.DayOfYear.ToString("000");
            }
            catch
            {
                returnDate = "INVALID";
            }
            return returnDate;
        } // end of GregToOrdinal()
    } // end of ConvertToOrdinal

    public class ConvertToGreg : BaseFunctoid
    {
        public ConvertToGreg() : base()
        {
            this.ID = 10002;
            SetupResourceAssembly("SSPS.CustomFunctoids.SSPS_CustomFunctoidsResources", Assembly.GetExecutingAssembly());
            SetName("CTG_NAME");
            SetTooltip("CTG_TOOLTIP");
            SetDescription("CTG_DESC");
            SetBitmap("CTG_BITMAP");

            this.SetMinParams(2);
            this.SetMaxParams(2);
            SetExternalFunctionName(GetType().Assembly.FullName, "SSPS.CustomFunctoids.ConvertToGreg", "OrdinalToGreg");

            this.Category = FunctoidCategory.DateTime;
            this.OutputConnectionType = ConnectionType.All;

            AddInputConnectionType(ConnectionType.All); //first input
            AddInputConnectionType(ConnectionType.All); //second input
        }

        // Convert an ordinal date format (yyyyddd) to any standard windows format
        public string OrdinalToGreg(string inDate, string outFmt)
        {
            int year = Convert.ToInt32(inDate.Substring(0, 4));
            int day = Convert.ToInt32(inDate.Substring(4, 3));
            int month = 0;
            int dayOfMonth = 0;
            int div = 4;
            int[] LeapArray = new int[13] { 0, 31, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335, 366 };
            int[] DateArray = new int[13] { 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 };
            if ((year % div) == 0)
            {
                LeapArray.CopyTo(DateArray, 0);
            }
            for (int i = 0; i < 13; i++)
            {
                if (day > DateArray[i] && day <= DateArray[i + 1])
                {
                    month = i + 1;
                    dayOfMonth = day - DateArray[i];
                    break;
                }
            }
            string outDate = month.ToString("00") + "/" + dayOfMonth.ToString("00") + "/" + year.ToString("0000");
            return DateTime.ParseExact(outDate, "MM/dd/yyyy", null).ToString(outFmt);
        } // end of OrdinalToGreg

    } // end of ConvertToGreg

    public class GetExternalCustomerID : BaseFunctoid
    {
        public GetExternalCustomerID() : base()
        {
            this.ID = 9000;
            SetupResourceAssembly("SSPS.CustomFunctoids.SSPS_CustomFunctoidsResources", Assembly.GetExecutingAssembly());
            SetName("CUSTURI_NAME");
            SetTooltip("CUSTURI_TOOLTIP");
            SetDescription("CUSTURI_DESC");
            SetBitmap("CUSTURI_BITMAP");
            this.SetMinParams(1);
            this.SetMaxParams(1);
            SetExternalFunctionName(GetType().Assembly.FullName, "SSPS.CustomFunctoids.GetExternalCustomerID", "GetCustURI");
            this.Category = FunctoidCategory.Conversion;
            this.OutputConnectionType = ConnectionType.All;
            AddInputConnectionType(ConnectionType.All); //first input
        } // End of GetExternalCustomer function

        // Function to retrieve External customer ID info based on the internal Customer ID
        public string GetCustURI(string custID)
        {
            //return custID;
            string connectString = ConfigurationManager.AppSettings.Get("MapBookConnectString");
            string retval = "No Address";
            string queryString = "Select custLastName, custFirstName, custCity, custURI from CustAddress where LocationID = '" + custID + "'";
            System.Data.SqlClient.SqlConnection MapBook = new System.Data.SqlClient.SqlConnection(connectString);
            System.Data.SqlClient.SqlCommand custQuery = new System.Data.SqlClient.SqlCommand(queryString, MapBook);
            try
            {
                MapBook.Open();
                System.Data.SqlClient.SqlDataReader GetAddress = custQuery.ExecuteReader();
                while (GetAddress.Read())
                {
                    string custLast = GetAddress.GetValue(0).ToString();
                    string custFirst = GetAddress.GetValue(1).ToString();
                    string custCity = GetAddress.GetValue(2).ToString();
                    string custURI = GetAddress.GetValue(3).ToString();
                    retval = custID + "|" + custLast.Trim() + "|" + custFirst.Trim() + "|" + custCity.Trim() + "|" + custURI.Trim();
                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                return ex.ToString();
            }
            finally
            {
                MapBook.Close();
            }
            return retval;  
        } // End of ExternalCustID function 

    } // End of GetExternalCustomer Class 


}
