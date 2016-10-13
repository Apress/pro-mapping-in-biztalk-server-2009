using System;

namespace CSharpTest
{
	class CSharpTest
	{
		[STAThread]
		static void Main(string[] args)
		{
            //Console.WriteLine(Format2Decimals("254"));
            //Console.WriteLine(PadText("TEXT", 10));
            Console.WriteLine(OrdinalToGreg("2008364"));
            Console.ReadLine();
		}

        public static string OrdinalToGreg(string inDate)
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
                    month = i;
                    dayOfMonth = day - DateArray[i];
                    break;
                }
            }
            return year.ToString("0000") + "/" + month.ToString("00") + "/" + dayOfMonth.ToString("00");
        }

        // padding a text string
        public string PadText(string inText, int padLen)
        {
            return inText.PadRight(padLen, Convert.ToChar("."));
        }

        // formats a decimal number to 2 decimals, tests for null
        public static string Format2Decimals(string inNum) 
        {   
            double outNum = 0;
            if (inNum != "")
                outNum = Convert.ToDouble(inNum);
            else
                outNum = 0;
            return outNum.ToString("#0.00");
        }


    } // end of class
} // end of namespace



