<h3 class="text-center mt-5">投稿編集</h3>
<div class="container pb-5">
  <%= form_with scope: :post,  url: posts_update_path(@post),local: true, method: :patch do |form| %>
    <% @post.errors.full_messages.each do |message| %>
      <div class="error-message">
        <%= message %>
      </div>
    <% end %>
    <div class="form-wrapper">
    <div class="form-group">
      <p>画像選択</p>
      <%= form.file_field :image, class:"form-control" ,value: @post.image%>
    </div>
    <div class="form-group">
      <p>タイトル</p>
      <%= form.text_field :title, class:"form-control" , value: @post.title%>
    </div>
    <div class="form-group">
      <p>コンテンツ</p>
      <%= form.text_area :content, class:"form-control" , value: @post.content%>
    </div>
    <%= form.submit value="保存する",class:"btn btn-primary"%>
  <% end %>
</div>
</div>
