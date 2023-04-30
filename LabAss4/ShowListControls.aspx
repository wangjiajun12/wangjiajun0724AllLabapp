<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowListControls.aspx.cs" Inherits="LabAss4.ShowListControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div><h1>ListBox
            
           </h1>
            <p>
                <asp:ListBox runat="server" ID="ListBox1" DataTextField="UserName" DataValueField="UserName" DataSourceID="SqlDataSource1"></asp:ListBox>&nbsp;</p>
        </div>

      
        <div><h1>DropDownList</h1>
            <p>
                <asp:DropDownList runat="server" ID="DropDownList1" DataTextField="UserName" DataValueField="UserName" DataSourceID="SqlDataSource1"></asp:DropDownList>&nbsp;</p>
        </div>
        
        <div><h1 id="ctl00">BulletedList</h1>
            <p>
                <asp:BulletedList runat="server" ID="BulletedList1" DataTextField="UserName" DataValueField="UserName" DataSourceID="SqlDataSource1"></asp:BulletedList>
                &nbsp;</p>
        </div>
        <div><h1>CheckBoxList</h1>
            <p>
                <asp:CheckBoxList runat="server" ID="CheckBoxList1" DataTextField="UserName" DataValueField="UserName" DataSourceID="SqlDataSource1"></asp:CheckBoxList>&nbsp;</p>
        </div>
        <div><h1>RadioButtonList</h1>
            <p>
                <asp:RadioButtonList runat="server" ID="RadioButtonList1" DataTextField="UserName" DataValueField="UserName" DataSourceID="SqlDataSource1"></asp:RadioButtonList>&nbsp;</p>
            <p>&nbsp;<asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SimpleDatabaseConnectionString %>" ProviderName="<%$ ConnectionStrings:SimpleDatabaseConnectionString.ProviderName %>" SelectCommand="SELECT [UserName], [Password] FROM [Logon]"></asp:SqlDataSource>
            </p>
        </div>
    </form>
</body>
</html>
