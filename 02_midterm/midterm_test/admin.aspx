<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button1_Click1(sender As Object, e As EventArgs)
        If FileUpload1.HasFile Then

            Dim filePlace = “uploads/” + FileUpload1.FileName

            Dim RealPlace = Server.MapPath(filePlace)

            FileUpload1.SaveAs(RealPlace)

            message.Text = “上傳成功”

        Else

            message.Text = “上傳失敗”

        End If
    End Sub
    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
        GridView2.DataBind()
        If Menu1.SelectedValue = 3 Then
            Session.RemoveAll()
            Server.Transfer("login.aspx")
        ElseIf Menu1.SelectedValue = 0 Then
            Server.Transfer("admin1.aspx")
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
    

            10824數位系數位學習系統

             
            <br />
            <br />
            <br />

            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Text="個人基本資料管理" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="學生成績管理" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="上傳檔案" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="登出" Value="3" NavigateUrl="login.aspx"></asp:MenuItem>
            </Items>
               
        </asp:Menu>

            <br />

          <asp:MultiView ID="MultiView1" runat="server">
 

        
             <asp:View ID="View1" runat="server">
             </asp:View>
             <asp:View ID="View2" runat="server">
                 <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:scoretest %>" DeleteCommand="DELETE FROM [score] WHERE [學號] = ?" InsertCommand="INSERT INTO [score] ([學號], [測驗日期], [測驗學科], [測驗成績]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:scoretest.ProviderName %>" SelectCommand="SELECT * FROM [score]" UpdateCommand="UPDATE [score] SET [測驗日期] = ?, [測驗學科] = ?, [測驗成績] = ? WHERE [學號] = ?">
                     <DeleteParameters>
                         <asp:Parameter Name="學號" Type="String" />
                     </DeleteParameters>
                     <InsertParameters>
                         <asp:Parameter Name="學號" Type="String" />
                         <asp:Parameter Name="測驗日期" Type="String" />
                         <asp:Parameter Name="測驗學科" Type="String" />
                         <asp:Parameter Name="測驗成績" Type="String" />
                     </InsertParameters>
                     <UpdateParameters>
                         <asp:Parameter Name="測驗日期" Type="String" />
                         <asp:Parameter Name="測驗學科" Type="String" />
                         <asp:Parameter Name="測驗成績" Type="String" />
                         <asp:Parameter Name="學號" Type="String" />
                     </UpdateParameters>
                 </asp:SqlDataSource>
                 <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource2">
                     <Columns>
                         <asp:CommandField ShowEditButton="True" />
                         <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                         <asp:BoundField DataField="測驗日期" HeaderText="測驗日期" SortExpression="測驗日期" />
                         <asp:BoundField DataField="測驗學科" HeaderText="測驗學科" SortExpression="測驗學科" />
                         <asp:BoundField DataField="測驗成績" HeaderText="測驗成績" SortExpression="測驗成績" />
                     </Columns>
                 </asp:GridView>
             </asp:View>
             <asp:View ID="View3" runat="server">
                  檔案上傳練習<br />
        <br />
        &nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />

        <br />

   
        <asp:Button ID="Button1" runat="server" Text="上傳" OnClick="Button1_Click1" />
        <br />
    
    </div>
        <p>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
    
        </p>
             </asp:View>
             <asp:View ID="View4" runat="server">

             </asp:View>

       </asp:MultiView>
    </div>
        
    </form>
</body>
</html>
