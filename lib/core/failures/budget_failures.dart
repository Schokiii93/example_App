//Failures for Budget Entity
abstract class BudgetFailure {}

class InsufficientPermissions extends BudgetFailure {}

class UnexpectedFailure extends BudgetFailure {}
