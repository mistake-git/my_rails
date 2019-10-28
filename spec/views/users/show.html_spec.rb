<div class="row">
  <div class="col-12 col-sm-5  mt-5 text-center">
<%= render partial: 'profile'%>
</div>

<div class="col-12 col-sm-7">
  <ul class="nav nav-tabs mb-3">
    <li class="nav-item active"><%= link_to("投稿", "/users/#{@user.id}",class:"nav-link")%></li>
    <li class="nav-item"><%= link_to("いいねした投稿", "/users/#{@user.id}/likes",class:"nav-link") %></li>
    <li class="nav-item"><%= link_to("コメント", "/users/#{@user.id}/comments",class:"nav-link") %></li>
  </ul>
 
  <ul class="media-list profile-media mx-auto">
    <% @user.posts.each do |post| %>
      <li class="media">
        <%if post.user.image.attached?%>
          <div class="media-left">
           <%=link_to(image_tag(post.user.image,class:"post-user-img"),"/users/#{post.user.id}")%>
          </div>
        <%end%>
        <div class="media-body inner">
          <div class="media-heading">
            <%= link_to(post.user.name, "/users/#{post.user.id}") %>
          </div>
          <h4> <%= link_to(post.title, "/posts/#{post.id}",class:"post-title") %></h4>
          <div class="created_at">
            <%=post.created_at%>
          </div>
          <%@likes_count = Like.where(post_id: post.id).count%>
          <span class="fa fa-star like-btn"></span>
          <div class="likes-count">
            <%= @likes_count %>
          </div>
        </div>
        <%if post.image.attached?%>
          <div class="media-right mt-4 mr-5">
            <%= image_tag post.image,class:"post-media-img"%>
          </div>
        <%end%>
      </li>
    <%end%>
  </ul>
</div>
</div>
