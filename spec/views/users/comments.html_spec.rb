<div class="row">
  <div class="col-12 col-sm-5  mt-5 text-center">
<%= render partial: 'profile'%>
</div>

<div class="col-12 col-sm-7">
  <ul class="nav nav-tabs mb-3">
    <li class="nav-item"><%= link_to("投稿", "/users/#{@user.id}",class:"nav-link")%></li>
    <li class="nav-item"><%= link_to("いいねした投稿", "/users/#{@user.id}/likes",class:"nav-link") %></li>
    <li class="nav-item active"><%= link_to("コメント", "/users/#{@user.id}/comments",class:"nav-link") %></li>
  </ul>
  <ul class="media-list profile-media mx-auto">
    <% @comments.each do |comment| %>
      <li class="media">
        <%post=Post.find_by(id: comment.post_id)%>
        <%if comment.user.image.attached?%>
          <div class="media-left">
            <%=link_to(image_tag(comment.user.image,class:"post-user-img"),"/users/#{comment.user.id}")%>
          </div>
        <% end %>
        <div class="media-body inner">
          <div class="media-heading">
            <%= link_to(comment.user.name,"/users/#{comment.user.id}")%>
          </div>
          <div class="comment-content">
            <%= link_to(comment.content, "/posts/#{post.id}") %>
          </div>
        </div>
      </li>
    <% end %>
  </ul>
</div>
</div>
