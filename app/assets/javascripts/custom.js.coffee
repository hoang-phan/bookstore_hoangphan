$ ->
  setTimeout (->
    $(".alert").remove()
    return
  ), 5000
  $("#per-page").val $("#tag-per-page").val()
  $(".rating-star").hover ->
    $(this).prevAll().attr "src", "/assets/star-active.png"
    $(this).attr "src", "/assets/star-active.png"
    $(this).nextAll().attr "src", "/assets/star-inactive.png"
    $("#comment_rating").val $(".rating-star").index(this) + 1
    return

  $("#per-page").change ->
    $.post "/books/change_per_page",
      per_page: $(this).val()
    , ->
      window.location.reload()
      return

    return

  $("#choose-category").click ->
    $("#categories-menu").dropdown()
    return

  $("#category-search").click ->
    $("#search-menu").dropdown()
    return

  $("#search-menu li").click ->
    $("#category-search span").html "| " + $(this).find(".value").html()
    category_id = $(this).find(".hidden").html()
    $("#category_id").val category_id
    return

  $("#search-button").click ->
    $("#search-top").submit()
    return

  $(".edit_order_line").on "click", ".submit-quantity", ->
    $(this).parent().submit()
    return

  $("#paypal-submit").click (e) ->
    e.preventDefault()
    $(".edit_order").attr "action", "/orders/paypal"
    $(".edit_order").submit()
    return

  $("#hide-comment").click ->
    $(".add-comment").toggle()
    return

  return
