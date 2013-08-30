$ ->
  # Refresh if a page is loaded directly
  pageLoad()
  
  # Refresh if a page is loaded via turbolinks
  $(document).on "page:load", pageLoad

pageLoad = ->
  # Steps to do on a page load (with turbolinks)
  
  # Refresh all ratings on the current page
  refreshRatings()
  
  # Refresh for the new event divs that are shown on a idea show
  $(".idea-overview-title").on "ajax:success", (event) ->
    refreshRatings()

refreshRatings = ->
  $(".rating").each (index,value) ->
    $(this).raty
      path: "/assets"
