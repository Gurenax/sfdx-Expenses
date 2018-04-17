({
  toggleReimbursed: function(component, event, helper) {
    // Get updated expense
    var updatedExpense = component.get('v.expense')
    console.log('Updated expense: ' + JSON.stringify(updatedExpense))

    // Call updateExpense helper
    helper.updateExpense(component, updatedExpense)
  }
})
