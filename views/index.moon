import to_json from require "lapis.util"

class Index extends require "widgets.base"

  inner_content: =>
    div class: "home_columns", ->
      div class: "column", ->
        h2 ->
          text "Recent Modules"
          text " "
          span class: "header_sub", ->
            text "("
            a href: @url_for("manifest", manifest: "root"), "View all"
            text ")"

        @render_modules @recent_modules

      div class: "column last", ->
        h2 "Popular Modules"
        @render_modules @popular_modules

    h2 "Daily Downloads"
    div id: "downloads_graph", class: "graph_container"

    @raw_ssi "home.html"

    @content_for "js_init", ->
      script type: "text/javascript", src: "/static/lib/jquery-2.1.1.min.js"
      script type: "text/javascript", src: "/static/lib/d3.min.js"
      script type: "text/javascript", src: "/static/main.js"

      script type: "text/javascript", ->
        raw "new M.Index(#{@widget_selector!}, #{to_json @downloads_daily});"

