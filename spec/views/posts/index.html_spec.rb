
  <h3 class="text-center mt-5">投稿一覧</h3>
  <div class="mt-3 mb-3">
    <%= form_tag("/posts/search",:method => "get") do %>
      <div class="form-group search-item search-item-form">
        <%= text_field_tag :search ,"" ,{class: "form-control"}%>
      </div>
      <div class="search-item">
        <%= submit_tag "検索", :name => nil ,class:"btn-sm btn-info search-btn"%>
      </div>
    <% end %>
  </div>
  
    <ul class="media-list mx-auto">
      <% @posts.each do |post| %>
        <li class="media">
          <%if post.user.image.attached?%>
            <div class="media-left">
              <%=link_to(image_tag(post.user.image,class:"post-user-img"),"/users/#{post.user.id}")%>
            </div>
          <%end%>
          <div class="media-body inner">
            <div class="media-heading">
              <%= link_to(post.user.name,"/users/#{post.user.id}")%>
            </div>
            <h4><%=link_to(post.title,"/posts/#{post.id}",class:"post-title")%></h4>
            <div class="created_at">
              <%=post.created_at%>
            </div>
            <span class="fa fa-star like-btn"></span>
            <div class="likes-count">
              <%@likes_count = Like.where(post_id: post.id).count%>
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

    <div class="pagenation text-center">
    <%= paginate @posts %>
    </div>
    
