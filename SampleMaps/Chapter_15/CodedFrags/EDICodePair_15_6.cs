public System.Collections.Hashtable PO1Table = new System.Collections.Hashtable();
public string LoadPO1Table(string inQty, string inPairs)
{
    string pairs = inPairs;
    string pair = "";
    PO1Table.Clear();
    while (pairs != "")
    {
        int delimpos = pairs.IndexOf("|",0);
        pair = pairs.Substring(0,delimpos);
        pairs = pairs.Remove(0,delimpos + 1);
        string pairQual = pair.Substring(0,pair.IndexOf("~",0));
        string pairVal = pair.Substring(pair.IndexOf("~",0)+ 1);
        if (pairVal != "" && pairQual != "")
        {
            PO1Table[pairQual] = pairVal; 
        }
    }
    return inQty;
}

public string ReturnPO1Pair(string inQual)
{
    string retval = "";
    if (PO1Table.ContainsKey(inQual))
        retval = PO1Table[inQual].ToString();
    return retval;
}

public string ReturnPO1Pair(string inQual)
{
    // Code is at Target ItemDescription
}

