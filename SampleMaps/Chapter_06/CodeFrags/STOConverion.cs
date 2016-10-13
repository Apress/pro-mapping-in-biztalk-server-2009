public static string AddTrailingSignOverpunch(string inputString)
{
    double inboundNumber = Convert.ToDouble(inputString);
    string inboundString = inboundNumber.ToString("#0");
    string replacement = "0";
    string[] CheckPos = new String[10] { "{", "A", "B", "C", "D", "E", "F", "G", "H", "I"};
    string[] CheckNeg = new String[10] { "}", "J", "K", "L", "M", "N", "O", "P", "Q", "R"};
    int lastDigit = Convert.ToInt16(inboundString.Substring(inboundString.Length - 1));
    if(inboundNumber >= 0)
        replacement = CheckPos[lastDigit];
    else
        replacement = CheckNeg[lastDigit];
    inboundNumber = Math.Abs(inboundNumber);
    inboundString = inboundNumber.ToString("#0");
    return inboundString.Substring(0,inboundString.Length - 1) + replacement;
}

public string RemoveTrailingSignOverpunch(string inString)
{
    Int64 outputNum = 0;
    string lastDigit = inString.Substring(inString.Length - 1);
    if (lastDigit == "{") 
        outputNumber = Convert.ToInt64(inString.Replace("{", "0"));
    else if (lastDigit == "A") 
        outputNum = Convert.ToInt64(inString.Replace("A", "1"));
    else if (lastDigit == "B") 
        outputNum = Convert.ToInt64(inString.Replace("B", "2"));
    else if (lastDigit == "C") 
        outputNum = Convert.ToInt64(inString.Replace("C", "3"));
    else if (lastDigit == "D") 
        outputNum = Convert.ToInt64(inString.Replace("D", "4"));
    else if (lastDigit == "E") 
        outputNum = Convert.ToInt64(inString.Replace("E", "5"));
    else if (lastDigit == "F") 
        outputNum = Convert.ToInt64(inString.Replace("F", "6"));
    else if (lastDigit == "G") 
        outputNum = Convert.ToInt64(inString.Replace("G", "7"));
    else if (lastDigit == "H") 
        outputNum = Convert.ToInt64(inString.Replace("H", "8"));
    else if (lastDigit == "I") 
        outputNum= Convert.ToInt64(inString.Replace("I", "9"));
    else if (lastDigit == "}") 
        outputNum = Convert.ToInt64(inString.Replace("}", "0")) * -1;
    else if (lastDigit == "J") 
        outputNum = Convert.ToInt64(inString.Replace("J", "1")) * -1;
    else if (lastDigit == "K") 
        outputNum = Convert.ToInt64(inString.Replace("K", "2")) * -1;
    else if (lastDigit == "L") 
        outputNum = Convert.ToInt64(inString.Replace("L", "3")) * -1;
    else if (lastDigit == "M") 
        outputNum = Convert.ToInt64(inString.Replace("M", "4")) * -1;
    else if (lastDigit == "N") 
        outputNum = Convert.ToInt64(inString.Replace("N", "5")) * -1;
    else if (lastDigit == "O") 
        outputNum = Convert.ToInt64(inString.Replace("O", "6")) * -1;
    else if (lastDigit == "P") 
        outputNum = Convert.ToInt64(inString.Replace("P", "7")) * -1;
    else if (lastDigit == "Q") 
        outputNum = Convert.ToInt64(inString.Replace("Q", "8")) * -1;
    else if (lastDigit == "R") 
        outputNum = Convert.ToInt64(inString.Replace("R", "9")) * -1;
    return outputNum.ToString();
}