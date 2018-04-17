@isTest
public class TestExpensesController {
  @isTest static void CreateOneExpense() {
    // Create mock data
    Expense__c[] expenses = TestDataFactory.createExpenses(1);

    // Perform test
    Test.startTest();
    Expense__c[] result = ExpensesController.getExpenses();
    Test.stopTest();

    // Assert List Size
    System.assertEquals(expenses.size(), result.size());

    // Fields to be Asserted
    String[] fieldsToCheck = new String[] {
      'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c'
    };

    // Assert each field defined
    for(String field : fieldsToCheck) {
      System.assertEquals(expenses[0].get(field), result[0].get(field));
    }
  }

  @isTest static void CreateMultipleExpenses() {
    // Create mock data
    Expense__c[] expenses = TestDataFactory.createExpenses(50);

    // Perform test
    Test.startTest();
    Expense__c[] result = ExpensesController.getExpenses();
    Test.stopTest();

    // Assert List Size
    System.assertEquals(expenses.size(), result.size());

    // Fields to be Asserted
    String[] fieldsToCheck = new String[] {
      'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c'
    };

    // Assert each field defined
    for(String field : fieldsToCheck) {
      System.assertEquals(expenses[0].get(field), result[0].get(field));
    }
  }
}
