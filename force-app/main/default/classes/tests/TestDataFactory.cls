@isTest
public class TestDataFactory {
  public static List<Expense__c> createExpenses(Integer numExpenses) {
    List<Expense__c> expenses = new List<Expense__c>();

    // Create list of expenses
    for(Integer i=0; i<numExpenses; i++) {
      Expense__c expense = new Expense__c(Name='Expense '+i,
                                          Amount__c=100+i,
                                          Client__c='Client '+i,
                                          Date__c=Date.newInstance(2018,01,01),
                                          Reimbursed__c=false);
      expenses.add(expense);
    }

    // Save expenses as test data
    insert expenses;
    return expenses;
  }

  public static List<Expense__c> createExpensesWithoutSave(Integer numExpenses) {
    List<Expense__c> expenses = new List<Expense__c>();

    // Create list of expenses
    for(Integer i=0; i<numExpenses; i++) {
      Expense__c expense = new Expense__c(Name='Expense '+i,
                                          Amount__c=100+i,
                                          Client__c='Client '+i,
                                          Date__c=Date.newInstance(2018,01,01),
                                          Reimbursed__c=false);
      expenses.add(expense);
    }

    // Return test data
    return expenses;
  }
}
