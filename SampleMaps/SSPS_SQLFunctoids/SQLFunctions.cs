using System;
using System.Drawing;
using System.Resources;
using Microsoft.BizTalk.BaseFunctoids;
using System.Reflection;
using System.Text;
using System.Collections;
using System.Globalization;
using System.Configuration;

namespace SSPS.SQLFunctoids
{
    public class GetExternalCustomerID : BaseFunctoid
    {
        public GetExternalCustomerID() : base()
        {
            this.ID = 9000;
            SetupResourceAssembly("SSPS.SQLFunctoids.SQLFunctionsResources", Assembly.GetExecutingAssembly());
            SetName("CUSTURI_NAME");
            SetTooltip("CUSTURI_TOOLTIP");
            SetDescription("CUSTURI_DESC");
            SetBitmap("CUSTURI_BITMAP");
            this.SetMinParams(1);
            this.SetMaxParams(1);
            SetExternalFunctionName(GetType().Assembly.FullName, "SSPS.SQLFunctions.GetExternalCustomerID", "GetCustURI");
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

} // end of SSPS.SQLFunctions class
