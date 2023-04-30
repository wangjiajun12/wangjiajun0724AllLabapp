<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTabularDataBound.aspx.cs" Inherits="LabAss4.ShowTabularDataBound" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <div style="height:300px">
            
            
            <h1 id="GridView">
            
            GridView
                <asp:GridView runat="server" DataSourceID="SqlDataSource1" ID="ctl0" AutoGenerateColumns="False" DataKeyNames="UserName">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName"></asp:BoundField>
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                    </Columns>
                </asp:GridView>
             </h1>

        </div>


        <div style="height:400px">
            
            <h1 id="DataList">DataList</h1>
            <asp:DataList runat="server" ID="ctl04" DataSourceID="SqlDataSource1" DataKeyField="UserName">
                <ItemTemplate>
                    UserName:
                    <asp:Label Text='<%# Eval("UserName") %>' runat="server" ID="UserNameLabel" /><br />
                    Password:
                    <asp:Label Text='<%# Eval("Password") %>' runat="server" ID="PasswordLabel" /><br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
        </div>


      <div style="height:200px">
         
            <h1 id="ListView">DatailsView</h1> <asp:DetailsView runat="server" Width="125px" Height="50px" DataSourceID="SqlDataSource1" ID="ctl07" AutoGenerateRows="False" DataKeyNames="UserName">
                <Fields>
                    <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName"></asp:BoundField>
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password"></asp:BoundField>
                </Fields>
            </asp:DetailsView></div>
       
     

         <div style="height:200px">
             <h1>FormView</h1>
             <asp:FormView runat="server" ID="ctl09" DataSourceID="SqlDataSource1" DataKeyNames="UserName">
                 <EditItemTemplate>
                     UserName:
                     <asp:Label Text='<%# Eval("UserName") %>' runat="server" ID="UserNameLabel1" /><br />
                     Password:
                     <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                     <asp:LinkButton runat="server" Text="更新" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="取消" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
                 </EditItemTemplate>
                 <InsertItemTemplate>
                     UserName:
                     <asp:TextBox Text='<%# Bind("UserName") %>' runat="server" ID="UserNameTextBox" /><br />
                     Password:
                     <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                     <asp:LinkButton runat="server" Text="插入" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="取消" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
                 </InsertItemTemplate>
                 <ItemTemplate>
                     UserName:
                     <asp:Label Text='<%# Eval("UserName") %>' runat="server" ID="UserNameLabel" /><br />
                     Password:
                     <asp:Label Text='<%# Bind("Password") %>' runat="server" ID="PasswordLabel" /><br />

                 </ItemTemplate>
             </asp:FormView>
         </div>


        <div style="height:200px">
            
            <h1>Repeater</h1>
            <asp:Repeater runat="server" DataSourceID="SqlDataSource1" ID="ctl11">
             <ItemTemplate>
                 <%#Eval("Username") %>
                    <i>--></i>
                 <%#Eval("password") %>
             </ItemTemplate>          
                
            </asp:Repeater>
        </div>


        <div style="height:200px">
            <h1>ListView</h1>2
            <asp:ListView runat="server" DataSourceID="SqlDataSource1" ID="ctl13">
                 <ItemTemplate>
                 <%#Eval("Username") %>
                    <i>--></i>
                 <%#Eval("password") %>
             </ItemTemplate> 
            </asp:ListView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:SimpleDatabaseConnectionString %>" SelectCommand="SELECT [UserName], [Password] FROM [Logon]"></asp:SqlDataSource>
        </div>


    </form>
</body>
</html>
