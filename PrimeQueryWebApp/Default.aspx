<%@ Page Language="Oxygene" AutoEventWireup="true"  CodeBehind="Default.aspx.pas" Inherits="PrimeQueryWebApp._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Prime Query</title>
    <link type="text/css" rel="Stylesheet" href="PrimeQueryStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="title"> 
      Prime Query
    </div>
      <p runat="server" align="center">
      <asp:Label runat="server" Text="Enter a number:" CssClass="instruction" />
      <br runat="server" />
        
      <asp:TextBox ID="txtPrimeEntry" runat="server" CssClass="primeentry"></asp:TextBox>
      <br runat="server" />        

      <asp:Button ID="btnCheck" runat="server" Text="Check!" CssClass="functionbutton" Width="150" OnClick="btnCheck_Click" />
      <br runat="server" />        
    
      <asp:Label ID="lblIsPrime" runat="server" Text=""></asp:Label>
          
      </p>
    </form>
</body>
</html>
