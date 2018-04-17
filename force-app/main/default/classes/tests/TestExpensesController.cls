@isTest
public class TestExpensesController {
  @isTest static void GetOneExpense() {
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

  @isTest static void GetMultipleExpenses() {
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

  @isTest static void SaveOneExpense() {
    // Create mock data
    Expense__c expense = new Expense__c(Name='Expense 0',
                                          Amount__c=100,
                                          Client__c='Client 0',
                                          Date__c=Date.newInstance(2018,01,01),
                                          Reimbursed__c=false);
    // Perform test
    Test.startTest();
    Expense__c result = ExpensesController.saveExpense(expense);
    Test.stopTest();

    // Fields to be Asserted
    String[] fieldsToCheck = new String[] {
      'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c'
    };

    // Assert each field defined
    for(String field : fieldsToCheck) {
      System.assertEquals(expense.get(field), result.get(field));
    }
  }

  @isTest static void SaveMultipleExpenses() {
    // Create mock data
    Expense__c[] expenses = TestDataFactory.createExpensesWithoutSave(50);

    // Perform test
    Test.startTest();
    Expense__c[] results = new List<Expense__c>();
    for(Expense__c expense : expenses) {
      Expense__c result = ExpensesController.saveExpense(expense);
      results.add(result);
    }
    Test.stopTest();

    // Fields to be Asserted
    String[] fieldsToCheck = new String[] {
      'Name', 'Amount__c', 'Client__c',
      'Date__c', 'Reimbursed__c'
    };

    // Assert each field defined for every record saved
    for(String field : fieldsToCheck) {
      for(Integer i=0; i<expenses.size(); i++) {
        System.assertEquals(expenses[i].get(field), results[i].get(field));
      }
    }
  }
}
