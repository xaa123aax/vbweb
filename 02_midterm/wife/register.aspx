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
    <p>
        肥宅註冊系統</p><asp:LinkButton ID="Back" runat="server" PostBackUrl="login.aspx">回首頁</asp:LinkButton>
        <p>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rigister %>" DeleteCommand="DELETE FROM [person] WHERE [帳號] = ?" InsertCommand="INSERT INTO [person] ([帳號], [暱稱], [信箱], [密碼], [電話]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:rigister.ProviderName %>" SelectCommand="SELECT * FROM [person]" UpdateCommand="UPDATE [person] SET [暱稱] = ?, [信箱] = ?, [密碼] = ?, [電話] = ? WHERE [帳號] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="帳號" Type="String" />
                    <asp:Parameter Name="暱稱" Type="String" />
                    <asp:Parameter Name="信箱" Type="String" />
                    <asp:Parameter Name="密碼" Type="String" />
                    <asp:Parameter Name="電話" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="暱稱" Type="String" />
                    <asp:Parameter Name="信箱" Type="String" />
                    <asp:Parameter Name="密碼" Type="String" />
                    <asp:Parameter Name="電話" Type="String" />
                    <asp:Parameter Name="帳號" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="帳號" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="帳號" HeaderText="帳號" ReadOnly="True" SortExpression="帳號" />
                <asp:BoundField DataField="暱稱" HeaderText="暱稱" SortExpression="暱稱" />
                <asp:BoundField DataField="信箱" HeaderText="信箱" SortExpression="信箱" />
                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                <asp:CommandField ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
</body>
</html>
    <p>
       </p>
    </form>

