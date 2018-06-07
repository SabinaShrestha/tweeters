$(document).ready( () => {
  $('.flippy').on('click', ({ target }) => { 
    const card = $(target).parent('.card-body')
    card.children('.c-body').toggleClass('hide')
    card.parent().addClass('animate')
    card.addClass('content-animate')
    setTimeout( () => {
      card.parent().removeClass('animate')
      card.removeClass('content-animate')
    }, 1000)
  })
})

