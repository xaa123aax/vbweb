<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">


    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
        GridView1.DataBind()
    End Sub

    Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs)

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        GridView4.DataBind()





        If GridView4.Rows.Count < 1 Then
            message.Text = "就沒有吼"
        Else
            message.Text = ""
        End If

    End Sub

    Protected Sub GridView4_SelectedIndexChanged(sender As Object, e As EventArgs)

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
                <asp:MenuItem Text="編修" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="刪除" Value="3"></asp:MenuItem>
                <asp:MenuItem Text="查詢" Value="4"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
        <br />
    
    </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:personal_show %>" ProviderName="<%$ ConnectionStrings:personal_show.ProviderName %>" SelectCommand="SELECT * FROM [personal]"></asp:SqlDataSource>
                <br />
                <br />
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
                        <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
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
                        <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:personal_create %>" DeleteCommand="DELETE FROM [personal] WHERE [學號] = ?" InsertCommand="INSERT INTO [personal] ([學號], [姓名], [性別], [電話], [地址], [電子郵件], [age], [密碼]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:personal_create.ProviderName %>" SelectCommand="SELECT * FROM [personal]" UpdateCommand="UPDATE [personal] SET [姓名] = ?, [性別] = ?, [電話] = ?, [地址] = ?, [電子郵件] = ?, [age] = ?, [密碼] = ? WHERE [學號] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="學號" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="學號" Type="String" />
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter Name="密碼" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter Name="密碼" Type="String" />
                        <asp:Parameter Name="學號" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:edit_personal %>" DeleteCommand="DELETE FROM [personal] WHERE [學號] = ?" InsertCommand="INSERT INTO [personal] ([學號], [姓名], [性別], [電話], [地址], [電子郵件], [age], [密碼]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:edit_personal.ProviderName %>" SelectCommand="SELECT * FROM [personal]" UpdateCommand="UPDATE [personal] SET [姓名] = ?, [性別] = ?, [電話] = ?, [地址] = ?, [電子郵件] = ?, [age] = ?, [密碼] = ? WHERE [學號] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="學號" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="學號" Type="String" />
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter Name="密碼" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="姓名" Type="String" />
                        <asp:Parameter Name="性別" Type="String" />
                        <asp:Parameter Name="電話" Type="String" />
                        <asp:Parameter Name="地址" Type="String" />
                        <asp:Parameter Name="電子郵件" Type="String" />
                        <asp:Parameter Name="age" Type="Int32" />
                        <asp:Parameter Name="密碼" Type="String" />
                        <asp:Parameter Name="學號" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="學號">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                        <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                        <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                        <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                        <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                        <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                        <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                    </Columns>
                </asp:GridView>
        
            </asp:View>
                    <asp:View ID="View4" runat="server">
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:delete_personal %>" DeleteCommand="DELETE FROM [personal] WHERE [學號] = ?" InsertCommand="INSERT INTO [personal] ([學號], [姓名], [性別], [電話], [地址], [電子郵件], [age], [密碼]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:delete_personal.ProviderName %>" SelectCommand="SELECT * FROM [personal]" UpdateCommand="UPDATE [personal] SET [姓名] = ?, [性別] = ?, [電話] = ?, [地址] = ?, [電子郵件] = ?, [age] = ?, [密碼] = ? WHERE [學號] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="學號" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="學號" Type="String" />
                                <asp:Parameter Name="姓名" Type="String" />
                                <asp:Parameter Name="性別" Type="String" />
                                <asp:Parameter Name="電話" Type="String" />
                                <asp:Parameter Name="地址" Type="String" />
                                <asp:Parameter Name="電子郵件" Type="String" />
                                <asp:Parameter Name="age" Type="Int32" />
                                <asp:Parameter Name="密碼" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="姓名" Type="String" />
                                <asp:Parameter Name="性別" Type="String" />
                                <asp:Parameter Name="電話" Type="String" />
                                <asp:Parameter Name="地址" Type="String" />
                                <asp:Parameter Name="電子郵件" Type="String" />
                                <asp:Parameter Name="age" Type="Int32" />
                                <asp:Parameter Name="密碼" Type="String" />
                                <asp:Parameter Name="學號" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource4">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                                <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                                <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                                <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>

                <asp:View ID="View5" runat="server">


                    查詢系統<br style="color: rgb(0, 0, 0); font-family: &quot;Times New Roman&quot;; font-size: medium; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;" /> 請輸入學號:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" style="height: 21px" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:search1 %>" ProviderName="<%$ ConnectionStrings:search1.ProviderName %>" SelectCommand="SELECT * FROM [personal] WHERE ([學號] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="學號" PropertyName="Text" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource5">
                        <Columns>
                            <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                            <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                            <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                            <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                            <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                            <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                            <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:Label ID="message" runat="server" Text=""></asp:Label>
                </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
