<h3 class="text-center mt-5">ログイン</h3>
<% if @error_message%>
  <div class="error-message">
    <%=@error_message%>
  </div>
<%end%>
<div class="container pb-5">
  <%=form_tag("/login") do%>
  <div class="form-wrapper">
    <div class="form-group">
      <p class="text-center">メールアドレス</p>
      <input name="email" class="form-control" value="<%=@email%>">
    </div>
    <div class="form-group">
      <p class="text-center">パスワード</p>
      <input name="password" class="form-control" type="password" value="<%=@password%>">
    </div>
    <input type="submit" class=" btn btn-primary" value="ログイン">
    </div>
  <%end%>
</div>