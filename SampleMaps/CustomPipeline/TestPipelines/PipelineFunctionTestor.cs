using System;
using System.IO;
using System.Collections;

using ABL.Pipeline.Components;

namespace PipelineComponentTestAp
{
    class PipelineFunctionTestor
    {
        [STAThread]
        static void Main(string[] args)
		{
            FileStream inputStream = new FileStream(@"C:\SampleMaps\CustomPipeline\TestPipelines\Data\Test.edi", FileMode.Open);
            SSPS.BizTalk.PipelineComponents.SSPS.BizTalk.PipelineComponents.X12EnvelopeEncoder updateEnvelope = new SSPS.BizTalk.PipelineComponents.SSPS.BizTalk.PipelineComponents.X12EnvelopeEncoder();
            Stream newMessage = updateEnvelope.ReformatEnvelope(inputStream);
            newMessage.Position = 0;

            StreamWriter sw = new StreamWriter(@"C:\SampleMaps\CustomPipeline\TestPipelines\Data\Test.edi.new.edi", false);
            StreamReader sr = new StreamReader(newMessage);
            sw.Write(sr.ReadToEnd());
            sw.Flush();
            sr.Close();
            sw.Close();
            Console.ReadLine();
        }
    } // end of class
} // end of namespace
