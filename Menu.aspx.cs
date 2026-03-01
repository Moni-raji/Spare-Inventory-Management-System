using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Menuclick1(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/New spare entry.aspx");
    }
    protected void menuclick2(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Issue spare.aspx");
    }

}