  <%@ Page Language="C#" AutoEventWireup="true" CodeFile="New spare entry.aspx.cs" Inherits="New_spare_entry" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>New Spare Entry</title>
    <style>
        
        body
        {
             background-image: url('Screenshot (375).png');
            background-size: cover; 
        }
        
        .center
        {
            position:absolute;
            top: 59px; 
            left: 195px;
            width: 962px;
            height:437px;
            margin:15px;
            padding:50px;
            background-color: #FFCCFF;      
        }
        
     
        .style1
        {
            color: white;
            font-weight: bold;
        }
        
        .style2
        {
            height: 56px;
        }
          
        .home-button {
            position: absolute;
            top: 24px;
            right: 30px;
            width: 75px;
            height: 36px;
        }      
    </style>
</head>
<body>

    <form id="form1" runat="server">
     <h1 style="text-align:center; top:10px;" class="style1">NEW SPARE ENTRY</h1>
     <asp:Button ID="HomeButton" runat="server" Text="Home" OnClick="HomeButton_Click" CssClass="home-button"/>

   
    <div class="center">
    
    <table style="width: 961px; height: 470px; margin-top: 0px;">
    <tr><td><asp:Label ID="dateofentryLabel" runat="server" Text="Label" style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Date Of Entry:</asp:Label></td>
        <td></td>
        <td><asp:TextBox ID="dateofentry" runat="server" type="date" 
                style="margin-right:20px; margin-left: 0px;" Width="161px" Height="24px"></asp:TextBox></td>
    </tr>

    <tr>
    <td><asp:Label ID="partnoLabel" runat="server" Text="Text" style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Part Number : </asp:Label> </td>
    <td></td>
    <td><asp:DropDownList ID="partno" runat="server" AutoPostBack="True"  
            onselectedindexchanged="partno_SelectedIndexChanged" Height="24px" 
            style="margin-left: 0px" Width="161px" ></asp:DropDownList>
         <asp:TextBox ID="newsparepart" runat="server" Width="152px"  style="margin-left: 13px; display:none"></asp:TextBox>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label> </td>

    <td class="style2"> <asp:Label ID="nomenclatureLabel" runat="server" Text="Label"  
            style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Nomenclature:</asp:Label> </td>
    <td class="style2"></td>
    <td class="style2"><br /><asp:TextBox ID="nomenclature" runat="server" 
            Width="273px" Height="24px"  
            style="margin-left: 0px"></asp:TextBox><br /> </td>

    
    </tr>

    <tr>
    <td class="style2"><asp:Label ID="racknoLabel" runat="server" Text="Label"  
            style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Rack Number:</asp:Label> </td>
    <td class="style2"></td>
    <td class="style2"><asp:TextBox ID="rackno" runat="server" Width="161px" style="margin-left: 0px"  
            Height="24px"></asp:TextBox> </td>
    

    <td class="style2"><asp:Label ID="rownoLabel1" runat="server" Text="Label"  
            style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Row number:</asp:Label> </td>
    <td class="style2"></td>
    <td class="style2"><br /><asp:TextBox ID="rowno" runat="server" style="margin-left: 0px" Width="161px" 
            Height="24px" ></asp:TextBox><br /></td>
    </tr>

    <tr>
    <td><asp:Label ID="enteredbyLabel" runat="server" Text="Label" 
            style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Entered By:</asp:Label> </td>
    <td></td>
    <td> <asp:TextBox ID="enteredby" runat="server" style="margin-left: 0px"  
            Width="161px" Height="24px"></asp:TextBox> </td>
    </tr>

    <tr>
    <td class="style2"><asp:Label ID="quantityLabel" runat="server" Text="Label" 
            style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Quantity:</asp:Label> </td>
    <td class="style2"></td>
    <td class="style2"><br /><asp:TextBox ID="quantity" runat="server" style="margin-left: 0px"  
            Width="161px" Height="24px"></asp:TextBox><br /></td>
    </tr>

    
    
    

    <tr>
    <td><asp:Button ID="Button1" OnClick="buttonclick" runat="server" Text="Submit" 
            Height="36px" Width="91px" /></td>
    </tr>

    <tr>
    <td><asp:Label ID="errormessage" runat="server" Text=""></asp:Label></td>
    </tr>

    </table>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
            CellPadding="4" ForeColor="#333333" GridLines="None"  AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" Height="465px" 
            style="margin-left: 0px; margin-top: 93px" Width="961px" >
    <AlternatingRowStyle BackColor="#FFFFE0" ForeColor="black" />
    <Columns>
        <asp:BoundField DataField="DateOfEntry" HeaderText="Date Of Entry" DataFormatString="{0:dd-MM-yyyy}" />
        <asp:BoundField DataField="PartNumber" HeaderText="Part Number" />
        <asp:BoundField DataField="RackNumber" HeaderText="Rack Number" />
        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
        <asp:BoundField DataField="EnteredBy" HeaderText="Entered By" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        <asp:BoundField DataField="Nomenclature" HeaderText="Nomenclature" />
    </Columns>
    <EditRowStyle BackColor="black" />
    <FooterStyle BackColor="black" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFACD" ForeColor="black" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#E9E7E2" />
    <SortedAscendingHeaderStyle BackColor="#506C8C" />
    <SortedDescendingCellStyle BackColor="#FFFDF8" />
    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>


    </div>

 

     

    </form>

     </body>
</html>
