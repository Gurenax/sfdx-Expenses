({
  updateExpense: function(component, updatedExpense) {
    // Fire updateExpense event
    var updateEvent = component.getEvent('updateExpense')
    // Set updated expense
    updateEvent.setParams({
      expense: updatedExpense
    })
    updateEvent.fire()
  }
})
