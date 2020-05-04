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
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
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
    </form>
</body>
</html>
