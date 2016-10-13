string custName;
string custAddress;
public string UnstringAddress(string inString)
{
    string AddressInfo = inString;
    string Location;
    custName = "";
    custAddress = "";
    int delimPos = AddressInfo.IndexOf("|",0);
    if (delimPos == -1)
        return ""; 
    if (AddressInfo != "")
    {
        delimPos = AddressInfo.IndexOf("|",0);
        Location = AddressInfo.Substring(0,delimPos);
        AddressInfo = AddressInfo.Remove(0, delimPos + 1);  
        delimPos = AddressInfo.IndexOf("|",0);
        custName = AddressInfo.Substring(0,delimPos);
        custAddress = AddressInfo.Remove(0, delimPos + 1);
    }  
    return custName;
}