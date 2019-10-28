<!DOCTYPE html>
<html>
  <head>
    <title>Standard Media</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>
    <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
    　　<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    　　<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Raleway:700,400">
  </head>
  <body>
    <%if flash[:notice]%>
      <div class="flash">
        <%=flash[:notice]%>
      </div>
    <%end%>
    <%= render 'layouts/header' %>
    <div class='main'>
      <%= yield %>
    </div>
    <%= render 'layouts/footer' %>
  </body>
</html>