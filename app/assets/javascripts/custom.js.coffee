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
    div_id = $(this).attr("id")
    #alert $(this).attr("data-url")
    #TODO: make this generic so it will update idea-* or event-*
    $.ajax
      url: $(this).attr("data-url"),
      type: 'GET',
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        reaction = data['reaction']
        $("##{div_id}").raty
          path: "/assets"
          score: reaction
          readOnly: $("##{div_id}").attr("data-readonly")
          click: (score,evt) ->
            $.ajax
              url: $(this).attr("data-url"),
              type: 'PATCH',
              dataType: 'json',
              data: { event: { reaction: score } }
              success: ->
                refreshRatings()
  
