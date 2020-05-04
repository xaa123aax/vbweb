<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">


    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
        GridView1.DataBind()
    End Sub

    Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs)

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        創意工作室資料庫<br />
        ADT105112_邱奕畯<br />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Text="瀏覽" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="新增" Value="1"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
        <br />
    
    </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:personal_show %>" ProviderName="<%$ ConnectionStrings:personal_show.ProviderName %>" SelectCommand="SELECT * FROM [personal]"></asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                        <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                        <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                        <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                        <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="125px" AutoGenerateRows="False" DataKeyNames="學號" DataSourceID="SqlDataSource2" DefaultMode="Insert">
                    <Fields>
                        <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                        <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                        <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                        <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                        <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:personal_create %>" DeleteCommand="DELETE FROM [personal] WHERE [學號] = ?" InsertCommand="INSERT INTO [personal] ([學號], [姓名], [性別], [電話], [地址], [電子郵件], [age]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:personal_create.ProviderName %>" SelectCommand="SELECT * FROM [personal]" UpdateCommand="UPDATE [personal] SET [姓名] = ?, [性別] = ?, [電話] = ?, [地址] = ?, [電子郵件] = ?, [age] = ? WHERE [學號] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="學號" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="學號" Type="Int32" />
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter Name="學號" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>

        </asp:MultiView>
    </form>
</body>
</html>
