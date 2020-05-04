<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        GridView1.DataBind()

        GridView3.DataBind()
        GridView4.DataBind()
        GridView5.DataBind()
        Dim count
        count = GridView5.Rows.Count
        If count < 1 Then
            Label1.Text = "你沒有這個學生"
        Else
            Label1.Text = ""
        End If

    End Sub
    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
        GridView1.DataBind()
        GridView3.DataBind()
        GridView4.DataBind()
        GridView5.DataBind()
        If Menu1.SelectedValue = 5 Then
            Session.RemoveAll()
            Server.Transfer("login.aspx")

        End If
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
        個人基本資料管理<br />
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick" Orientation="Horizontal">
            <Items>
                <asp:MenuItem Text="瀏覽學生資料" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="新增學生資料" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="編輯學生資料" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="刪除學生資料" Value="3"></asp:MenuItem>
                <asp:MenuItem Text="查詢學生資料" Value="4"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="login.aspx" Text="登出" Value="5"></asp:MenuItem>

            </Items>
        </asp:Menu>
        <asp:MultiView ID="MultiView1" runat="server">
     <asp:View ID="View1" runat="server">
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:student %>" DeleteCommand="DELETE FROM [login] WHERE [學號] = ?" InsertCommand="INSERT INTO [login] ([學號], [姓名], [密碼], [手機], [電子郵件]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:student.ProviderName %>" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [姓名] = ?, [密碼] = ?, [手機] = ?, [電子郵件] = ? WHERE [學號] = ?">
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
                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1">
                     <Columns>
                         <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                         <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                         <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                         <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                         <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                     </Columns>
                 </asp:GridView>
             </asp:View>
            <asp:View ID="View2" runat="server">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:add %>" DeleteCommand="DELETE FROM [login] WHERE [學號] = ?" InsertCommand="INSERT INTO [login] ([學號], [姓名], [密碼], [手機], [電子郵件]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:add.ProviderName %>" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [姓名] = ?, [密碼] = ?, [手機] = ?, [電子郵件] = ? WHERE [學號] = ?">
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
                        <br />
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
            </asp:View>
            <asp:View ID="View3" runat="server">
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:edit %>" DeleteCommand="DELETE FROM [login] WHERE [學號] = ?" InsertCommand="INSERT INTO [login] ([學號], [姓名], [密碼], [手機], [電子郵件]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:edit.ProviderName %>" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [姓名] = ?, [密碼] = ?, [手機] = ?, [電子郵件] = ? WHERE [學號] = ?">
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
                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource3">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                        <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                        <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                        <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View4" runat="server">
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:del %>" DeleteCommand="DELETE FROM [login] WHERE [學號] = ?" InsertCommand="INSERT INTO [login] ([學號], [姓名], [密碼], [手機], [電子郵件]) VALUES (?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:del.ProviderName %>" SelectCommand="SELECT * FROM [login]" UpdateCommand="UPDATE [login] SET [姓名] = ?, [密碼] = ?, [手機] = ?, [電子郵件] = ? WHERE [學號] = ?">
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
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource4">
                    <Columns>
                                                
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="刪除" OnClientClick = "return confirm ('確定刪除?');"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                        <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                        <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                        <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                        <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View5" runat="server">
                 <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" />
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:find %>" ProviderName="<%$ ConnectionStrings:find.ProviderName %>" SelectCommand="SELECT * FROM [login] WHERE ([姓名] = ?)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox1" Name="姓名" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <br />
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource5">
                        <Columns>
                            <asp:BoundField DataField="學號" HeaderText="學號" SortExpression="學號" ReadOnly="True" />
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                            <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
                            <asp:BoundField DataField="手機" HeaderText="手機" SortExpression="手機" />
                            <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                        </Columns>
                    </asp:GridView>
                     <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>

            </asp:View>
            <asp:View ID="View6" runat="server"></asp:View>
            <asp:View ID="View7" runat="server"></asp:View>
            </asp:MultiView>
    </div>
    </form>
</body>
</html>
