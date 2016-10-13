Sample Maps and Scripts for Pro Mapping in Biztalk Server 2009

The files in this zip will unload into directory C:\SampleMaps.  This directory 
contains the Development Studio solution file, and a separate project folder for all
chapters that contain maps or scripts.

Each chapter project contains a map solution for each of the illustrated maps in
that particular chapter.  Although the screenshots of the chapters may reference
different names for the maps, all the maps have been renamed to correspond to the
illustration number in the text.  In some cases, such as in chapter 3 where there
are several maps with identical map grids but that contain different scripts, we;ve
included the extra maps with some additional text description in the name.

Please note that all map properties have been set to reflect this installation 
pathname, so if you install the solution folder on another drive, or a different 
path, you will need to change map properties accordingly.

We've also included several CSharp projects in this solution:

    _TestCSharp:  contains a console app that we use to test CSharp functions before
        they are imported into custom scriptoids in the maps.  As downloaded, it 
        contains the three date conversion routines used in the custom functoid.
    
    CustomPipeline: Contains a project for the pipeline encoder module discussed in
         chapter 19, along with a TestPipelines project that can be used to test the
         pipeline encoder module once it has been built.  This project opens a flat file, 
         passes it to the encoder module, and writes the returned stream out to the file
         system, simulating pipeline functionality.
         
     SSPS_CommonFunctions:  contains the CSharp code used to create the external assembly
         referenced in Chapter 3.
         
     SSPS_CustomFunctoids:  Contains the artifacts necessary to create the custom functoids
         referenced in Chapter 18.  
         
     SSPS_SQLFunctoids:  Separate project containing the code for the SQL loopup functoid.
         This code is also included in the SSPS_CustomFunctoids project.
         
There is also a database folder:

     DatabaseScripts:  includes a backup of the ProMapping database, a script to create
         the CustAddress table in that database, and a CSV text file with the two rows
         in the database.  The database should be built in yoru default SQLServer location.
         The scripts assume that windows authentication is used in accessing the database, 
         so if you do not use that method, your connect string will have to be modified 
         accordingly.
        

When download the files from this zip file, we recommend that you move the TestCSharp
project to a separate solution.  In this way you can run the debugger without having
the Development Studio attemt a build on any other projects in the solution.

