<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Spare Inventory Management.aspx.cs" Inherits="Spare_Inventory_Management" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  
    <title>Spare Inventory Management</title>
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
            left: 189px;
            width: 1002px;
            height:444px;
            margin:15px;
            padding:50px;
            background-color: #FFCCFF;
            color: #FFCCFF;
        }
       
        
        .style1
        {
            font-size: xx-large;
            color: #6600CC;
        }
        
        .style3
        {
            color: #FFFFFF;
        }
        
    </style>
</head>
<body>
    <h1 style="text-align:center; top:10px;" class="style3" >SPARE INVENTORY MANAGEMENT</h1>
    <form   id="form1" runat="server">
    <div  class="center">
    <h1 style="text-align:center; font-family:@Arial Unicode MS; width: 996px; margin-left: 0px;" class="style1"><strong style="font-weight: 700; font-family: 'Times New Roman', Times, serif">LOGIN NOW</strong></h1>

   <center> <asp:Label ID="Label1" runat="server" style="text-align:center" ForeColor="Red"></asp:Label></center><br />

   <center style="height: 45px">
       <asp:Label ID="usernameLabel" runat="server" 
           Text="Label" 
           style="font-family: 'Dutch801 Rm BT'; font-size: large; color: #000066;">Username:</asp:Label>

    <p style="text-align:center; width: 930px; height: 188px; margin-left: 0px; margin-top: 22px;"><br />
        <asp:TextBox ID="username" runat="server"  Height="32px" Width="243px"></asp:TextBox><br /><br />


        <asp:Label ID="passwordLabel" runat="server" Text="Label" 
            style="font-size: large; font-family: 'Dutch801 Rm BT'; color: #000066;">Password:</asp:Label><br /><br />
        <asp:TextBox ID="password" runat="server"  Height="32px" Width="243px" CssClass="passwordEntry" TextMode="Password"></asp:TextBox><br /><br />
        <asp:Button ID="Button1" runat="server" onclick="buttonclickdb" Text="Login" 
            Width="72px" />
            
        
    </p>
        </center>

    </div>
    </form>
</body>
</html>
