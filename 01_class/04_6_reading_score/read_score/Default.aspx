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
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ADT105112_邱奕畯_資料庫ConnectionString %>" ProviderName="<%$ ConnectionStrings:ADT105112_邱奕畯_資料庫ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [score]"></asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="國文" HeaderText="國文" SortExpression="國文" />
                <asp:BoundField DataField="英文" HeaderText="英文" SortExpression="英文" />
                <asp:BoundField DataField="數學" HeaderText="數學" SortExpression="數學" />
                <asp:BoundField DataField="自然" HeaderText="自然" SortExpression="自然" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
