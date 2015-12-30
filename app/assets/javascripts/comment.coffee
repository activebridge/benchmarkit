$ ->
  $('#new_comment').on 'click', '#check_better', (e)->
    e.preventDefault()
    before = $('#comment_comment_battle_attributes_before').val()
    after = $('#comment_comment_battle_attributes_after').val()
    $.ajax(
      method: 'post'
      url: '/battles/count'
      data:
        battle:
          before: before
          after: after
        comment: '1'
    )

  $('#new_comment').on 'click', '#clear_better', (e)->
    e.preventDefault()
    $('#comment_comment_battle_attributes_after').val('')
    $('#result').empty()

  $('#comment_modal').on 'click', '#add_comment', ()->
    $('form#new_comment').submit()
