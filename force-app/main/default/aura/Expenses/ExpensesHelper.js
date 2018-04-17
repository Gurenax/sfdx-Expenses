({
  createExpense: function(component, newExpense) {
    // Save Action from Apex Controller
    var action = component.get('c.saveExpense')

    // Set parameter values
    action.setParams({
      expense: newExpense
    })
    
    // Callback to Action
    action.setCallback(this, function(response) {
      var state = response.getState()
      if (state === 'SUCCESS') {
        // Display new expense
        var expenses = component.get('v.expenses')
        //expenses.push(response.getReturnValue())
        expenses.unshift(response.getReturnValue())

        // Refresh list
        component.set('v.expenses', expenses)
      } else {
        // Log error
        console.log('Failed with state: ' + state)
      }
    })
    $A.enqueueAction(action)
  },
  updateExpense: function(component, expense) {
    // Save Action from Apex Controller
    var action = component.get("c.saveExpense")

    // Set parameter values
    action.setParams({
      "expense": expense
    })

    // Callback to Action
    action.setCallback(this, function(response){
      var state = response.getState()
      if (state === "SUCCESS") {
        // do nothing!
      } else {
        // Log error
        console.log('Failed with state: ' + state)
      }
    })
    $A.enqueueAction(action)
  }
})
