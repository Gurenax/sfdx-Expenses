({
  doInit: function(component, event, helper) {
    // Create Action from Apex Controller
    var action = component.get('c.getExpenses')
    
    // Callback to Action
    action.setCallback(this, function(response) {
      
      var state = response.getState()
      
      if (state === 'SUCCESS') {
        // Display list to view
        component.set('v.expenses', response.getReturnValue())

      } else {
        // Log error
        console.log('Failed with state: ' + state)
      }
    })
    $A.enqueueAction(action)
  },
  handleCreateExpense: function(component, event, helper) {
    // Get event parameter values
    var newExpense = event.getParam("expense")
    // Call createExpense helper
    helper.createExpense(component, newExpense)
  },
  handleUpdateExpense: function(component, event, helper) {
    // Get event parameter values
    var updatedExpense = event.getParam("expense")
    // Call updateExpense helper
    helper.updateExpense(component, updatedExpense);
  }
})
