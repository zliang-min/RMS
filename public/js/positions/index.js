var onLoadCallback = (function() {
  function enableDialogs() {
    $('.dialog').dialog({
      autoOpen: false,
      buttons: {
        Create: submitForm,
        Cancel: function() { $(this).dialog('close') }
      }
    }).each(function() {
      var d = $(this);
      d.dialog('option', 'title', d.attr('data-dialog-title')).
      dialog('option', 'height', d.attr('data-dialog-height')).
      dialog('option', 'width', d.attr('data-dialog-width')).
      dialog('option', 'modal', d.hasClass('modal'));
    });
  }

  function submitForm() {
    $(this).find('form').submit()
  }

  function _handleFormSubmit(form, options) {
    form.submit(function(event) {
      event.preventDefault();
      $.post(this.action + '.json', $(this).serialize(), function(data, statusText) {
        if(statusText == 'success') {
          if(options.onSuccess) options.onSuccess.call(form, data);
        } else {
          if(options.onError) options.onError.call(form, data);
        }
      }, 'json');
      return false;
    });
  }

  function handleFormSubmit() {
    _handleFormSubmit($('#category-form').find('form'), {
      onSuccess: function(data) {
        $('#category-form').dialog('close');
      },
      onError: function(data) {
        alert('opps');
      }
    });
    _handleFormSubmit($('#position-form').find('form'), {
      onSuccess: function(data) {
        $('#position-form').dialog('close');
      },
      onError: function(data) {
        alert('opps');
      }
    });
  }

  function activeLinks() {
    $.each(['position', 'category'], function() {
      var name = this;
      $('#button-link-' + name + '-new').click(function(event) {
        event.preventDefault();
        $('#' + name + '-form').dialog('open');
        return false;
      });
    });
  }

  return function() {
    enableDialogs();
    handleFormSubmit();
    activeLinks();
  }
})();
