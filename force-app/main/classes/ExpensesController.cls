public with sharing class ExpensesController {
  @AuraEnabled
  public static List<Expense__c> getExpenses() {
    List<Expense__c> expenses = new List<Expense__c>();
    
    // Check to make sure all fields are accessible to this user
    String[] fieldsToCheck = new String[] {
      'Id', 'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c', 'CreatedDate'
    };

    // Get field names
    Map<String,Schema.SObjectField> fieldDescribeTokens =
        Schema.SObjectType.Expense__c.fields.getMap();

    // Validate field-level security
    for(String field : fieldsToCheck) {
      if( !fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
        throw new System.NoAccessException();
        return null;
      }
    }

    // No issues, proceed to Retrieve expenses
    expenses = [SELECT Id, Name, Amount__c, Client__c,
                  Date__c, Reimbursed__c, CreatedDate
            FROM Expense__c
            ORDER BY CreatedDate DESC];

    return expenses;
  }

  @AuraEnabled
  public static Expense__c saveExpense(Expense__c expense) {

    // Check to make sure all fields are accessible to this user
    String[] fieldsToCheck = new String[] {
      'Id', 'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c', 'CreatedDate'
    };

    // Get field names
    Map<String,Schema.SObjectField> fieldDescribeTokens =
        Schema.SObjectType.Expense__c.fields.getMap();

    // Validate field-level security
    for(String field : fieldsToCheck) {
      if( !fieldDescribeTokens.get(field).getDescribe().isUpdateable()) {
        throw new System.NoAccessException();
        return null;
      }
    }

    // Perform isUpdatable() checking first, then
    upsert expense;
    return expense;
  }
}
