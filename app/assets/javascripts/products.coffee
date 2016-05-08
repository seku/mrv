$(document).ready ->
	$('.dialog .js-switch-preview').on 'click',  (_event) ->
		$this = $(this)
		$dialogGallery = $this.closest('.dialog-gallery')
		$preview = $dialogGallery.find('.preview')

		$preview.attr 'src', $this.attr('data-large')
		$dialogGallery.find('li.active').removeClass 'active'
		$this.closest('li').addClass 'active'

		$this.closest('.dialog-container').animate { scrollTop: 0 }, 400

		return
