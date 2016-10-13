using System;
using System.Collections.Generic;
using System.Text;

namespace SSPS_CommonFunctions
{
    [Serializable]
    public class CommonMapFunctions
    {
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
        }

    }
}
