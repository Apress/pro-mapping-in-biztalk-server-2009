using System;
using System.IO;
using System.Xml;

namespace loreal.APPS
{
    [Serializable]
    public class Reformat856
    {
        public static void Main()
        {
            // Debuggin code start
            XmlDocument a = new XmlDocument();
            a.PreserveWhitespace = true;
            a.Load("C:\\SampleMaps\\Chapter_19\\Data\\original.856.xml");
            Reformat(a);
            // Debuggin code end
            return;
        }

        static public XmlDocument Reformat(XmlDocument _asn)
        {
            //Debugging Code Start
            string outputfile = "Z:\\z_temp\\asn_out.xml";
            FileStream fileout = new FileStream(outputfile, FileMode.Create, FileAccess.Write);
            StreamWriter writefileln = new StreamWriter(fileout);
            //Debugging Code End

            string line;
            int writeflag = 1;

            MemoryStream read = new MemoryStream();
            _asn.PreserveWhitespace = true;
            _asn.Save(read);
            read.Position = 0;
            
            MemoryStream _asnout = new MemoryStream();

            StreamReader readln = new StreamReader(read);
            StreamWriter writeln = new StreamWriter(_asnout);

            while (readln.Peek() != -1)
            {
                //=====================================================================
                line = readln.ReadLine();
                if (line.IndexOf("<EliteASN") != -1) line = line.Replace("<EliteASN", "<EliteASN_Map") + "\r" + "\n";
                if (line.IndexOf("</EliteASN>") != -1) line = "</EliteASN_Map>" + "\r" + "\n";
                if (line.IndexOf("<HLLoopShipment>") != -1) line = "<Loop>";
                if (line.IndexOf("<HLLoopOrder>") != -1) line = "</Loop>" + "\r" + "\n" + "<Loop>";
                if (line.IndexOf("<HLLoopPack>") != -1) line = "</Loop>" + "\r" + "\n" + "<Loop>";
                if (line.IndexOf("<HLLoopItem>") != -1) line = "</Loop>" + "\r" + "\n" + "<Loop>";
                if (line.IndexOf("<CTT") != -1) line = "</Loop>" + "\r" + "\n" + line;
                if (line.IndexOf("<HL_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("TD1_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("TD5_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("N1Loop_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("N1_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("N3_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("N4_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("<REF_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("<DTM_S") != -1) line = line.Replace("_S", "");
                if (line.IndexOf("<HL1_O") != -1) line = line.Replace("1_O", "");
                if (line.IndexOf("PRF_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("TD1_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("<REF_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("N1Loop_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("N1_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("N3_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("N4_O") != -1) line = line.Replace("_O", "");
                if (line.IndexOf("<HL1_P") != -1) line = line.Replace("1_P", "");
                if (line.IndexOf("PO4_P") != -1) line = line.Replace("_P", "");
                if (line.IndexOf("MAN_P") != -1) line = line.Replace("_P", "");
                if (line.IndexOf("<HL1_I") != -1) line = line.Replace("1_I", "");
                if (line.IndexOf("LIN_I") != -1) line = line.Replace("_I", "");
                if (line.IndexOf("SN1_I") != -1) line = line.Replace("_I", "");
                if (line.IndexOf("PO4_I") != -1) line = line.Replace("_I", "");
                if (line.IndexOf("TD5_I") != -1) line = line.Replace("_I", "");

                if (line.IndexOf("</HLLoopShipment>") != -1) writeflag = 0;
                if (line.IndexOf("</HLLoopOrder>") != -1) writeflag = 0;
                if (line.IndexOf("<HLLoopTare>") != -1) writeflag = 0;
                if (line.IndexOf("</HLLoopPack>") != -1) writeflag = 0;
                if (line.IndexOf("</HLLoopItem>") != -1) writeflag = 0;
                if (line.IndexOf("</HLLoopTare>") != -1) writeflag = 0;

                //Debugging Code Begins
                if (writeflag == 1) writefileln.Write(line + "\r\n");
                //End Debugging Code
 
                if (writeflag == 1) writeln.Write(line + "\r\n");

                //Debugging Code Starts
                writefileln.Flush();
                //Debugging Code Ends

                writeln.Flush();
                writeflag = 1;
            }

            _asnout.Seek(0, SeekOrigin.Begin);

            XmlDocument retdoc = new XmlDocument();
            retdoc.Load(_asnout);
            return retdoc;
        }
    }
}