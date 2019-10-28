<nav class="navbar navbar-expand-lg navbar">
  <%=link_to("Standard Media","/",class:"navbar-brand")%>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse navbar-right" id="navbarText">
    <ul class="navbar-nav mr-auto">　
      <li>
        <span class="navbar-text">
          Standard Media
        </span>
      </li>
    </ul>
    <ul class="navbar-nav">
      <% if @current_user%>
        <% if @current_user.image.attached? %>
          <li class="nav-item"><%=link_to(image_tag(@current_user.image,class:"nav-link-img"),"/users/#{@current_user.id}")%></li>
        <% end %>
        <li class="nav-item">
          <%=link_to(@current_user.name,"/users/#{@current_user.id}",class:"nav-link")%>
        </li>
        <li class="nav-item">
          <%=link_to("/posts/new",class:"nav-link") do%>
          <span class="fa fa-edit"></span>新規投稿
          <%end%>
        </li>
        <li class="nav-item">
        <%=link_to("/posts/index",class:"nav-link") do%>
        <span class="fa fa-list"></span>投稿一覧
        </li>
        <%end%>
        <li class="nav-item">
          <%=link_to("/users/index",class:"nav-link") do%>
          <span class="fa fa-users"></span>ユーザー一覧
          <%end%>
        </li>
        <li class="nav-item">
          <%=link_to("/logout",{method: :post, class:"nav-link"}) do%>
            <span class="fa fa-sign-out"></span>ログアウト
            <%end%>
          </li>
        <%if @current_user.admin?%>
          <li class="nav-item"><%=link_to("サイト管理","/admin",class:"nav-link")%></li>
        <%end%>
      <%else%>
        <li class="nav-item">
          <%=link_to("/about",class:"nav-link") do%>
          <span class="fa fa-info-circle"></span>ABOUT
          <%end%>
        </li>
        <li class="nav-item">
          <%=link_to("/signup",class:"nav-link") do%>
          <span class="fa fa-user"></span>新規登録
          <%end%>
        </li>
        <li class="nav-item">
          <%=link_to("/login",class:"nav-link") do%>
          <span class="fa fa-sign-in"></span>ログイン
          <%end%>
        </li>
      <%end%>
    </ul>
  </div>
</nav>