package com.wellheadstone.nemms.data.criterion.operands;

public class OrConjOperand extends AbstractOperand {

	public OrConjOperand() {
	}

	@Override
	protected String toExpression() {
		return " OR ";
	}
}
