class Previewer
  constructor: (gon) ->
    @preview = ko.observable gon.preview
    @formData = ko.observable gon.form_data

    @previewfunc = ko.computed =>
      @html = null
      $.ajax
        type: "POST"
        url: "/articles/preview"
        data: { markdown: @formData() }
      .done (responce) =>
        console.log responce.html
        @preview(responce.html)

$ ->
  ko.applyBindings new Previewer(gon)
