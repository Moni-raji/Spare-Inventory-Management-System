<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Menu Page</title>
    <style>
     body
        {
           background-image: url('Screenshot (375).png');
            background-size: cover; 
        }
        
        .center
        {
            position:absolute;
            top: 50px; 
            left: 200px;
            width: 991px;
            height:434px;
            margin:15px;
            padding:50px;
            background-color: #FFCCFF;      
        }
        .style1
        {
            color: #6600CC;
            font-size: xx-large;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="center">
    <center><h1 class="style1" style="width: 175px; margin-left: 0px">MENU</h1></center>
         <asp:ImageButton ID="ImageButton1" runat="server"  Imageurl="~/new spare menu.jpg"  OnClick="Menuclick1" AlternateText="Menu"  Height="256px" Width="306px" style="margin-left: 37px; margin-top: 27px"/>

        <asp:ImageButton ID="ImageButton2" runat="server" Imageurl="~/issue spare menu.jpg"  OnClick="menuclick2" AlternateText="Menu"  Height="256px" Width="306px"  style="margin-left: 325px"/>
        <br /><br /> <br /><br />
        
        </div>
    </form>
</body>
</html>
