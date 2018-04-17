({
  createExpense: function(component, newExpense) {
    // Fire createExpense event
    var createEvent = component.getEvent('createExpense')
    // Set new expense
    createEvent.setParams({
      expense: newExpense
    })
    createEvent.fire()
  }
})
