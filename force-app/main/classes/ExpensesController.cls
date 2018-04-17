public with sharing class ExpensesController {
  public ExpensesController() {
    
  }

  @AuraEnabled
  public static List<Expenses__c> getExpenses() {
    List<Expenses__c> expenses = new List<Expenses__c>();
    
    // Validate field-level security
    if(Schema.sObjectType.Expenses__c.fields.Id.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.Name.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.Amount__c.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.Client__c.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.Date__c.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.Reimbursed__c.isAccessible() &&
      Schema.sObjectType.Expenses__c.fields.CreatedDate.isAccessible()) {
        // Retrieve expenses
        expenses = [SELECT Id, Name, Amount__c, Client__c,
                      Date__c, Reimbursed__c, CreatedDate
                FROM Expense__c];
    }

    return expenses;
  }
}
