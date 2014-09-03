$ ->

  # APIを発行して結果を取得するサンプル

  FirstViewModel = () ->
    api =
      getJson: () ->
        defer = $.Deferred()
        $.ajax
          type: "GET"
          url: "/Knockout.js_api_demo/dist/api_dummy.json"
          dataType: "json"
          cache: false
          success: defer.resolve
          error: defer.reject
        defer.promise()
    self =
      items: ko.observableArray()
      getBtn: ->
        api.getJson().done (data) ->
          self.items(data)
          return
        return
    self

  if $("#firstView")[0]
    ko.applyBindings new FirstViewModel(), $("#firstView")[0]

  # セレクトボックスを操作するサンプル

  SecondViewModel = () ->
    self =
      left_lists: ko.observableArray(["A", "B", "C", "D", "E"])
      right_lists: ko.observableArray(["F", "G", "H", "I", "J"])
      selectedLeftList: ""
      selectedRightList: ""
      addRight: ->
        if self.selectedLeftList != ""
          self.right_lists.push(self.selectedLeftList)
          self.left_lists.remove(self.selectedLeftList)
          self.selectedLeftList = ""
        return
      addLeft: ->
        if self.selectedRightList != ""
          self.left_lists.push(self.selectedRightList)
          self.right_lists.remove(self.selectedRightList)
          self.selectedRightList = ""
        return
    self

  if $("#secondView")[0]
    ko.applyBindings new SecondViewModel(), $("#secondView")[0]

  return

