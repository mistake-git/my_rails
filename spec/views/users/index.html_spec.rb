<h3 class="text-center mt-5">ユーザー一覧</h3>
<div class="mt-3 mb-3" >
  <%= form_tag("/users/search",:method => "get") do %>
    <div class="form-group search-item search-item-form">
      <%= text_field_tag :search,"" ,{class: "form-control search-form"}%>
    </div>
    <div class="search-item">
      <%= submit_tag "検索", :name => nil,class:"btn-sm btn-info search-btn"%>
    </div>
  <% end %>
</div>

<ul class="media-list mx-auto">
  <%@users.each do |user|%>
    <li class="media">
      <%if user.image.attached?%>
        <div class="media-left">
          <%=link_to(image_tag(user.image,class:"post-user-img"),"/users/#{user.id}")%>
        </div>
      <%end%>
      <div class="media-body inner">
        <div class="media-heading user-index-name">
          <%=link_to(user.name,"/users/#{user.id}")%>
        </div>
        <div class="profile-user-introduce">
          <%= user.introduce %>
        </div>
      </div>
    </li>
  <%end%>
</ul>

<div class="pagenation text-center">
<%= paginate @users %>
</div>