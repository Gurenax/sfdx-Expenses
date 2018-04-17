public with sharing class ExpensesController {
  @AuraEnabled
  public static List<Expense__c> getExpenses() {
    List<Expense__c> expenses = new List<Expense__c>();
    
    // Validate field-level security
    if(Schema.sObjectType.Expense__c.fields.Id.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.Name.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.Amount__c.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.Client__c.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.Date__c.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.Reimbursed__c.isAccessible() &&
      Schema.sObjectType.Expense__c.fields.CreatedDate.isAccessible()) {
        // Retrieve expenses
        expenses = [SELECT Id, Name, Amount__c, Client__c,
                      Date__c, Reimbursed__c, CreatedDate
                FROM Expense__c
                ORDER BY CreatedDate DESC];
    }

    return expenses;
  }

  @AuraEnabled
  public static Expense__c saveExpense(Expense__c expense) {
    // Perform isUpdatable() checking first, then
    upsert expense;
    return expense;
  }
}
