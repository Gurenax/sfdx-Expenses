({
  doInit: function(component, event, helper) {
    // Create Action from Apex Controller
    var action = component.get('c.getExpenses')
    console.log('before action.setCallback')
    // Callback to Action
    action.setCallback(this, function(response) {
      console.log('inside action.setCallback')
      var state = response.getState()
      console.log('after response.getState')
      if (state === 'SUCCESS') {
        console.log('SUCCESS')
        // Display list to view
        component.set('v.expenses', response.getReturnValue())
        console.log('response.getReturnValue()', response.getReturnValue())
      } else {
        // Log error
        console.log('Failed with state: ' + state)
      }
    })
    $A.enqueueAction(action)
  }
})
