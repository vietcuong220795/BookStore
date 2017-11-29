using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for fwcommon
/// </summary>
public class fwcommon
{
	
		//
		// TODO: Add constructor logic here
		//
           public static string connect = ConfigurationManager.ConnectionStrings["myconnect"].ConnectionString;

}