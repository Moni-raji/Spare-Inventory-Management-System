<%@ Page Title="Spare Entry Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="SpareEntry.aspx.cs" Inherits="SpareEntry" %>


<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent" >
<h1 style="text-align:center; font-size:40px;font-family:Britannic Bold; color:Navy; width: 1522px;">
    <span class="style3">NEW SPARE ENTRY</span><span class="style4"> </span>
</h1>
<fieldset style="padding:20px;border:4px double #ccc; width: 920px; height: 579px; margin-left: 262px;">
 <legend style="font-family:Arial Rounded MT Bold;" 
        class="style19">NEW SPARE ENTRY Information</legend>
 <table>
 <tr>
  <td class="style16"><asp:Label ID="EntryDate" runat="server" Text="Label" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Date Of Entry:</asp:Label>
  <asp:TextBox ID="EntryDate1" runat="server" type="date" style="margin-right:20px"></asp:TextBox>
      <br />
      <br />
     </td>
  </tr>
  <tr>
  <td class="style16"><asp:Label ID="SparePartNumber" runat="server" Text="Text" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Part Number:</asp:Label>
          <asp:DropDownList ID="SparePartNumber1" runat="server" AutoPostBack="True"  onselectedindexchanged="SparePartNumber1_SelectedIndexChanged"></asp:DropDownList>
          <asp:TextBox ID="NewSparePartTextBox" runat="server" Style="display:none;"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
   
      <br />
      <br />
      </td>
  </tr>
  <tr>
    <td class="style16"><asp:Label ID="Quantity" runat="server" Text="Label" 
            
            style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white;">Quantity:</asp:Label>
  <asp:TextBox ID="Quantity1" runat="server" Width="83px"></asp:TextBox>
        <br />
        <br />
      </td>
  <td class="style18"><asp:Label ID="Nomenclature" runat="server" Text="Label" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white;"> Nomenclature:</asp:Label>
  <asp:TextBox ID="Nomenclature1" runat="server" Width="240px" 
          style="margin-left: 25px"></asp:TextBox>
  </td>
  </tr>
  <tr>
  <td class="style16"><asp:Label ID="RackNumber" runat="server" Text="Label" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Rack Number:</asp:Label>
  <asp:TextBox ID="RackNo1" runat="server" style="margin-right:20px" Width="63px"></asp:TextBox>
      <br />
      <br />
      </td>
  <td class="style18"><asp:Label ID="RowNumber" runat="server" Text="Label" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Row Number:</asp:Label>
  <asp:TextBox ID="RowNumber1" runat="server" 
          style="margin-right:20px; margin-left: 40px;" Width="70px"></asp:TextBox></td>
  </tr>
  <tr>
  <td class="style16"><asp:Label ID="EnteredBy" runat="server" Text="Text" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Entered By:</asp:Label>
  <asp:TextBox ID="EnteredBy1" runat="server" style="margin-right:20px"></asp:TextBox>
      <br />
      <br />
      </td>
  </tr>
  <tr>
  <td class="style16"><asp:Label ID="Remarks" runat="server" Text="Label" 
          
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:x-large; color:white">Remark:</asp:Label>
  <asp:TextBox ID="Remark1" runat="server" style="margin-right:20px"></asp:TextBox>
      <br />
      <br />
      </td>
  </tr>
  <td class="style1"><asp:Button ID="SpareEntryButton" runat="server" OnClick="EntryButton"  Text="Submit" />
      <br />
      <br />
  <asp:Label ID="errorMessage" runat="server"  
          style="font-size:medium; font-family:Arial Rounded MT Bold;font-size:25px; color:red">Remark</asp:Label>

       </td>
  </tr>
  <tr>
  <asp:Label ID="Label1" runat="server" ForeColor="Green" CssClass="style2" ></asp:Label>
  </tr>
  </table>
</fieldset>


</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 436px;
            color: #FFFFFF;
        }
        .style2
        {
            color: white;
            font-size: xx-small;
        }
        .style3
        {
            color: #FF9900;
            font-weight: bold;
            background-color: #000000;
            font-size: xx-large;
        }
        .style4
        {
            color: #FF9900;
            background-color: #000000;
            font-weight: 700;
        }
        .style16
        {
            width: 436px;
            color: #000000;
            height: 70px;
        }
        .style18
        {
            height: 70px;
        }
        .style19
        {
            color: white;
            font-size: x-large;
        }
    </style>
</asp:Content>