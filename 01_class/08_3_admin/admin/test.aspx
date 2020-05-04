<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        question_total.Text = 10
        studentNo.Text = Session("username")
    End Sub
    Sub ran()
        Dim generator As New Random
        add1.Text = generator.Next(1, 10)
        add2.Text = generator.Next(1, 10)
    End Sub

    Sub WriteToTest()
        Dim test_id As String = Session("userid")
        Dim test_subject As String = "數學"
        '將日期傳成字串
        Dim test_date As String = Now
        Dim test_score As Integer = CInt(total.Text)

        Dim insert_data As String
        '設計 insert into 的 SQL指令，注意：字串前後需有 單引號，否則會出現缺少引號錯誤
        insert_data = "INSERT INTO test (學號, 測驗學科, 測驗日期, 測驗成績) VALUES ( '" & test_id & "',' " & test_subject & "', '" & test_date & "'," & test_score & ")"

        'insert 的手動程序，注意 下行的insert_test 是要寫入Sqldatasource 的ID
        SqlDataSource1.InsertCommand = insert_data
        SqlDataSource1.Insert()
    End Sub

    Protected Sub Button1_Click1(sender As Object, e As EventArgs)
        ran()
        No.Text = CInt(1)
        total.Text = CInt(0)
    End Sub

    Protected Sub Button2_Click1(sender As Object, e As EventArgs)
        If CInt(answer.Text) = CInt(add1.Text) + CInt(add2.Text) Then
            total.Text = CInt(total.Text) + 10
        End If
        answer.Text = ""
        ran()
        No.Text = CInt(No.Text) + 1
        If CInt(No.Text) > CInt(question_total.Text) Then
            message.Text = "測驗結束，測驗成績：" & total.Text
            Button1.Enabled = False
            Button2.Enabled = False
            No.Text = ""
            add1.Text = "被加數"
            add2.Text = "加數"
            go_back.Visible = True
        End If
    End Sub

    Protected Sub go_back_Click1(sender As Object, e As EventArgs)

        WriteToTest()
        Server.Transfer("login.aspx")
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
     <p>
        線上測驗</p>
    <p>
        <asp:Label ID="studentNo" runat="server" Text=""></asp:Label>
        號同學:安好</p>
    <p>
        本測驗共10題，每題10分，總計100分。</p>
    <p>
        準備好了嗎<asp:Button ID="Button1" runat="server" Text="開始測驗" OnClick="Button1_Click1" />
    </p>
    <p>
        第<asp:Label ID="No" runat="server" Text=""></asp:Label>
        題:
        <asp:Label ID="add1" runat="server" Text="加數"></asp:Label>+
        <asp:Label ID="add2" runat="server" Text="被加數"></asp:Label>

        =<asp:TextBox ID="answer" runat="server"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" Text="確認繳交" OnClick="Button2_Click1" />
    </p>
    <p>
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:Button ID="go_back" runat="server" Text="結束測驗" OnClick="go_back_Click1" />
    </p>
    <p>
        <asp:Label ID="total" runat="server" Text=""></asp:Label>
    </p>
    <p>
        <asp:Label ID="question_total" runat="server" Text=""></asp:Label>
    </p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:insert_test %>" DeleteCommand="DELETE FROM [test] WHERE [學號] = ?" InsertCommand="INSERT INTO [test] ([學號], [測驗學科], [測驗日期], [測驗成績]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:insert_test.ProviderName %>" SelectCommand="SELECT * FROM [test]" UpdateCommand="UPDATE [test] SET [測驗學科] = ?, [測驗日期] = ?, [測驗成績] = ? WHERE [學號] = ?">
            <DeleteParameters>
                <asp:Parameter Name="學號" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="學號" Type="String" />
                <asp:Parameter Name="測驗學科" Type="String" />
                <asp:Parameter Name="測驗日期" Type="String" />
                <asp:Parameter Name="測驗成績" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="測驗學科" Type="String" />
                <asp:Parameter Name="測驗日期" Type="String" />
                <asp:Parameter Name="測驗成績" Type="Int32" />
                <asp:Parameter Name="學號" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
<p>
    &nbsp;</p>
    </div>
    </form>
</body>
</html>
