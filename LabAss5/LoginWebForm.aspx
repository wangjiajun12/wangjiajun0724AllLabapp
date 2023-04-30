<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginWebForm.aspx.cs" Inherits="LabAss5.LoginWebForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
            <asp:Label ID="lblCaption" runat="server" Text="Please Log On"></asp:Label>
            
        </div>
        <div>
            <asp:Label runat="server" Text="Username" ID="ctl99"></asp:Label><asp:TextBox runat="server" ID="txtUsername"></asp:TextBox>
            &nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="Invalid Username" ControlToValidate="txtUsername"></asp:RequiredFieldValidator></div>
        <div>
            <asp:Label runat="server" Text="Password" ID="ctl07"></asp:Label><asp:TextBox runat="server" OnTextChanged="Unnamed2_TextChanged" ID="txtPassword"></asp:TextBox>&nbsp;<asp:RequiredFieldValidator runat="server" ErrorMessage="Invalid Password" ControlToValidate="txtPassword"></asp:RequiredFieldValidator></div>
        <div>
            <asp:Button runat="server" Text="Submit" OnClick="Unnamed3_Click" ID="btnSubmit"></asp:Button>&nbsp;</div>
        <div>
            <asp:GridView runat="server" AutoGenerateColumns="False" DataKeyNames="UserName" DataSourceID="SqlDataSource1" ID="ctl19">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SimpleDatabaseConnectionString %>" SelectCommand="SELECT [UserName], [Password] FROM [Logon]"></asp:SqlDataSource>
            &nbsp;
        </div>


    </form>
</body>
</html>
