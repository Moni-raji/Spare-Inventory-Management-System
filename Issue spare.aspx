<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Issue spare.aspx.cs" Inherits="Issue_spare" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Issue Spare</title>
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
            left: 177px;
            width: 1051px;
            height:475px;
            margin:15px;
            padding:50px;
            background-color: #FFCCFF;      
        }
        .style1
        {
            color: white;
             font-weight: bold;
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
    <center><h1 class="style1">ISSUE SPARE</h1></center>
    <asp:Button ID="HomeButton" runat="server" Text="Home" OnClick="HomeButton_Click" CssClass="home-button"/>
    <div class="center" >

    <table style="width: 976px; height: 520px">

    <tr>
    <td><asp:Label ID="issuedateLabel" runat="server" Text="Label" style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;" >Date Of Issue:  </asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="issuedate" runat="server" type="date" 
            style="margin-right:20px; margin-left: 0px;"  Width="171px" ></asp:TextBox></td>
    </tr>

    <tr>
     <td><asp:Label ID="partnoLabel" runat="server" Text="Text"  style="font-family: 'Calisto MT'; font-size: x-large; color: #000066;">Part Number  : </asp:Label></td>
     <td></td>
     <td><asp:DropDownList ID="partno" runat="server" AutoPostBack="True" 
            onselectedindexchanged="partno_SelectedIndexChanged" Height="16px" 
            style="margin-left: 0px" Width="175px" ></asp:DropDownList></td>

    <td><asp:Label ID="nomenclatureLabel" runat="server" Text="Label" style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Nomenclature:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="nomenclature" runat="server" Width="229px" 
            style="margin-left: 0px"></asp:TextBox></td>

    </tr>
        
    <tr>
    <td><asp:Label ID="racknoLabel" runat="server" Text="Label" style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Rack Number:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="rackno" runat="server" style="margin-left: 0px" Width="179px" ></asp:TextBox></td>
    
    <td><asp:Label ID="rownoLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Row Number:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="rowno" runat="server"></asp:TextBox></td>
    </tr>

    <tr>
    <td><asp:Label ID="enteredbyLabel" runat="server" Text="Label" style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Entered By: </asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="enteredby" runat="server" style="margin-left: 0px" 
            Width="182px"></asp:TextBox></td>

    <td><asp:Label ID="purposeLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Purpose:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="purpose" runat="server" style="margin-left: 0px"  
            Width="228px"></asp:TextBox></td>
    </tr>
   
    <tr>
    <td><asp:Label ID="quantityLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Quantity: </asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="quantity" runat="server" style="margin-left: 0px" 
            Width="183px"></asp:TextBox></td>
    
    <td><asp:Label ID="balanceLabel" runat="server" Text="Label" style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Balance:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="balance" runat="server" ReadOnly="true"></asp:TextBox></td>
    </tr>

    <tr>
    <td><asp:Label ID="issuetypeLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Issue Type:</asp:Label></td>
    <td></td>
     <td><asp:DropDownList ID="issuetypeDropDown" runat="server" AutoPostBack="true" 
            Height="24px" style="margin-left: 0px" Width="128px">
    <asp:ListItem Value="issue">Issue</asp:ListItem>
    <asp:ListItem Value="loan">Loan</asp:ListItem>
     </asp:DropDownList></td>

    <td><asp:Label ID="divisionLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Issue Division:</asp:Label></td>
    <td></td>
    <td><asp:TextBox ID="division" runat="server"></asp:TextBox></td>
    </tr>

    <tr>
    <td><asp:Label ID="engineLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Engine/Transmission</asp:Label></td>
    <td></td>
    <td><asp:DropDownList ID="engineDropDown" runat="server" AutoPostBack="true" 
            Height="24px" style="margin-left: 2px" Width="129px">
    <asp:ListItem Value="engine">Engine</asp:ListItem>
    <asp:ListItem Value="transmission">Transmission</asp:ListItem>
     </asp:DropDownList></td>

     <td><asp:Label ID="employeenameLabel" runat="server" Text="Label"  style="font-size: x-large; font-family: 'Calisto MT'; color: #000066;">Employee Name</asp:Label> </td>
     <td></td>
     <td><asp:TextBox ID="employeename" runat="server"></asp:TextBox></td> 
     </tr>

    <tr>
    <td><asp:Button ID="Button1" runat="server" OnClick="buttonclick" Text="Submit" 
            Height="27px" Width="106px" /></td>
     </tr>
     
     <tr>
     <td>
     <asp:Label ID="errormessage" runat="server" Text=""></asp:Label></td>
     </tr>
     </table>

     <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" 
            CellPadding="4" ForeColor="#333333" GridLines="None"  AllowPaging="True" 
            PageSize="10" OnPageIndexChanging="GridView1_PageIndexChanging" Height="465px" 
            style="margin-left: 0px; margin-top: 93px" Width="1025px" >
    <AlternatingRowStyle BackColor="#FFFFE0" ForeColor="black" />
    <Columns>
        <asp:BoundField DataField="DateOfIssue" HeaderText="Date Of Issue" DataFormatString="{0:dd-MM-yyyy}" />
        <asp:BoundField DataField="PartNumber" HeaderText="Part Number" />
        <asp:BoundField DataField="RackNumber" HeaderText="Rack Number" />
        <asp:BoundField DataField="RowNumber" HeaderText="Row Number" />
        <asp:BoundField DataField="EnteredBy" HeaderText="Entered By" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
        <asp:BoundField DataField="Nomenclature" HeaderText="Nomenclature" />
        <asp:BoundField DataField="IssueType" HeaderText="Issue type" />
        <asp:BoundField DataField="IssueDivision" HeaderText="Issue Division" />
        <asp:BoundField DataField="EmployeeName" HeaderText="Emp Name" />
         <asp:BoundField DataField="Purpose" HeaderText="Purpose" />
          <asp:BoundField DataField="EngineTransmission" HeaderText="Type" />

    </Columns>
    <EditRowStyle BackColor="#999999" />
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFACD" ForeColor="#333333" />
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
