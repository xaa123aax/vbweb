<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    註冊系統<br />
        <asp:LinkButton ID="Back" runat="server" PostBackUrl="login.aspx">回首頁</asp:LinkButton>

        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rig %>" DeleteCommand="DELETE FROM [login] WHERE [學號] = ?" InsertCommand="INSERT INTO [login] ([學號], [姓名], [密碼], [手機], [電子郵件]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:rig.ProviderName %>" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [姓名] = ?, [密碼] = ?, [手機] = ?, [電子郵件] = ? WHERE [學號] = ?">
            <DeleteParameters>
                <asp:Parameter Name="學號" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="學號" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="手機" Type="String" />
                <asp:Parameter Name="電子郵件" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密碼" Type="String" />
                <asp:Parameter Name="手機" Type="String" />
                <asp:Parameter Name="電子郵件" Type="String" />
                <asp:Parameter Name="學號" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="學號" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>
    </form>
</body>
</html>
