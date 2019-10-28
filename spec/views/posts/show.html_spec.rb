<h3 class="text-center mt-5">投稿詳細</h3>

<div class="post">
  <div class="post-left">
    <%if @user.image.attached?%>
      <%= image_tag @user.image, class:"post-user-img"%>
    <% end %>
    <div class="post-left-item">
      <%= link_to(@user.name, "/users/#{@user.id}") %>
    </div>
    <div class="created_at post-left-item">
      <%=@post.created_at%>
    </div>
  </div>
  <div class="post-center">
    <h2 class="post-show-title"><%=@post.title%></h2>
    <%if @post.image.attached?%>
      <div class="post-image">
        <%= image_tag @post.image ,class:"post-img"%>
      </div>
    <% end %>
    <div class="post-content">
      <%=@post.content%>
    </div>
    <div class="text-left ml-5">
      <% if Like.find_by(user_id: @current_user.id, post_id: @post.id) %>
        <%= link_to("/likes/#{@post.id}/destroy", {method: "post"}) do %>
          <span class="fa fa-star like-btn"></span>
        <% end %>
      <% else %>
        <%= link_to("/likes/#{@post.id}/create", {method: "post"}) do %>
          <span class="fa fa-star like-btn-unlike"></span>
        <%end%>
      <% end %>
      <%= @likes_count %>
    </div>
    <%if @user.id==@current_user.id%>
      <div class="btn-wrapper">
        <div class="btn-edit">
          <%=link_to("編集", "/posts/#{@post.id}/edit",class:"btn-sm btn-primary")%>
        </div>
        <div class="btn-destroy">
          <%=link_to("削除", "/posts/#{@post.id}/destroy",method:"delete",class:"btn-sm btn-danger")%>
        </div>
      </div>
    <% end %>
  </div>
</div>



<p class=comment>コメント</p>
<div class="comment-area">
  <ul class ="media-list mx-auto">
    <%@comments.each do |comment|%>
      <li class="media">
        <%if comment.user.image.attached?%>
          <div class="media-left">
            <%=link_to(image_tag(comment.user.image,class:"post-user-img"),"/users/#{comment.user.id}")%>
          </div>
        <% end %>
        <div class="media-body inner">
          <div class="media-heading">
            <%= link_to(comment.user.name,"/users/#{comment.user.id}")%>
          </div>
          <div class-"comment-content">
            <%=comment.content%>
          </div>
          <%if comment.user.id==@current_user.id%>
            <div class="comment-destroy-btn">
              <%=link_to("削除", "/posts/#{@post.id}/comments/#{comment.id}",method:"delete",class:"btn-sm btn-danger")%>
            </div>
          <%end%>
        </div>
      </li>
    <%end%>
  </ul>
</div>

<div class="form comment-form">
  <%= form_tag("/posts/#{@post.id}/comments",{method:"post"}) do%>
    <div class="form-group">
      <input name="content" class="form-control" required>
    </div>
    <input type="submit" value="コメントする" class="btn-sm btn-primary">
  <% end %>
</div>

