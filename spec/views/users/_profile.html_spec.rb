  <div class="profile-main">
    <%if @user.image.attached?%>
      <div class="profile-image">
        <%= image_tag @user.image,class:"profile-image" %>
      </div>
    <%end%>
    <div class="profile-content user-name">
      <h4><%= @user.name %></h4>
    </div>
    <div class="profile-content user-email">
      <%= @user.email %>
    </div>
    <div class="profile-content user-introduce">
      <%= @user.introduce %>
    </div>
    <%if @user.id==@current_user.id%>
      <div class="ml-1 mr-1">
        <%= link_to("編集", "/users/#{@user.id}/edit",class:"btn-sm btn-primary") %>
        <%= link_to("削除", "/users/#{@user.id}/destroy",method:"delete",class:"btn-sm btn-danger")%>
        <p class="mt-3">※削除するとユーザーに関する全てのデータが削除されます</p>
      </div>
    <%end%>
  </div>

