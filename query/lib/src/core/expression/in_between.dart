part of query;

/// An in-between conditional expression
class Between<ValType> extends Expression {
  /// The field/column of the condition
  final Col<ValType> field;

  /// The low value of the in-between condition
  final ValType low;

  /// The high value of the in-between condition
  final ValType high;

  const Between(this.field, this.low, this.high);

  /// Always returns 1 because in-between is not a composite expression
  int get length => 1;

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  And and(Expression exp) {
    And ret = new And();
    return ret.and(this).and(exp);
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  Or or(Expression exp) {
    Or ret = new Or();
    return ret.or(this).or(exp);
  }
}

/// An in-between conditional expression
class InBetweenCol<ValType> extends Expression {
  /// The field/column of the condition
  final Col<ValType> field;

  /// The low value of the in-between condition
  final Col<ValType> low;

  /// The high value of the in-between condition
  final Col<ValType> high;

  const InBetweenCol(this.field, this.low, this.high);

  /// Always returns 1 because in-between is not a composite expression
  int get length => 1;

  /// Creates a 'logical and' expression of this expression and the [other]
  @checked
  And and(Expression exp) {
    And ret = new And();
    return ret.and(this).and(exp);
  }

  /// Creates a 'logical or' expression of this expression and the [other]
  @checked
  Or or(Expression exp) {
    Or ret = new Or();
    return ret.or(this).or(exp);
  }
}
