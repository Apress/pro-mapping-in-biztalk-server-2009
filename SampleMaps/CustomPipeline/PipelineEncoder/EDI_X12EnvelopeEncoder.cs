//---------------------------------------------------------------------
// File: FixMsg.cs
// 
// Summary: Reads a flat file stream, modifies the contents of the file.
//
//---------------------------------------------------------------------

namespace SSPS.BizTalk.PipelineComponents
{
    using System;
    using System.Resources;
    using System.Drawing;
    using System.Collections;
    using System.Reflection;
    using System.ComponentModel;
    using System.Text;
    using System.IO;
    using Microsoft.BizTalk.Message.Interop;
    using Microsoft.BizTalk.Component.Interop;

    [ComponentCategory(CategoryTypes.CATID_PipelineComponent)]
    [ComponentCategory(CategoryTypes.CATID_Any)]
    [ComponentCategory(CategoryTypes.CATID_Encoder)]
    [System.Runtime.InteropServices.Guid("171AB173-E16B-4eb2-A888-33563CE9CAFA")]

    public class X12EnvelopeEncoder :
        IBaseComponent, 
        Microsoft.BizTalk.Component.Interop.IComponent,
        Microsoft.BizTalk.Component.Interop.IPersistPropertyBag,
        IComponentUI
    {

    	private ResourceManager resManager = new ResourceManager("SSPS.BizTalk.PipelineComponents.X12EnvelopeEncoder", Assembly.GetExecutingAssembly());

        #region IComponent

        public IBaseMessage Execute(IPipelineContext pc, IBaseMessage inmsg)
        {
            try
            {
                Stream s = ReformatEnvelope(inmsg.BodyPart.Data);
                s.Position = 0;
                inmsg.BodyPart.Data = s;
                return inmsg;
            }
            catch (Exception ex)
            {
                throw new ApplicationException(string.Format("The {0} pipeline component encountered an error. ", this.GetType().ToString()), ex);
            }

        }
        #endregion

        public Stream ReformatEnvelope(Stream inStream)
        {
            MemoryStream ms = new MemoryStream();
            StreamWriter sw = new StreamWriter(ms);
            StreamReader sr = new StreamReader(inStream);
            int bufferSize = 1024;
            char[] buffer = new char[bufferSize];
            int sizeRead = 0;

            if ((sizeRead = sr.Read(buffer, 0, bufferSize)) != 0)
            {
                buffer[102] = Convert.ToChar("T");
                sw.Write(buffer, 0, sizeRead);
            }
            while ((sizeRead = sr.Read(buffer, 0, bufferSize)) != 0)
            {
                sw.Write(buffer, 0, sizeRead);
            }
            sr.Close();
            sw.Flush();
            ms.Seek(0, SeekOrigin.Begin);
            return ms;
        }


        #region IBaseComponent
        
        public string Name
        {
            get {   return "Update X12 ProdTest Flag";  }
        }
        
        [Browsable(false)]
        public string Version
        {
            get {   return "1.0";   }
        }
        
        [Browsable(false)]
        public string Description
        {
            get {   return "Updates the ISA15 element"; }
        }
    
        #endregion
        
        #region IPersistPropertyBag
    
        public void GetClassID(out Guid classid)
        {
            classid = new System.Guid("171AB173-E16B-4eb2-A888-33563CE9CAFA");
        }
        
        public void InitNew()
        {
        }
        
        public void Load(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Int32 errlog)
        {
        }
        
        public void Save(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, Boolean fClearDirty, Boolean fSaveAllProperties)
        {
        }

        private static object ReadPropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName)
        {
            object val = null;
            try
            {
                pb.Read(propName,out val,0);
            }

            catch(ArgumentException)
            {
                return val;
            }
            catch(Exception ex)
            {
                throw new ApplicationException( ex.Message);
            }
            return val;
        }

        private static void WritePropertyBag(Microsoft.BizTalk.Component.Interop.IPropertyBag pb, string propName, object val)
        {
            try
            {
                pb.Write(propName, ref val);
            }
            catch(Exception ex)
            {
                throw new ApplicationException( ex.Message);
            }
        }
        #endregion

        #region IComponentUI

        [Browsable(false)]
        public IntPtr Icon
        {
		get
    		{
                return ((System.Drawing.Bitmap)(this.resManager.GetObject("COMPONENTICON", System.Globalization.CultureInfo.InvariantCulture))).GetHicon();
    		}
        }

        public IEnumerator Validate(object obj)
        {
		    IEnumerator enumerator = null;
    		return enumerator;
        }

        #endregion
    }
}
