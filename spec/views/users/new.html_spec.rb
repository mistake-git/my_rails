<h3 class="text-center mt-5">ユーザー新規作成</h3>
<div class="container pb-5">
  <% @user.errors.full_messages.each do |message| %>
    <div class="error-message">
      <%= message %>
    </div>
  <% end %>
  <%= form_tag("/users/create") do %>
  <div class="form-wrapper">
    <div class="form-group">
      <p class="text-center">ユーザー名</p>
      <input name="name" class="form-control" value="<%= @user.name %>">
    </div>
    <div class="form-group">
      <p class="text-center">メールアドレス</p>
      <input name="email" class="form-control"  value="<%= @user.email %>">
    </div>
    <div class="form-group">
      <p class="text-center">パスワード</p>
      <input name="password" class="form-control"  type="passwprd" value="<%= @user.password %>">
    </div>
    <input type="submit" class="btn btn-primary" value="新規登録">
    </div>
  <% end %>
</div>

